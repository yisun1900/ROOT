<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_bgypshb_sqxh=null;
String sq_dwxx_dwmc=null;
String xz_bgypshb_sqrq=null;
String xz_bgypshb_sqr=null;
String xz_bgypbm_bgypmc=null;
String xz_bgypshb_sqsl=null;
String xz_bgypshb_pzsl=null;
String xz_bgypshb_syjcsl=null;
String xz_bgypshb_bz=null;
String wherexz_bgypshb_sqxh=null;
wherexz_bgypshb_sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_bgypshb.sqxh as xz_bgypshb_sqxh,sq_dwxx.dwmc as sq_dwxx_dwmc,xz_bgypshb.sqrq as xz_bgypshb_sqrq,xz_bgypshb.sqr as xz_bgypshb_sqr,xz_bgypbm.bgypmc as xz_bgypbm_bgypmc,xz_bgypshb.sqsl as xz_bgypshb_sqsl,xz_bgypshb.pzsl as xz_bgypshb_pzsl,xz_bgypshb.syjcsl as xz_bgypshb_syjcsl,xz_bgypshb.bz as xz_bgypshb_bz ";
	ls_sql+=" from  xz_bgypbm,xz_bgypshb,sq_dwxx";
	ls_sql+=" where xz_bgypshb.bgypbh=xz_bgypbm.bgypbh and xz_bgypshb.dwbh=sq_dwxx.dwbh and  (xz_bgypshb.sqxh='"+wherexz_bgypshb_sqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_bgypshb_sqxh=cf.fillNull(rs.getString("xz_bgypshb_sqxh"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		xz_bgypshb_sqrq=cf.fillNull(rs.getDate("xz_bgypshb_sqrq"));
		xz_bgypshb_sqr=cf.fillNull(rs.getString("xz_bgypshb_sqr"));
		xz_bgypbm_bgypmc=cf.fillNull(rs.getString("xz_bgypbm_bgypmc"));
		xz_bgypshb_sqsl=cf.fillNull(rs.getString("xz_bgypshb_sqsl"));
		xz_bgypshb_pzsl=cf.fillNull(rs.getString("xz_bgypshb_pzsl"));
		xz_bgypshb_syjcsl=cf.fillNull(rs.getString("xz_bgypshb_syjcsl"));
		xz_bgypshb_bz=cf.fillNull(rs.getString("xz_bgypshb_bz"));
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
    <%=xz_bgypshb_sqxh%>
  </td>
  <td width="15%"> 
    <div align="right">单位名称</div>
  </td>
  <td width="35%"> 
    <%=sq_dwxx_dwmc%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">申请日期</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypshb_sqrq%>
  </td>
  <td width="15%"> 
    <div align="right">申请人</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypshb_sqr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">办公用品名称</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypbm_bgypmc%>
  </td>
  <td width="15%"> 
    <div align="right">申请数量</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypshb_sqsl%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">批准数量</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypshb_pzsl%>
  </td>
  <td width="15%"> 
    <div align="right">上月结存数量</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypshb_syjcsl%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=xz_bgypshb_bz%>
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
