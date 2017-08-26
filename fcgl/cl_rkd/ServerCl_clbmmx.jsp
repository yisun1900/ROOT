<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String clmc=cf.GB2Uni(request.getParameter("clmc"));
String clgg=cf.GB2Uni(request.getParameter("clgg"));
String lrjsfs=cf.GB2Uni(request.getParameter("lrjsfs"));
String lrbfb=cf.GB2Uni(request.getParameter("lrbfb"));
String cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
double rksl = 0;
double rkdj = 0;
double rkje = 0;
String sl=request.getParameter("rksl");
try{
	if (!(sl.equals("")))  rksl=Double.parseDouble(sl.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rksl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入库数量]类型转换发生意外:"+e);
	return;
}
String dj=request.getParameter("rkdj");
try{
	if (!(dj.equals("")))  rkdj=Double.parseDouble(dj.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rkdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入库单价]类型转换发生意外:"+e);
	return;
}
String je=request.getParameter("rkje");
try{
	if (!(je.equals("")))  rkje=Double.parseDouble(je.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[入库金额]类型转换发生意外:"+e);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
/********************************************************************************
|					查询辅材是否被入库											|
********************************************************************************/
	ls_sql=" SELECT clbm ";
	ls_sql+=" FROM cl_rkmx ";
    ls_sql+=" where rkph='"+rkph+"' and clbm='"+clbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		out.print("本次批号中已经存在此材料的入库信息!!!");
		return;
	}
	rs.close();
	ps.close();
/********************************************************************************
|					录入信息														|
********************************************************************************/
	
	conn.setAutoCommit(false);
	
	ls_sql="insert into cl_rkmx ( rkph,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,rkdj,rksl,rkje ) ";
	ls_sql+=" values ( '"+rkph+"','"+clbm+"','"+clmc+"','"+clgg+"','"+cldlmc+"','"+jldwmc+"','"+lrjsfs+"','"+lrbfb+"','"+rkdj+"','"+rksl+"','"+rkje+"' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cl_rkd set rkzsl=rkzsl+'"+rksl+"',rkzje=rkzje+'"+rkje+"' ";
	ls_sql+=" where  (rkph='"+rkph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>