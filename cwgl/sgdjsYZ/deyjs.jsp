<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>ʩ����Ԥ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String khbh=request.getParameter("khbh");
%>
<body bgcolor="#FFFFFF">
<div align="center">
<table border="1" width="60%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
  <tr> 
    <td height="74"> 
      <div align="center">ʩ����Ԥ����</div>
    </td>
  </tr>
  <tr align="center"> 
    <td width="69%" height="147"> 
      <p> 
        <input type="button" name="Button" value="���½���" onclick="window.open('Cw_deyjsmxList.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit2" value="�����������" onclick="window.open('EditCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="�鿴������" onclick="window.open('ViewCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="��ӡ�ӳ����㵥" onclick="window.open('DySgdCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="��ӡ�ڲ����㵥" onclick="window.open('DyGSCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
    </td>
  </tr>
</table>

</div>
</body>
</html>
