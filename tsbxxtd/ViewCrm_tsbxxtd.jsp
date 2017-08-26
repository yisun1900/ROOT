<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tsjlh=null;
String xtdxh=null;
String khbh=null;
String xtyy=null;
String xtrq=null;
String xtfgs=null;
String xtbm=null;
String xtr=null;
String xtfy=null;
String lrr=null;
String lrsj=null;
String lrrbm=null;
String bz=null;
String wheretsjlh=null;
String wherextdxh=null;
wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
wherextdxh=cf.GB2Uni(request.getParameter("xtdxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="SELECT crm_tsbxxtd.tsjlh tsjlh,crm_tsbxxtd.xtdxh xtdxh,crm_tsbxxtd.khbh khbh,crm_tsbxxtd.xtyy xtyy,crm_tsbxxtd.xtrq xtrq,a.dwmc xtfgs,b.dwmc xtbm,crm_tsbxxtd.xtr xtr,crm_tsbxxtd.xtfy xtfy,yhmc lrr,crm_tsbxxtd.lrsj lrsj,c.dwmc lrrbm ";
	ls_sql+=" FROM crm_tsbxxtd,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_yhxx ";
    ls_sql+=" where crm_tsbxxtd.xtfgs=a.dwbh and crm_tsbxxtd.xtbm=b.dwbh and crm_tsbxxtd.lrrbm=c.dwbh and crm_tsbxxtd.lrr=sq_yhxx.ygbh ";
	ls_sql+="  and  (tsjlh='"+wheretsjlh+"') and  (xtdxh="+wherextdxh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tsjlh=cf.fillNull(rs.getString("tsjlh"));
		xtdxh=cf.fillNull(rs.getString("xtdxh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xtyy=cf.fillNull(rs.getString("xtyy"));
		xtrq=cf.fillNull(rs.getDate("xtrq"));
		xtfgs=cf.fillNull(rs.getString("xtfgs"));
		xtbm=cf.fillNull(rs.getString("xtbm"));
		xtr=cf.fillNull(rs.getString("xtr"));
		xtfy=cf.fillNull(rs.getString("xtfy"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrrbm=cf.fillNull(rs.getString("lrrbm"));
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
    投诉报修记录号  </td>
  <td width="35%"> 
    <%=tsjlh%>  </td>
  <td align="right" width="15%">客户编号</td>
  <td width="35%"><%=khbh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">协调原因</td>
  <td colspan="3"><%=xtyy%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"> 
    协调日期  </td>
  <td width="35%"> 
    <%=xtrq%>  </td>
  <td align="right" width="15%">协调费用 </td>
  <td width="35%"><%=xtfy%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">协调分公司</td>
  <td width="35%"><%=xtfgs%></td>
  <td align="right" width="15%">协调部门 </td>
  <td width="35%"><%=xtbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td>
  <td width="35%"><%=lrr%></td>
  <td align="right" width="15%">录入时间</td>
  <td width="35%"><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人部门</td>
  <td width="35%"><%=lrrbm%></td>
  <td align="right" width="15%">&nbsp;</td>
  <td width="35%">&nbsp;</td>
</tr>
</table>
</body>
</html>
