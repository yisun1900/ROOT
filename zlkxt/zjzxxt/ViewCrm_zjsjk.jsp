<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_zjsjk_jlh=null;
String dm_zjlxbm_zjlxmc=null;
String crm_zjsjk_bt=null;
String crm_zjsjk_nr=null;
String crm_zjsjk_lrrq=null;
String crm_zjsjk_yhdlm=null;
String wherecrm_zjsjk_jlh=null;
wherecrm_zjsjk_jlh=cf.GB2Uni(request.getParameter("jlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_zjsjk.jlh as crm_zjsjk_jlh,dm_zjlxbm.zjlxmc as dm_zjlxbm_zjlxmc,crm_zjsjk.bt as crm_zjsjk_bt,crm_zjsjk.nr as crm_zjsjk_nr,crm_zjsjk.lrrq as crm_zjsjk_lrrq,crm_zjsjk.yhdlm as crm_zjsjk_yhdlm ";
	ls_sql+=" from  dm_zjlxbm,crm_zjsjk";
	ls_sql+=" where crm_zjsjk.zjlxbm=dm_zjlxbm.zjlxbm and  (crm_zjsjk.jlh="+wherecrm_zjsjk_jlh+")  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_zjsjk_jlh=cf.fillNull(rs.getString("crm_zjsjk_jlh"));
		dm_zjlxbm_zjlxmc=cf.fillNull(rs.getString("dm_zjlxbm_zjlxmc"));
		crm_zjsjk_bt=cf.fillNull(rs.getString("crm_zjsjk_bt"));
		crm_zjsjk_nr=cf.fillNull(rs.getString("crm_zjsjk_nr"));
		crm_zjsjk_lrrq=cf.fillNull(rs.getDate("crm_zjsjk_lrrq"));
		crm_zjsjk_yhdlm=cf.fillNull(rs.getString("crm_zjsjk_yhdlm"));
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
		if (stmt != null) stmt.close(); 
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
<div align="center">专家库信息 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">记录号</div>
    </td>
    <td width="35%"> <%=crm_zjsjk_jlh%> </td>
    <td width="15%"> 
      <div align="right">专家库类型</div>
    </td>
    <td width="35%"><%=dm_zjlxbm_zjlxmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%"> 
      <div align="right">录入日期</div>
    </td>
    <td width="35%"> <%=crm_zjsjk_lrrq%> </td>
    <td width="15%"> 
      <div align="right">录入人</div>
    </td>
    <td width="35%"> <%=crm_zjsjk_yhdlm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">标题</td>
    <td colspan="3"><%=crm_zjsjk_bt%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="15%" align="right">内容</td>
    <td colspan="3"><%=crm_zjsjk_nr%></td>
  </tr>
</table>
</body>
</html>
