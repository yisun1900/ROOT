<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>分配样板间</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String sqbh=request.getParameter("sqbh");

%>
<frameset rows="216,283*" frameborder="YES" border="0" framespacing="3" cols="*" bordercolor="#333333"> 
  <frame name="topFrame"  resize src="Ybj_fpybjList.jsp?sqbh=<%=sqbh%>" >
  <frame name="mainFrame" src="SelectCxCrm_khxx.jsp?sqbh=<%=sqbh%>">
</frameset>
<noframes><body bgcolor="#FFFFFF">

</body></noframes>
</html>
