<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='DSDX' scope='page' class='dxxt.FSDX'/><!-- 短信发送包 -->
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>启动定时短信线程</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" name="selectform" action="qd.jsp">

<%  
/*
if (DSDX.jcxc())
{
	out.print("定时短信已经启动!!!");
}
else
{
	out.print("<input type=\"submit\"  value=\"启动定时短信\" >");
}
*/
%>
</form>
</body>
</html>

