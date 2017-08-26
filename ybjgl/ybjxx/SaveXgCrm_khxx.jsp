<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String ysbm=null;
String czbm=null;
java.sql.Date ybjyxq=null;
java.sql.Date ybjdjsj=null;
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
czbm=cf.GB2Uni(request.getParameter("czbm"));
ls=request.getParameter("ybjyxq");
try{
	if (!(ls.equals("")))  ybjyxq=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ybjyxq不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[样板间有效期]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("ybjdjsj");
try{
	if (!(ls.equals("")))  ybjdjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量ybjdjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[样板间登记时间]类型转换发生意外:"+e);
	return;
}


String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_khxx set hxbm=?,fgflbm=?,zxjwbm=?,hxmjbm=?,ysbm=?,ybjyxq=?,ybjdjsj=?,czbm=?  ";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and ybjbz='Y' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxbm);
	ps.setString(2,fgflbm);
	ps.setString(3,zxjwbm);
	ps.setString(4,hxmjbm);
	ps.setString(5,ysbm);
	ps.setDate(6,ybjyxq);
	ps.setDate(7,ybjdjsj);
	ps.setString(8,czbm);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>修改数据库失败！");
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>