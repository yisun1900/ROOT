<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
String khbh=request.getParameter("khbh");
String lx=request.getParameter("lx");

if (khbh.equals(""))
{
	return;
}

%>


<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

  <table width="100%" border="0" height="540">
    <tr>
      <td width="45%" valign="top">
		<iframe width="100%" height="100%" src="Bj_cltcmcCxList.jsp?khbh=<%=khbh%>&lx=<%=lx%>" name="bjxmframe" marginwidth="0" marginheight="0" scrolling="YES" FrameBorder="0"> 
		</iframe> 
      </td>
      <td width="55%" valign="top">
		<iframe width="100%" height="100%" src="note4.jsp" name="lrbjframe" marginwidth="0" marginheight="0" scrolling="YES" FrameBorder="0"> 
		</iframe> 
	  </td>
    </tr>
  </table>

</body>
</html>

