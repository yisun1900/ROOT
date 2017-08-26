<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String glbxh=request.getParameter("glbxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);


	String xmlrr=null;
	String xmbh=null;
	ls_sql="select xmlrr,xmbh";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where glbxh="+glbxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmlrr=rs.getString("xmlrr");
		xmbh=rs.getString("xmbh");
	}
	rs.close();
	ps.close();

	//家装工料分析表
	ls_sql="delete from bj_zdyglfxb ";
	ls_sql+=" where glbxh="+glbxh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//更新报价成本＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	double clcb=0;//材料成本
	double rgcb=0;//人工成本
	double jxcb=0;//机械成本
	double cbenj=0;//成本价
	ls_sql="select ROUND(sum(dj*xhl),2)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glflbm='1'";//1:材料
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select ROUND(sum(dj*xhl),2)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glflbm='2'";//2:人工
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rgcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select ROUND(sum(dj*xhl),2)";
	ls_sql+=" from  bj_zdyglfxb";
	ls_sql+=" where xmlrr='"+xmlrr+"' and xmbh='"+xmbh+"' and glflbm='3'";//3:机械
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jxcb=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	cbenj=cf.round(clcb+rgcb+jxcb,2);

	ls_sql="update bj_zdyxmb set clcb=?,rgcb=?,jxcb=?,cbenj=? ";
	ls_sql+=" where lrr='"+xmlrr+"' and xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,clcb);
	ps.setDouble(2,rgcb);
	ps.setDouble(3,jxcb);
	ps.setDouble(4,cbenj);
	ps.executeUpdate();
	ps.close();
	//更新报价成本＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



	conn.commit();

	response.sendRedirect("InsertBj_zdyglfxb.jsp?xmbh="+xmbh+"&lrr="+java.net.URLEncoder.encode(xmlrr,"UTF-8")+"&save=Y");
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>