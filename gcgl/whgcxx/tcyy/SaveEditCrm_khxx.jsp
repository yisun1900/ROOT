<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String dianz=null;
String weny=null;
String xqzg=null;
String xqzz=null;
String xqzy=null;
String wlyxzg=null;
String yxzy=null;
String wzch=null;
String wysj=null;
String wzcxy=null;
String dhzy=null;
String wztgy=null;
String siji=null;
dianz=cf.GB2Uni(request.getParameter("dianz"));
weny=cf.GB2Uni(request.getParameter("weny"));
xqzg=cf.GB2Uni(request.getParameter("xqzg"));
xqzz=cf.GB2Uni(request.getParameter("xqzz"));
xqzy=cf.GB2Uni(request.getParameter("xqzy"));
wlyxzg=cf.GB2Uni(request.getParameter("wlyxzg"));
yxzy=cf.GB2Uni(request.getParameter("yxzy"));
wzch=cf.GB2Uni(request.getParameter("wzch"));
wysj=cf.GB2Uni(request.getParameter("wysj"));
wzcxy=cf.GB2Uni(request.getParameter("wzcxy"));
dhzy=cf.GB2Uni(request.getParameter("dhzy"));
wztgy=cf.GB2Uni(request.getParameter("wztgy"));
siji=cf.GB2Uni(request.getParameter("siji"));

String khbh=null;

khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update crm_khxx set dianz=?,weny=?,xqzg=?,xqzz=?,xqzy=?,wlyxzg=?,yxzy=?,wzch=?,wysj=?,wzcxy=?,dhzy=?,wztgy=?,siji=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dianz);
	ps.setString(2,weny);
	ps.setString(3,xqzg);
	ps.setString(4,xqzz);
	ps.setString(5,xqzy);
	ps.setString(6,wlyxzg);
	ps.setString(7,yxzy);
	ps.setString(8,wzch);
	ps.setString(9,wysj);
	ps.setString(10,wzcxy);
	ps.setString(11,dhzy);
	ps.setString(12,wztgy);
	ps.setString(13,siji);
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