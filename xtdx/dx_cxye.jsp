<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<jsp:useBean id='FSDX' scope='page' class='dxxt.FSDX'/><!-- ���ŷ��Ͱ� -->
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>�Ų�������ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">
<%
String ye=FSDX.cxye();
%>
<div align="center">
  <p><font color="blue"><b>Ŀǰʣ����: <%=ye%></b></font></p>
  </div>
</body>
</html>



