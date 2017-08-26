<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<style>
A:link,A:visited ,A:active {TEXT-DECORATION: none}
A:hover {text-decoration : none; position : relative; top : 1px; left : 1px}
</style>
<html>
<head>
<title>主材展厅</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" border="0" style="FONT-SIZE:16"  cellpadding="2" cellspacing="2">
  <tr align="center">
	<td height="67" ><font color="#000099" size="+2"><b><font size="+3" face="楷体_GB2312">主材展厅</font></b></font></td>
  </tr>
  <tr align="center">
	<td height="40">&nbsp;</td>
  </tr>
<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%

String dwbh=null;
String dwmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		ls_sql="select dwbh,dwmc ";
		ls_sql+=" from  sq_dwxx";
		ls_sql+=" where dwlx='F0'";
		ls_sql+=" order by dwbh";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			dwbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));

			%>
			  <tr>
				<td align="center" height="30"><A HREF="zcdlbmList.jsp?ssfgs=<%=dwbh%>"><%=dwmc%></A></td>
			  </tr>
			<%
		}
		rs.close();
		ps.close();
	}
	else{
		response.sendRedirect("zcdlbmList.jsp?ssfgs="+ssfgs);
	}

}
catch (Exception e) {
	out.print("Exception: " + e);
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
</table>
</body>
</html>
