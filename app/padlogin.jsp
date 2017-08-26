<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>江苏红蚂蚁装饰（集团）企业ERP管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%request.setCharacterEncoding("UTF-8"); %>
  <%response.setCharacterEncoding("UTF-8"); %>
  <%String userName = cf.fillNull(request.getParameter("userName"));  %>
  <%String passWord = cf.fillNull(request.getParameter("passWord"));  %>
  <%String mac = cf.fillNull(request.getParameter("macAddr"));  %>
  	<form  name="loginform" method="post" action="/login.jsp">
  		<input type="hidden" name="yhdlm" value="<%=userName %>" />
  		<input type="hidden" name="yhkl" value="<%=passWord %>" />
  		<input TYPE="hidden" name="macAddr" value="<%=mac %>" />
  	</form>
  	
  	<font>努力加载中，请稍候……</font>
  	<script type="text/javascript">
  		
	function submit_onclick()//参数FormName:Form的名称
	{
		if (loginform.yhdlm.value == "") {
			alert("[用户名]无效，请重新登录！");
			loginform.yhdlm.focus();
			return false;
		}
		if (loginform.yhkl.value == "") {
			alert("[密 码]无效，请重新登录！");
			loginform.yhkl.focus();
			return false;
		}

		loginform.submit();
		return true;
	}
	submit_onclick();
</script>
  	
  </body>
</html>
