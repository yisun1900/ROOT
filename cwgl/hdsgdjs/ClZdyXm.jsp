<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ʩ����Ԥ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#FFFFFF">
<%
String gdjsjlh=request.getParameter("gdjsjlh");
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");


if (zjxxh.equals("") )//��������
{
	response.sendRedirect("Cw_dejsmxClTsxm.jsp?khbh="+khbh+"&gdjsjlh="+gdjsjlh);
}
else{
	response.sendRedirect("Cw_dejsmxZjxClTsxm.jsp?khbh="+khbh+"&zjxxh="+zjxxh+"&gdjsjlh="+gdjsjlh);
}

%>

</body>
</html>
