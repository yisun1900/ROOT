<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ĩ��ת</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<%
	String jzrq=request.getParameter("jzrq");
%>

<table width="100%" border="0" height="173">
  <tr align="center"> 
    <td height="122"><b><font color="#CC0000" size="6">ע�⣺ɾ����������ҵ������<BR>�Ҳ��ɻָ�<BR>��ȷ���Ƿ�ɾ��</font></b></td>
  </tr>
  <tr align="center"> 
    <td><A HREF="DeleteCw_qmjz1.jsp?jzrq=<%=jzrq%>">ɾ����ת��¼</A>��<%=jzrq%></td>
  </tr>
</table>
</body>
</html>
