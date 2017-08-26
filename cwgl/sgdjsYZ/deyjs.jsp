<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>施工队预结算</title>
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
      <div align="center">施工队预结算</div>
    </td>
  </tr>
  <tr align="center"> 
    <td width="69%" height="147"> 
      <p> 
        <input type="button" name="Button" value="重新结算" onclick="window.open('Cw_deyjsmxList.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit2" value="调整结算比例" onclick="window.open('EditCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="查看结算结果" onclick="window.open('ViewCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="打印队长结算单" onclick="window.open('DySgdCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
      <p> 
        <input type="button" name="Submit3" value="打印内部结算单" onclick="window.open('DyGSCw_deyjsmx.jsp?khbh=<%=khbh%>')">
      </p>
    </td>
  </tr>
</table>

</div>
</body>
</html>
