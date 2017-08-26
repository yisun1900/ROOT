<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
long ygbh=0;
String yhmc=null;
String ygbm=null;
String rylx=null;
java.sql.Date jhlkrq=null;
double jhlksj=0;
double jhfhsj=0;
String lkgsmd=null;
String lkgssm=null;

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
ls=request.getParameter("ygbh");
try{
	if (!(ls.equals("")))  ygbh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ygbh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[员工编号]类型转换发生意外:"+e);
	return;
}
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
ygbm=cf.GB2Uni(request.getParameter("ygbm"));
rylx=cf.GB2Uni(request.getParameter("rylx"));
ls=request.getParameter("jhlkrq");
try{
	if (!(ls.equals("")))  jhlkrq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhlkrq]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划离开日期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhlksj");
try{
	if (!(ls.equals("")))  jhlksj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhlksj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划离开时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhfhsj");
try{
	if (!(ls.equals("")))  jhfhsj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhfhsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划返回时间]类型转换发生意外:"+e);
	return;
}
lkgsmd=cf.GB2Uni(request.getParameter("lkgsmd"));
lkgssm=cf.GB2Uni(request.getParameter("lkgssm"));

lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
bz=cf.GB2Uni(request.getParameter("bz"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	long jlh=0;
	ls_sql="select NVL(max(jlh),0)";
	ls_sql+=" from  crm_yglkgsjl";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jlh=rs.getLong(1);
	}
	rs.close();
	ps.close();

	jlh++;

	ls_sql="insert into crm_yglkgsjl ( jlh,ygbh,yhmc,ygbm,rylx,jhlkrq,jhlksj,jhfhsj,lkgsmd,lkgssm,lrr,lrsj,lrbm,ssfgs,bz,zt ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?,'1' ) ";//1：录入申请；2：离开公司；3：返回公司；4：已审核
	ps= conn.prepareStatement(ls_sql);
	ps.setLong(1,jlh);
	ps.setLong(2,ygbh);
	ps.setString(3,yhmc);
	ps.setString(4,ygbm);
	ps.setString(5,rylx);
	ps.setDate(6,jhlkrq);
	ps.setDouble(7,jhlksj);
	ps.setDouble(8,jhfhsj);
	ps.setString(9,lkgsmd);
	ps.setString(10,lkgssm);
	ps.setString(11,lrr);
	ps.setString(12,lrbm);
	ps.setString(13,ssfgs);
	ps.setString(14,bz);
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>