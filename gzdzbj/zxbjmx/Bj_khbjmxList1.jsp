<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
String khbh=request.getParameter("khbh");

if (khbh.equals(""))
{
	return;
}

%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

  <table width="100%" border="0" height="540">
    <tr>
      <td width="100%" valign="top">
		<iframe width="100%" height="100%" src="bjxmList.jsp?khbh=<%=khbh%>" name="bjxmframe" marginwidth="0" marginheight="0" scrolling="YES" FrameBorder="0"> 
		</iframe> 
      </td>
      <td width="0%" valign="top">
		<iframe width="100%" height="100%" src="note1.jsp" name="lrbjframe" marginwidth="0" marginheight="0" scrolling="YES" FrameBorder="0"> 
		</iframe> 
	  </td>
    </tr>
  </table>

</body>
</html>

