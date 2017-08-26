<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String clxlbm=null;
String clxlmc=null;
String cldlmc=null;
String whereclxlbm=null;
whereclxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select clxlbm,clxlmc,cldlmc ";
	ls_sql+=" from  jxc_clxlbm";
	ls_sql+=" where (1=1) and  (clxlbm='"+whereclxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
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
    材料小类编码
  </td>
  <td width="35%"> 
    <%=clxlbm%>
  </td>
  <td align="right" width="15%"> 
    材料小类名称
  </td>
  <td width="35%"> 
    <%=clxlmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    材料大类名称
  </td>
  <td width="35%"> 
    <%=cldlmc%>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
</table>
</body>
</html>
