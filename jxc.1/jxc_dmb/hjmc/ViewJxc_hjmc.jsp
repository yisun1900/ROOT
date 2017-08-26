<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hjbh=null;
String hjmc=null;
String ckbh=null;
String wherehjbh=null;
wherehjbh=cf.GB2Uni(request.getParameter("hjbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select hjbh,hjmc,ckmc ckbh ";
	ls_sql+=" from  jxc_hjmc,jxc_ckmc";
	ls_sql+=" where jxc_hjmc.ckbh=jxc_ckmc.ckbh and  (hjbh='"+wherehjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hjbh=cf.fillNull(rs.getString("hjbh"));
		hjmc=cf.fillNull(rs.getString("hjmc"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
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
    货架编号
  </td>
  <td width="35%"> 
    <%=hjbh%>
  </td>
  <td align="right" width="15%"> 
    货架名称
  </td>
  <td width="35%"> 
    <%=hjmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    所属仓库
  </td>
  <td width="35%"> 
    <%=ckbh%>
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
