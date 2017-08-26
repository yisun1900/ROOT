<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long sqxh=0;
String xcpbm=null;
String xcpmc=null;
String xcpflbm=null;
String jldw=null;
double dj=0;
double jhlqsl=0;
ls=request.getParameter("sqxh");
try{
	if (!(ls.equals("")))  sqxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[申请序号]类型转换发生意外:"+e);
	return;
}
xcpbm=cf.GB2Uni(request.getParameter("xcpbm"));
xcpmc=cf.GB2Uni(request.getParameter("xcpmc"));
xcpflbm=cf.GB2Uni(request.getParameter("xcpflbm"));
jldw=cf.GB2Uni(request.getParameter("jldw"));
ls=request.getParameter("dj");
try{
	if (!(ls.equals("")))  dj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量dj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[单价]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhlqsl");
try{
	if (!(ls.equals("")))  jhlqsl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jhlqsl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划领取数量]类型转换发生意外:"+e);
	return;
}
String sfxsp=cf.GB2Uni(request.getParameter("sfxsp"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String lqzt=null;
	ls_sql=" SELECT lqzt";
	ls_sql+=" FROM oa_xcplqsq ";
    ls_sql+=" where sqxh="+sqxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lqzt=rs.getString("lqzt");
	}
	rs.close();
	ps.close();

	if (lqzt.equals("2"))//1：未完成；2：完成申请；3：一级审批；4：二级审批；5：三级审批；6：已领取
	{
		out.println("错误！已完成，不能再修改，若想修改，在维护中删除完成状态");
		return;
	}
	
	ls_sql="insert into oa_xcplqmx ( sqxh,xcpbm,xcpmc,xcpflbm,jldw,dj,jhlqsl,sfxsp,slqsl ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,0 ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,sqxh);
	ps.setString(2,xcpbm);
	ps.setString(3,xcpmc);
	ps.setString(4,xcpflbm);
	ps.setString(5,jldw);
	ps.setDouble(6,dj);
	ps.setDouble(7,jhlqsl);
	ps.setString(8,sfxsp);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>存盘失败！");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("存盘成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
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