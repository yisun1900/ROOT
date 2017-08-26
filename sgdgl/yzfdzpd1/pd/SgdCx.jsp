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
String sgd = request.getParameter("sgd");//所属城区编码

if (sgd==null)
{
	return ;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String c1=null;
String c2=null;

try {
	conn=cf.getConnection();

	ls_sql=" select bzmc,bzmc||'（'||sq_bzxx.dh||'）'";
	ls_sql+=" from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"'";
	ls_sql+=" order by bzmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		c1=rs.getString(1);
		c2=rs.getString(2);

		%>
		parent.main.addItem("<%=c1%>","<%=c2%>");
		<%
	}
	rs.close();
	ps.close();

		
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

%>

//-->
</SCRIPT>

