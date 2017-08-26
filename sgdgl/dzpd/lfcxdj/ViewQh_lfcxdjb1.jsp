<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qh_lfcxdjb_djxh=null;
String qh_lfcxdjb_khbh=null;
String qh_lfcxdjb_zpnr=null;
String qh_lfcxdjb_jsr=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_lxfs=null;
String crm_zxkhxx_sjs=null;
String qh_lfcxdjb_djrq=null;
String whereqh_lfcxdjb_djxh=null;
whereqh_lfcxdjb_djxh=cf.GB2Uni(request.getParameter("djxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select qh_lfcxdjb.djxh as qh_lfcxdjb_djxh,qh_lfcxdjb.khbh as qh_lfcxdjb_khbh,qh_lfcxdjb.zpnr as qh_lfcxdjb_zpnr,qh_lfcxdjb.jsr as qh_lfcxdjb_jsr,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,crm_zxkhxx.sjs as crm_zxkhxx_sjs,qh_lfcxdjb.djrq as qh_lfcxdjb_djrq ";
	ls_sql+=" from  crm_zxkhxx,qh_lfcxdjb";
	ls_sql+=" where qh_lfcxdjb.khbh=crm_zxkhxx.khbh and  (qh_lfcxdjb.djxh='"+whereqh_lfcxdjb_djxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qh_lfcxdjb_djxh=cf.fillNull(rs.getString("qh_lfcxdjb_djxh"));
		qh_lfcxdjb_khbh=cf.fillNull(rs.getString("qh_lfcxdjb_khbh"));
		qh_lfcxdjb_zpnr=cf.fillNull(rs.getString("qh_lfcxdjb_zpnr"));
		qh_lfcxdjb_jsr=cf.fillNull(rs.getString("qh_lfcxdjb_jsr"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_lxfs=cf.fillNull(rs.getString("crm_zxkhxx_lxfs"));
		crm_zxkhxx_sjs=cf.fillNull(rs.getString("crm_zxkhxx_sjs"));
		qh_lfcxdjb_djrq=cf.fillNull(rs.getDate("qh_lfcxdjb_djrq"));
	}
	rs.close();
	ps.close();
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
    <div align="right">登记序号</div>
  </td>
  <td width="35%"> 
    <%=qh_lfcxdjb_djxh%>
  </td>
  <td width="15%"> 
    <div align="right">设计师</div>
  </td>
  <td width="35%"> 
    <%=crm_zxkhxx_sjs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">赠品内容</div>
  </td>
  <td width="35%"> 
    <%=qh_lfcxdjb_zpnr%>
  </td>
  <td width="15%"> 
    <div align="right">经手人</div>
  </td>
  <td width="35%"> 
    <%=qh_lfcxdjb_jsr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">客户姓名</div>
  </td>
  <td width="35%"> 
    <%=crm_zxkhxx_khxm%>
  </td>
  <td width="15%"> 
    <div align="right">联系方式</div>
  </td>
  <td width="35%"> 
    <%=crm_zxkhxx_lxfs%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">登记日期</div>
  </td>
  <td width="35%"> 
    <%=qh_lfcxdjb_djrq%>
  </td>
  <td width="15%"> 
    　
  </td>
  <td width="35%"> 
    　
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
