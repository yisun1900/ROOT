<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String cpjkr=null;
String cpkf=null;
String vipkf=null;
java.sql.Date cplhsj=null;
java.sql.Date jhbhwcsj=null;
java.sql.Date jhazsj=null;
String fbwxfa=null;
String falrr=null;
java.sql.Date falrsj=null;

cpjkr=cf.GB2Uni(request.getParameter("cpjkr"));
cpkf=cf.GB2Uni(request.getParameter("cpkf"));
vipkf=cf.GB2Uni(request.getParameter("vipkf"));
ls=request.getParameter("cplhsj");
try{
	if (!(ls.equals("")))  cplhsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[cplhsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[产品拉回时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhbhwcsj");
try{
	if (!(ls.equals("")))  jhbhwcsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhbhwcsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划备货完成时间]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("jhazsj");
try{
	if (!(ls.equals("")))  jhazsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[jhazsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[计划安装时间]类型转换发生意外:"+e);
	return;
}
fbwxfa=cf.GB2Uni(request.getParameter("fbwxfa"));
falrr=cf.GB2Uni(request.getParameter("falrr"));
ls=request.getParameter("falrsj");
try{
	if (!(ls.equals("")))  falrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[falrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[方案录入时间]类型转换发生意外:"+e);
	return;
}

String fbdbh=null;
fbdbh=cf.GB2Uni(request.getParameter("fbdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zt=null;
	ls_sql="select zt";
	ls_sql+=" from  crm_fbdgl";
	ls_sql+=" where fbdbh='"+fbdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();
	if (!zt.equals("2"))//1：录入、2：出方案、3：下单、4：备货完成、9：安装完成
	{
		out.println("错误！处理状态不正确");
		return;
	}

	ls_sql="update crm_fbdgl set cpjkr=?,cpkf=?,vipkf=?,cplhsj=?,jhbhwcsj=?,jhazsj=?,fbwxfa=?,falrr=?,falrsj=?,zt='2'";
	ls_sql+=" where fbdbh='"+fbdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cpjkr);
	ps.setString(2,cpkf);
	ps.setString(3,vipkf);
	ps.setDate(4,cplhsj);
	ps.setDate(5,jhbhwcsj);
	ps.setDate(6,jhazsj);
	ps.setString(7,fbwxfa);
	ps.setString(8,falrr);
	ps.setDate(9,falrsj);
	ps.executeUpdate();
	ps.close();

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