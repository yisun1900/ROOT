<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String scsbm=null;
String scsmc=null;
String scslb=null;
String wherescsbm=null;
wherescsbm=cf.GB2Uni(request.getParameter("scsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select scsbm,scsmc,DECODE(scslb,'1','主材品牌','2','辅材品牌','3','通用品牌') scslb ";
	ls_sql+=" from  jxc_scsxx";
	ls_sql+=" where (1=1) and  (scsbm='"+wherescsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		scsbm=cf.fillNull(rs.getString("scsbm"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		scslb=cf.fillNull(rs.getString("scslb"));
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
    品牌编码
  </td>
  <td width="35%"> 
    <%=scsbm%>
  </td>
  <td align="right" width="15%"> 
    品牌名称
  </td>
  <td width="35%"> 
    <%=scsmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    品牌类别
  </td>
  <td width="35%"> 
    <%=scslb%>
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
