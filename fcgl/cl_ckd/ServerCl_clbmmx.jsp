<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String ckph=cf.GB2Uni(request.getParameter("ckph"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String clmc=cf.GB2Uni(request.getParameter("clmc"));
String clgg=cf.GB2Uni(request.getParameter("clgg"));
String lrjsfs=cf.GB2Uni(request.getParameter("lrjsfs"));
String lrbfb=cf.GB2Uni(request.getParameter("lrbfb"));
String cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
double cksl = 0;
double gdj = 0;
double ckje = 0;
ls=request.getParameter("cksl");
try{
	if (!(ls.equals("")))  cksl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rksl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdj");
try{
	if (!(ls.equals("")))  gdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rkdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ckje");
try{
	if (!(ls.equals("")))  ckje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量rkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[出库金额]类型转换发生意外:"+e);
	return;
}


String ckmc=cf.GB2Uni(request.getParameter("ckmc"));
String sfrk=cf.GB2Uni(request.getParameter("sfrk"));
double cj = 0;
ls=request.getParameter("cj");
try{
	if (!(ls.equals("")))  cj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[厂价]类型转换发生意外:"+e);
	return;
}
double cjjsj = 0;
ls=request.getParameter("cjjsj");
try{
	if (!(ls.equals("")))  cjjsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cjjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[与厂家结算价]类型转换发生意外:"+e);
	return;
}
double fgsdj = 0;
ls=request.getParameter("fgsdj");
try{
	if (!(ls.equals("")))  fgsdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fgsdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[分公司材料单价]类型转换发生意外:"+e);
	return;
}

String leixing=cf.GB2Uni(request.getParameter("leixing"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
/********************************************************************************
|					查询辅材是否被出库											|
********************************************************************************/
	ls_sql=" SELECT clbm ";
	ls_sql+=" FROM cl_ckmx ";
    ls_sql+=" where ckph='"+ckph+"' and clbm='"+clbm+"' and leixing='2'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		out.print("本次批号中已经存在此材料!!!");
		return;
	}
	rs.close();
	ps.close();
/********************************************************************************
|					录入信息														|
********************************************************************************/
	
	conn.setAutoCommit(false);
	
	ls_sql="insert into cl_ckmx ( ckph,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,cksl,ckje,leixing ) ";
	ls_sql+=" values ( '"+ckph+"','"+clbm+"','"+clmc+"','"+clgg+"','"+cldlmc+"','"+jldwmc+"','"+lrjsfs+"',"+lrbfb+",'"+ckmc+"','"+sfrk+"',"+cj+","+cjjsj+","+fgsdj+","+gdj+","+cksl+","+ckje+",'"+leixing+"' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cl_ckd set ckzsl=ckzsl+'"+cksl+"',ckzje=ckzje+'"+ckje+"' ";
	ls_sql+=" where  (ckph='"+ckph+"')  ";
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