<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cdbh=null;
long cdxh=0;
String cdxsmc=null;
String glurl=null;
String fcdbh=null;
String sfmjcd=null;
String cdsm=null;
cdbh=cf.GB2Uni(request.getParameter("cdbh"));
ls=request.getParameter("cdxh");
try{
	if (!(ls.equals("")))  cdxh=Long.parseLong(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cdxh不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[菜单序号]类型转换发生意外:"+e);
	return;
}
cdxsmc=cf.GB2Uni(request.getParameter("cdxsmc"));
glurl=cf.GB2Uni(request.getParameter("glurl"));
fcdbh=cf.GB2Uni(request.getParameter("fcdbh"));
sfmjcd=cf.GB2Uni(request.getParameter("sfmjcd"));
cdsm=cf.GB2Uni(request.getParameter("cdsm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="insert into sq_cd ( cdbh,cdxh,cdxsmc,glurl,fcdbh,sfmjcd,cdsm ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,? ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cdbh);
	ps.setLong(2,cdxh);
	ps.setString(3,cdxsmc);
	ps.setString(4,glurl);
	ps.setString(5,fcdbh);
	ps.setString(6,sfmjcd);
	ps.setString(7,cdsm);
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
	out.print("存盘失败,发生意外: " + e);
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