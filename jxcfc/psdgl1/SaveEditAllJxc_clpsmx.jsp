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

	if (!psdzt.equals("0"))//0：等待提交；2：等待出库；3：已出库；5：部分出库
	{
		out.print("错误！配送单["+psph+"]已提交，不能再修改！");
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
				out.println("错误！现货销售，【配送数量"+pssl+"】不能大于【可订货数量"+(zcpzsl-dhsl)+"】，可订货数量＝正常品库存－订货");
				return;
			}
		}

		ls_sql="update jxc_clpsmx set pssl=?,psje=dj*?";
		ls_sql+=" where psph='"+psph+"' and clbm='"+clbm[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,pssl);
		ps.setDouble(2,pssl);
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


	double wdzgce = 0;
	double zjxje = 0;
	ls_sql=" SELECT wdzgce,zjxje ";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		wdzgce = rs.getDouble("wdzgce");
		zjxje = rs.getDouble("zjxje");
	}
	rs.close();
	ps.close();

	pszje = 0;
	ls_sql=" SELECT sum(pszje) ";
	ls_sql+=" FROM jxc_clpsd ";
	ls_sql+=" where jxc_clpsd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		pszje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double thzje = 0;
	ls_sql=" SELECT sum(thzje) ";
	ls_sql+=" FROM jxc_clpsthd";
	ls_sql+=" where jxc_clpsthd.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		thzje = rs.getDouble(1);
	}
	rs.close();
	ps.close();

	// 配送比例公式应调整为：（配送累计金额－退货累计金额）/工程费，其中工程费＝合同原造价＋增减项折前造价

	double psbl=cf.round((pszje-thzje)*100/(wdzgce+zjxje),1);


	if (psbl>25 || psbl<18)
	{
		out.println("材料配送比例提醒！当前配送比例"+psbl+"%，合同原造价＋折前增减项『"+(wdzgce+zjxje)+"』，配送累计金额－退货累计金额『"+(pszje-thzje)+"』");
	}


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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>