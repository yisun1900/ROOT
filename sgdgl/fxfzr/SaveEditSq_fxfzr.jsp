<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ssfgs=null;
String fzrmc=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String lx=null;
String bz=null;
ssfgs=cf.GB2Uni(request.getParameter("ssfgs"));
fzrmc=cf.GB2Uni(request.getParameter("fzrmc"));
xb=cf.GB2Uni(request.getParameter("xb"));
dh=cf.GB2Uni(request.getParameter("dh"));
zz=cf.GB2Uni(request.getParameter("zz"));
sfzh=cf.GB2Uni(request.getParameter("sfzh"));
lx=cf.GB2Uni(request.getParameter("lx"));
bz=cf.GB2Uni(request.getParameter("bz"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String wheressfgs=null;
String wherefzrmc=null;
wheressfgs=cf.GB2Uni(request.getParameter("wheressfgs"));
wherefzrmc=cf.GB2Uni(request.getParameter("wherefzrmc"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update sq_fxfzr set ssfgs=?,fzrmc=?,xb=?,dh=?,zz=?,sfzh=?,lx=?,bz=?,sgd=? ";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (fzrmc='"+wherefzrmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ssfgs);
	ps.setString(2,fzrmc);
	ps.setString(3,xb);
	ps.setString(4,dh);
	ps.setString(5,zz);
	ps.setString(6,sfzh);
	ps.setString(7,lx);
	ps.setString(8,bz);
	ps.setString(9,sgd);
	if (ps.executeUpdate()!=1)
	{
		out.println("<BR>´æÅÌÊ§°Ü£¡");
	}
	else
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("´æÅÌ³É¹¦£¡");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
}
catch (Exception e) {
	out.print("<BR>³ö´í:" + e);
	out.print("<BR>SQL=" + ls_sql);
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