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
	out.println("<BR>变量[ygbh]不存在");
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
String jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_yglkgsjl";
	ls_sql+=" where jlh="+jlh ;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("1"))//1：录入申请；2：离开公司；3：返回公司；4：已审核
	{
		out.println("错误！状态不正确，已离开公司不能再修改");
		return;
	}

	ls_sql="update crm_yglkgsjl set rylx=?,jhlkrq=?,jhlksj=?,jhfhsj=?,lkgsmd=?,lkgssm=?,lrr=?,lrsj=?,lrbm=?,ssfgs=?,bz=? ";
	ls_sql+=" where jlh="+jlh ;
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,rylx);
	ps.setDate(2,jhlkrq);
	ps.setDouble(3,jhlksj);
	ps.setDouble(4,jhfhsj);
	ps.setString(5,lkgsmd);
	ps.setString(6,lkgssm);
	ps.setString(7,lrr);
	ps.setDate(8,lrsj);
	ps.setString(9,lrbm);
	ps.setString(10,ssfgs);
	ps.setString(11,bz);
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
	out.print("<BR>出错:" + e);
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