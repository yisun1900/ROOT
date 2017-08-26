<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String khbh=request.getParameter("khbh");
String psph=request.getParameter("psph");
String[] clbm=request.getParameterValues("clbm");
String[] psslStr=request.getParameterValues("pssl");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String psdzt=null;
	ls_sql=" SELECT psdzt ";
	ls_sql+=" FROM jxc_clpsd ";
    ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		psdzt=cf.fillNull(rs.getString("psdzt"));
	}
	rs.close();
	ps.close();

	if (!psdzt.equals("0") && !psdzt.equals("6"))//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：审核未通过；7：作废；
	{
		out.print("错误！材料单["+psph+"]已提交，不能再修改！");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		double pssl = Double.parseDouble(psslStr[i]);

		String xsfs="";
		double zcpzsl=0;
		double dhsl=0;
		ls_sql="select xsfs,zcpzsl,dhsl";
		ls_sql+=" from  jxc_cljgb";
		ls_sql+=" where jxc_cljgb.clbm='"+clbm[i]+"' and  jxc_cljgb.dqbm='"+dqbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xsfs=cf.fillNull(rs.getString("xsfs"));
			zcpzsl=rs.getDouble("zcpzsl");
			dhsl=rs.getDouble("dhsl");
		}
		rs.close();
		ps.close();

		if (xsfs.equals("2"))//1：代销品；2：现货销售；3：期货销售；4：允许负库存
		{
			if (pssl > (zcpzsl-dhsl))
			{
				conn.rollback();
				out.println("错误！现货销售，【开单数量"+pssl+"】不能大于【可订货数量"+(zcpzsl-dhsl)+"】，可订货数量＝正常品库存－订货");
				return;
			}
		}

		ls_sql="update jxc_clpsmx set sqpssl=?,pssl=?,psje=dj*?";
		ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,pssl);
		ps.setDouble(2,pssl);
		ps.setDouble(3,pssl);
		ps.executeUpdate();
		ps.close();

	}


	double pszsl=0;
	double pszje=0;
	double cbze=0;
	ls_sql=" SELECT sum(pssl),sum(psje),sum(cbj*pssl) ";
	ls_sql+=" FROM jxc_clpsmx ";
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		pszsl=rs.getDouble(1);
		pszje=rs.getDouble(2);
		cbze=rs.getDouble(3);
	}
	rs.close();
	ps.close();

	ls_sql="update jxc_clpsd set pszsl="+pszsl+",pszje="+pszje+",cbze="+cbze;
	ls_sql+=" where psph='"+psph+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>