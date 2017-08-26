<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String xjr=null;
java.sql.Date xjsj=null;
String xjlxbm=null;
String lrr=null;
java.sql.Date lrsj=null;
String bz=null;
String xjjgbm=request.getParameter("xjjgbm");
xjr=cf.GB2Uni(request.getParameter("xjr"));
ls=request.getParameter("xjsj");
try{
	if (!(ls.equals("")))  xjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量xjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[检查时间]类型转换发生意外:"+e);
	return;
}
xjlxbm=cf.GB2Uni(request.getParameter("xjlxbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));
String xjwtflbm=cf.GB2Uni(request.getParameter("xjwtflbm"));
double jlje=0;
ls=request.getParameter("jlje");
try{
	if (!(ls.equals("")))  jlje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量jlje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[奖励金额]类型转换发生意外:"+e);
	return;
}

String xjjlh=null;
xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String cfspbz=null;
	ls_sql="select cfspbz";
	ls_sql+=" from  kp_xjgdjl";
	ls_sql+=" where xjjlh='"+xjjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfspbz=rs.getString("cfspbz");
	}
	rs.close();
	ps.close();
	if (!cfspbz.equals("1") && !cfspbz.equals("2"))//1：不需审批；2：未审批；3：审批通过；4：审批未通过
	{
		out.println("存盘失败！该施工队检查记录已审批");
		return;
	}

	ls_sql="update kp_xjgdjl set xjr=?,xjsj=?,xjlxbm=?,lrr=?,lrsj=?,bz=?,xjjgbm=?,xjwtflbm=?,jlje=? ";
	ls_sql+=" where  (xjjlh='"+xjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xjr);
	ps.setDate(2,xjsj);
	ps.setString(3,xjlxbm);
	ps.setString(4,lrr);
	ps.setDate(5,lrsj);
	ps.setString(6,bz);
	ps.setString(7,xjjgbm);
	ps.setString(8,xjwtflbm);
	ps.setDouble(9,jlje);
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
	out.print("Exception: " + e);
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