<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kmdm=null;
String xmmc1=null;
String xmmc2=null;
String xmmc3=null;
String xmmc4=null;
String dwbh=null;
kmdm=cf.GB2Uni(request.getParameter("kmdm"));
xmmc1=cf.GB2Uni(request.getParameter("xmmc1"));
xmmc2=cf.GB2Uni(request.getParameter("xmmc2"));
xmmc3=cf.GB2Uni(request.getParameter("xmmc3"));
xmmc4=cf.GB2Uni(request.getParameter("xmmc4"));
dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String wherekmdm=null;
wherekmdm=cf.GB2Uni(request.getParameter("wherekmdm"));
Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="update cw_kmdmb set kmdm=?,xmmc1=?,xmmc2=?,xmmc3=?,xmmc4=?,dwbh=? ";
	ls_sql+=" where  (kmdm='"+wherekmdm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kmdm);
	ps.setString(2,xmmc1);
	ps.setString(3,xmmc2);
	ps.setString(4,xmmc3);
	ps.setString(5,xmmc4);
	ps.setString(6,dwbh);
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