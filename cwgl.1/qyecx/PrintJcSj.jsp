<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>打印收据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">

<form method="POST" name="listform">

<%
String getfkxh=request.getParameter("fkxh");
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String fkxh=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT fkxh";
	ls_sql+=" FROM cw_khfkjl";
    ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and fkxh!="+getfkxh+" and glxh in(select glxh from cw_glfkjl where fkxh="+getfkxh+")";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fkxh=cf.fillNull(rs.getString("fkxh"));

		%>
		<input type="hidden" name="fkxh" value="<%=fkxh%>">
		<%
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


	<input type="hidden" name="fkxh" value="<%=getfkxh%>">
	<input type="hidden" name="khbh" value="<%=khbh%>">
</form> 
</body>

<script  LANGUAGE="javascript">
<!--
	listform.action="PrintAllJcSj.jsp";
	listform.submit();
//-->
</script>
</html>
