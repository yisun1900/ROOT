<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bkbh=null;
String bkmc=null;
String wherebkbh=null;
wherebkbh=cf.GB2Uni(request.getParameter("bkbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select bkbh,bkmc ";
	ls_sql+=" from  nblt_bkgl";
	ls_sql+=" where (1=1) and  (bkbh='"+wherebkbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bkbh=cf.fillNull(rs.getString("bkbh"));
		bkmc=cf.fillNull(rs.getString("bkmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 查看信息</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    板块编号
  </td>
  <td width="35%"> 
    <%=bkbh%>
  </td>
  <td align="right" width="15%"> 
    板块名称
  </td>
  <td width="35%"> 
    <%=bkmc%>
  </td>
</tr>
</table>
</body>
</html>
