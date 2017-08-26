<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=request.getParameter("dqbm");
String xsph=request.getParameter("xsph");
String[] clbm=request.getParameterValues("clbm");
String[] xsslStr=request.getParameterValues("xssl");
String[] xsjStr=request.getParameterValues("xsj");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String xsdzt=null;
	ls_sql=" SELECT xsdzt ";
	ls_sql+=" FROM jxc_fcxsd ";
	ls_sql+=" where xsph='"+xsph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xsdzt=cf.fillNull(rs.getString("xsdzt"));
	}
	rs.close();
	ps.close();

	if (!xsdzt.equals("0"))//0：未提交；2：提交；3：已出库 
	{
		out.print("错误！销售批号["+xsph+"]已提交，不能再修改！");
		return;
	}


	conn.setAutoCommit(false);

	for (int i=0;i<clbm.length ; i++)
	{
		double xssl = Double.parseDouble(xsslStr[i]);
		double xsj = Double.parseDouble(xsjStr[i]);

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
			if (xssl > zcpzsl)
			{
				conn.rollback();
				out.println("错误！现货销售，【开单数量"+xssl+"】不能大于【正常品库存数"+zcpzsl+"】");
				return;
			}
		}

		ls_sql="update jxc_fcxsmx set xssl=?,xsj=?,xsje=?*?,cbje=cbj*?";
		ls_sql+=" where xsph='"+xsph+"' and clbm='"+clbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,xssl);
		ps.setDouble(2,xsj);
		ps.setDouble(3,xssl);
		ps.setDouble(4,xsj);
		ps.setDouble(5,xssl);
		ps.executeUpdate();
		ps.close();

	}


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