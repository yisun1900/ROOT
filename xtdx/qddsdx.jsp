<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='DSDX' scope='page' class='dxxt.FSDX'/><!-- ���ŷ��Ͱ� -->
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>������ʱ�����߳�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" name="selectform" action="qd.jsp">

<%  
/*
if (DSDX.jcxc())
{
	out.print("��ʱ�����Ѿ�����!!!");
}
else
{
	out.print("<input type=\"submit\"  value=\"������ʱ����\" >");
}
*/
%>
</form>
</body>
</html>

