<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%
String khbh=request.getParameter("khbh");
String fgsbh=cf.executeQuery("select fgsbh from crm_khxx where khbh='"+khbh+"'");
if (fgsbh.equals("FBJ00"))
{
	%>
	<frame name="menu" resize src="SgdCx.jsp">
	<frame name="main" resize src="EditDzpdCrm_khxx.jsp?khbh=<%=khbh%>">
	<%
}
else{
	%>
	<frame name="menu" resize src="SgdCx.jsp">
	<frame name="main" resize src="EditCrm_khxx.jsp?khbh=<%=khbh%>">
	<%
}

%>
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>