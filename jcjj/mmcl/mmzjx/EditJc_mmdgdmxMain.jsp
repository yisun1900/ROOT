<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@include file="/getlogin.jsp"%>

<html>
<head>
<title>YBL��Ϣ����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 
<%  
String xh = request.getParameter("xh");
String zjxxh=request.getParameter("zjxxh");
String lx=cf.executeQuery("select lx from jc_mmzjxmx where zjxxh='"+zjxxh+"' and xh="+xh);
if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
{
	%>
	<frame name="menu" resize src="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp">
	<frame name="main" resize src="EditZjxJc_mmdgdmx.jsp?xh=<%=xh%>&zjxxh=<%=zjxxh%>">
	<%
}
else{
	%>
	<frame name="menu" resize src="/jcjj/mmcl/qdht/Jc_mmydmxCx.jsp">
	<frame name="main" resize src="EditJc_mmdgdmx.jsp?xh=<%=xh%>&zjxxh=<%=zjxxh%>">
	<%
}
%>

</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
