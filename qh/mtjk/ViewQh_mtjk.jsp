<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qh_mtjk_jkbbh=null;
String qh_mtjk_bjkgsmc=null;
String qh_mtjk_xxlybm=null;
String qh_mtjk_bcsj=null;
String qh_mtjk_gggs=null;
String qh_mtjk_yjjg=null;
String qh_mtjk_bz=null;
String qh_mtjk_dwbh=null;
String whereqh_mtjk_jkbbh=null;
whereqh_mtjk_jkbbh=cf.GB2Uni(request.getParameter("jkbbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select qh_mtjk.jkbbh as qh_mtjk_jkbbh,qh_bjkgsdm.bjkgsmc as qh_bjkgsdm_bjkgsmc,dm_xxlybm.xxlymc as dm_xxlybm_xxlymc,qh_mtjk.bcsj as qh_mtjk_bcsj,qh_mtjk.gggs as qh_mtjk_gggs,qh_mtjk.yjjg as qh_mtjk_yjjg,qh_mtjk.bz as qh_mtjk_bz,sq_dwxx.dwmc as qh_mtjk_dwbh ";
	ls_sql+=" from  qh_mtjk,sq_dwxx,QH_BJKGSDM,dm_xxlybm";
	ls_sql+=" where (sq_dwxx.dwbh(+)=qh_mtjk.dwbh) and  (qh_mtjk.jkbbh='"+whereqh_mtjk_jkbbh+"') and (qh_mtjk.bjkgsbh=qh_bjkgsdm.bjkgsbh(+) and (qh_mtjk.xxlybm=dm_xxlybm.xxlybm))  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		qh_mtjk_jkbbh=cf.fillNull(rs.getString("qh_mtjk_jkbbh"));
		qh_mtjk_bjkgsmc=cf.fillNull(rs.getString("qh_bjkgsdm_bjkgsmc"));
		qh_mtjk_xxlybm=cf.fillNull(rs.getString("dm_xxlybm_xxlymc"));
		qh_mtjk_bcsj=cf.fillNull(rs.getDate("qh_mtjk_bcsj"));
		qh_mtjk_gggs=cf.fillNull(rs.getString("qh_mtjk_gggs"));
		qh_mtjk_yjjg=cf.fillNull(rs.getString("qh_mtjk_yjjg"));
		qh_mtjk_bz=cf.fillNull(rs.getString("qh_mtjk_bz"));
		qh_mtjk_dwbh=cf.fillNull(rs.getString("qh_mtjk_dwbh"));
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 查看信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">监控表编号</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_jkbbh%>
  </td>
  <td width="15%"> 
    <div align="right">被监控公司名称</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_bjkgsmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">广告形式</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm",qh_mtjk_xxlybm,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">播出时间</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_bcsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">广告公司</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_gggs%>
  </td>
  <td width="15%"> 
    <div align="right">预计价格</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_yjjg%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_bz%>
  </td>
  <td width="15%"> 
    <div align="right">单位编号</div>
  </td>
  <td width="35%"> 
    <%=qh_mtjk_dwbh%>
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
