<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_bgfysbb_sqxh=null;
String xz_bgfysbb_sqrq=null;
String xz_bgfysbb_sqr=null;
String xz_bgfysbb_fymc=null;
String xz_bgfysbb_sxje=null;
String xz_bgfysbb_bz=null;
String sq_dwxx_dwmc=null;
String wherexz_bgfysbb_sqxh=null;
wherexz_bgfysbb_sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_bgfysbb.sqxh as xz_bgfysbb_sqxh,xz_bgfysbb.sqrq as xz_bgfysbb_sqrq,xz_bgfysbb.sqr as xz_bgfysbb_sqr,xz_bgfysbb.fymc as xz_bgfysbb_fymc,xz_bgfysbb.sxje as xz_bgfysbb_sxje,xz_bgfysbb.bz as xz_bgfysbb_bz,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" from  sq_dwxx,xz_bgfysbb";
	ls_sql+=" where xz_bgfysbb.dwbh=sq_dwxx.dwbh and  (xz_bgfysbb.sqxh='"+wherexz_bgfysbb_sqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_bgfysbb_sqxh=cf.fillNull(rs.getString("xz_bgfysbb_sqxh"));
		xz_bgfysbb_sqrq=cf.fillNull(rs.getDate("xz_bgfysbb_sqrq"));
		xz_bgfysbb_sqr=cf.fillNull(rs.getString("xz_bgfysbb_sqr"));
		xz_bgfysbb_fymc=cf.fillNull(rs.getString("xz_bgfysbb_fymc"));
		xz_bgfysbb_sxje=cf.fillNull(rs.getString("xz_bgfysbb_sxje"));
		xz_bgfysbb_bz=cf.fillNull(rs.getString("xz_bgfysbb_bz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
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
    <div align="right">申请序号</div>
  </td>
  <td width="35%"> 
    <%=xz_bgfysbb_sqxh%>
  </td>
  <td width="15%"> 
    <div align="right">申请日期</div>
  </td>
  <td width="35%"> 
    <%=xz_bgfysbb_sqrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">申请人</div>
  </td>
  <td width="35%"> 
    <%=xz_bgfysbb_sqr%>
  </td>
  <td width="15%"> 
    <div align="right">费用名称</div>
  </td>
  <td width="35%"> 
    <%=xz_bgfysbb_fymc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">所需金额</div>
  </td>
  <td width="35%"> 
    <%=xz_bgfysbb_sxje%>
  </td>
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=xz_bgfysbb_bz%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">单位名称</div>
  </td>
  <td width="35%"> 
    <%=sq_dwxx_dwmc%>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
