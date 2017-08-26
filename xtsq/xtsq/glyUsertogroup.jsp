<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>YBL信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset cols="0,650*" frameborder="no" border="3" framespacing="3" rows="*"> 

  <frame name="menu" resize src="YhxxCx.jsp">
  <frame name="main" resize src="glyUsertogroup1.jsp">
</frameset>
<noframes>
<body bgcolor="#FFFFFF">
</body>
</noframes>
</html>
