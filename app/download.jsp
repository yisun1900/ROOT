<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.jspsmart.upload.*" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>业之峰连锁客户端下载</title>
</head>

<body>

<%
	
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String lx="";

try {
	lx=request.getParameter("lx").trim();	

}catch (Exception e) {
	lx="1";	
}
	
try {
	conn=cf.getConnection();

	ls_sql="update app_xzsl set sl=(sl+1) where applx = '"+lx+"'";	
//	System.out.println("ls_sql  --->  "+ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

}catch (Exception e) {
	
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

if("0".equals(lx))
{
	response.sendRedirect("/app/SXYDpzgl.apk");
}else{
	response.sendRedirect("/app/SXYDpzgl.apk");
}
	
	

%>

	
	


</body>
</html>