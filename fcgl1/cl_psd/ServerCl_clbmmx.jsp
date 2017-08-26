<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String psdh=cf.GB2Uni(request.getParameter("psdh"));
String clbm=cf.GB2Uni(request.getParameter("clbm"));
String clmc=cf.GB2Uni(request.getParameter("clmc"));
String clgg=cf.GB2Uni(request.getParameter("clgg"));
String lrjsfs=cf.GB2Uni(request.getParameter("lrjsfs"));
String lrbfb=cf.GB2Uni(request.getParameter("lrbfb"));
String cldlmc=cf.GB2Uni(request.getParameter("cldlmc"));
String jldwmc=cf.GB2Uni(request.getParameter("jldwmc"));
double pssl = 0;
double gdj = 0;
double psje = 0;
ls=request.getParameter("pssl");
try{
	if (!(ls.equals("")))  pssl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pssl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送数量]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("gdj");
try{
	if (!(ls.equals("")))  gdj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量gdj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("psje");
try{
	if (!(ls.equals("")))  psje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量psje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[配送金额]类型转换发生意外:"+e);
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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String pszt=null;
	ls_sql=" SELECT pszt ";
	ls_sql+=" FROM cl_psd ";
    ls_sql+=" where psdh='"+psdh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pszt=cf.fillNull(rs.getString("pszt"));
	}
	rs.close();
	ps.close();

	if (!pszt.equals("1"))//1：未提交；2：已提交；3：已配送
	{
		out.print("错误！已提交，不能再修改");
		return;
	}



/********************************************************************************
|					查询辅材是否被出库											|
********************************************************************************/
	ls_sql=" SELECT clbm ";
	ls_sql+=" FROM cl_psdmx ";
    ls_sql+=" where psdh='"+psdh+"' and clbm='"+clbm+"' ";
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
	
	ls_sql="insert into cl_psdmx ( psdh,clbm,clmc,clgg,cldlmc,jldwmc,lrjsfs,lrbfb,ckmc,sfrk,cj,cjjsj,fgsdj,gdj,pssl,psje ) ";
	ls_sql+=" values ( '"+psdh+"','"+clbm+"','"+clmc+"','"+clgg+"','"+cldlmc+"','"+jldwmc+"','"+lrjsfs+"',"+lrbfb+",'"+ckmc+"','"+sfrk+"',"+cj+","+cjjsj+","+fgsdj+","+gdj+","+pssl+","+psje+") ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update cl_psd set pszsl=pszsl+'"+pssl+"',pszje=pszje+'"+psje+"' ";
	ls_sql+=" where  (psdh='"+psdh+"')  ";
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