<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String khbh=null;
String fbr=null;
java.sql.Date fbsj=null;
java.sql.Date ybjyxq=null;
String fbsm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
fbr=cf.GB2Uni(request.getParameter("fbr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fbsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发布时间]类型转换发生意外:"+e);
	return;
}
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

fbsm=cf.GB2Uni(request.getParameter("fbsm"));


String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String hxmjbm=null;
String ysbm=null;
String czbm=null;
hxbm=cf.GB2Uni(request.getParameter("hxbm"));
fgflbm=cf.GB2Uni(request.getParameter("fgflbm"));
zxjwbm=cf.GB2Uni(request.getParameter("zxjwbm"));
hxmjbm=cf.GB2Uni(request.getParameter("hxmjbm"));
ysbm=cf.GB2Uni(request.getParameter("ysbm"));
czbm=cf.GB2Uni(request.getParameter("czbm"));


Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="update ybj_ybjsb set fbr=?,fbsj=?,fbsm=?,ybjyxq=?,clzt='3'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,fbr);
	ps.setDate(2,fbsj);
	ps.setString(3,fbsm);
	ps.setDate(4,ybjyxq);
	ps.executeUpdate();
	ps.close();

	ls_sql="update crm_khxx set hxbm=?,fgflbm=?,zxjwbm=?,hxmjbm=?,ysbm=?,ybjbz=?,ybjyxq=?,ybjdjsj=?,czbm=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,hxbm);
	ps.setString(2,fgflbm);
	ps.setString(3,zxjwbm);
	ps.setString(4,hxmjbm);
	ps.setString(5,ysbm);
	ps.setString(6,"Y");
	ps.setDate(7,ybjyxq);
	ps.setDate(8,fbsj);
	ps.setString(9,czbm);
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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>