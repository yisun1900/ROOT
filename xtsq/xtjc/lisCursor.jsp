<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>打开游标</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">SID</td>
	<td  width="10%">用户名</td>
	<td  width="10%">操作系统的用户名</td>
	<td  width="10%">计算机名称</td>
	<td  width="50%">SQL</td>
	<td  width="10%">数量</td>
</tr>

<% 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String user_name=null;
	String sid=null;
	String osuser=null;
	String machine=null;
	String sql_text=null;
	int sl=0;
	int allsl=0;

	ls_sql=" select o.user_name,o.sid, s.osuser, s.machine,q.sql_text, count(*) num_curs"; 
	ls_sql+=" from v$open_cursor o, v$session s, v$sql q";
	ls_sql+=" where  o.sid=s.sid and q.hash_value=o.hash_value";
	ls_sql+=" group by user_name,o.sid, osuser, machine,q.sql_text";
	ls_sql+=" order by  num_curs desc ";		
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		user_name=rs.getString("user_name");
		sid=rs.getString("sid");
		osuser=rs.getString("osuser");
		machine=rs.getString("machine");
		sql_text=rs.getString("sql_text");
		sl=rs.getInt("num_curs");

		allsl+=sl;

	%>
	<tr bgcolor="#FFFFFF"  align="center">
		<td><%=sid%></td>
		<td><%=user_name%></td>
		<td><%=osuser%></td>
		<td><%=machine%></td>
		<td align="left"><%=sql_text%></td>
		<td><%=sl%></td>
	</tr>

	<%
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="3">小 计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=allsl%></td>
	</tr>

	<%


}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

</table>
</body>
</html>
