<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String cgjhph=null;
String cgjhmc=null;
String cgsqr=null;
java.sql.Date jhkssj=null;
java.sql.Date jhjssj=null;
double jhje=0;
String jhnr=null;
String jhdzt=null;
String ssfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
String shr=null;
java.sql.Date shsj=null;
String shjg=null;
String shnr=null;
String bz=null;
String jhfkjd=null;
cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
cgjhmc=cf.GB2Uni(request.getParameter("cgjhmc"));

bz=cf.GB2Uni(request.getParameter("bz"));
String wherecgjhph=null;
wherecgjhph=cf.GB2Uni(request.getParameter("wherecgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update jxc_clcgjh set cgjhmc=?,bz=? ";
	ls_sql+=" where  (cgjhph='"+wherecgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,cgjhmc);
	ps.setString(2,bz);
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
		if (ps != null) ps.close();
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