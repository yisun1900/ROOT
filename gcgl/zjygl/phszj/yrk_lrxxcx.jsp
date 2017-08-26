<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<body >
<form method="post" action="" name="aform" >
</form>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%  
String sql = null;
Connection conn  = null;
Statement stmt = null;
ResultSet rs = null;

String khxm = cf.GB2Uni(request.getParameter("khxm"));

try {
	conn=cf.getConnection();    //得到连接
	stmt = conn.createStatement();

	if (!khxm.equals(""))
	{
		//石类名称
		sql = "select khbh from crm_khxx";
		sql+= "  where khxm='"+khxm+"'";
//		out.println(sql);
		rs = stmt.executeQuery(sql);
		if (rs.next())                            
		{
			%>
			parent.main.add(parent.main.selectform) ;   
			<%
		}
		else{
			%>
			parent.main.selectform.khxm.select();
			alert("[客户姓名]不存在！");
			<%
		}
		rs.close();
	}
}
catch(Exception e){
	out.print("查询失败,发生意外: " + e);
	out.print("SQL=" + sql);
}
finally{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
}
%>

//-->
</SCRIPT>

