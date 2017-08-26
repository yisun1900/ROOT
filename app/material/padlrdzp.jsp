<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import='java.sql.*,java.io.*' %>
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
  <%String xcjlh = cf.fillNull(request.getParameter("xcjlh"));  %>
  <%String khbh = cf.fillNull(request.getParameter("khbh"));  %>
  <%String dxpzcsq = cf.fillNull(request.getParameter("dxpzcsq"));  %>
  
  <%
  
String khxm=null;
String fwdz=null;
String passWord = "";
	
String yhmc = "";
String ygbh = "";
String ssfgs = "";
String dwbh = "";
  
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;	
try {
	conn=cf.getConnection();
  	
	ls_sql="select khxm,fwdz";
	ls_sql+=" from crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();
	
	
	
	ls_sql="select ygbh,yhdlm,yhkl,yhmc,dwbh,ssfgs ";
	ls_sql+=" from sq_yhxx ";
	ls_sql+=" where yhdlm='"+userName+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		passWord = cf.fillNull(rs.getString("yhkl"));
		passWord = cf.fillNull(cf.makejm(passWord));
		yhmc = cf.fillNull(rs.getString("yhmc"));
		ygbh = cf.fillNull(rs.getString("ygbh"));
		ssfgs = cf.fillNull(rs.getString("ssfgs"));
		dwbh = cf.fillNull(rs.getString("dwbh"));
	}
	rs.close();
	ps.close();
	
	session.setAttribute("ssfgs",ssfgs);
	session.setAttribute("yhdlm",userName);
	session.setAttribute("dwbh",dwbh);
	session.setAttribute("yhmc",yhmc);
	session.setAttribute("ygbh",ygbh);
	
	
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

	out.println();
  	
  %>
  
  xcjlh--><%=xcjlh%>   khbh--><%=khbh%>   dxpzcsq--><%=dxpzcsq%>

  	<form  name="loginform" method="post" action="/jcjj/xcl/InsertJc_khxcbDzpAjaxOne.jsp">
  		<input type="hidden" name="xcjlh" value="<%=xcjlh %>" />
  		<input type="hidden" name="khbh" value="<%=khbh %>" />
  		<input TYPE="hidden" name="dxpzcsq" value="<%=dxpzcsq %>" />
  	</form>
    
  	
  	<font>努力加载中，请稍候……</font>
  	<script type="text/javascript">
  		
	function submit_onclick()//参数FormName:Form的名称
	{
		loginform.submit();
		return true;
	}
	submit_onclick();
</script>
  	
  </body>
</html>
