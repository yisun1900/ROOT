<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,ybl.common.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<jsp:setProperty name="cf" property="*" />

<%
String gysddph=cf.GB2Uni(request.getParameter("gysddph"));

%>

<html>
<head>
<title>���϶���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0">
  <tr>
    <td height="61" colspan="2" align="center"><strong>��Ӧ�̶�����ӡ����Ӧ�̶����ţ�<%=gysddph%>��</strong></td>
  </tr>
  <tr>
    <td width="50%" height="41">&nbsp;</td>
    <td width="50%"><A HREF="PrintGysdd.jsp?gysddph=<%=gysddph%>">�����������ӡ</A></td>
  </tr>
  <tr>
    <td height="39">&nbsp;</td>
    <td><A HREF="GysddChooseClbm.jsp?gysddph=<%=gysddph%>">�����ѡ���ӡ</A></td>
  </tr>
</table>
</body>
</html>


