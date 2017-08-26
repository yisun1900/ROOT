<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_yplydjb_xh=null;
String xz_yplydjb_qcdm=null;
String xz_yplydjb_ybh=null;
String xz_yplydjb_lysl=null;
String xz_yplydjb_cllcs=null;
String xz_yplydjb_lyrq=null;
String xz_yplydjb_lyr=null;
String xz_yplydjb_bz=null;
String wherexz_yplydjb_xh=null;
wherexz_yplydjb_xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_yplydjb.xh as xz_yplydjb_xh,xz_yplydjb.qcdm as xz_yplydjb_qcdm,xz_yplydjb.ybh as xz_yplydjb_ybh,xz_yplydjb.lysl as xz_yplydjb_lysl,xz_yplydjb.cllcs as xz_yplydjb_cllcs,xz_yplydjb.lyrq as xz_yplydjb_lyrq,xz_yplydjb.lyr as xz_yplydjb_lyr,xz_yplydjb.bz as xz_yplydjb_bz ";
	ls_sql+=" from  xz_qcdm,xz_yplydjb";
	ls_sql+=" where xz_yplydjb.qcdm=xz_qcdm.qcdm and  (xz_yplydjb.xh='"+wherexz_yplydjb_xh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_yplydjb_xh=cf.fillNull(rs.getString("xz_yplydjb_xh"));
		xz_yplydjb_qcdm=cf.fillNull(rs.getString("xz_yplydjb_qcdm"));
		xz_yplydjb_ybh=cf.fillNull(rs.getString("xz_yplydjb_ybh"));
		xz_yplydjb_lysl=cf.fillNull(rs.getString("xz_yplydjb_lysl"));
		xz_yplydjb_cllcs=cf.fillNull(rs.getString("xz_yplydjb_cllcs"));
		xz_yplydjb_lyrq=cf.fillNull(rs.getDate("xz_yplydjb_lyrq"));
		xz_yplydjb_lyr=cf.fillNull(rs.getString("xz_yplydjb_lyr"));
		xz_yplydjb_bz=cf.fillNull(rs.getString("xz_yplydjb_bz"));
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
    <div align="right">序号</div>
  </td>
  <td width="35%"> 
    <%=xz_yplydjb_xh%>
  </td>
  <td width="15%"> 
    <div align="right">汽车代码</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select qcdm,qcph from xz_qcdm order by qcdm",xz_yplydjb_qcdm,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">油标号</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"90+90#&92+92#&93+93#&94+94#&95+95#&96+96#&97+97#&98+98#",xz_yplydjb_ybh,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">加油数量</div>
  </td>
  <td width="35%"> 
    <%=xz_yplydjb_lysl%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">车辆里程数</div>
  </td>
  <td width="35%"> 
    <%=xz_yplydjb_cllcs%>
  </td>
  <td width="15%"> 
    <div align="right">加油日期</div>
  </td>
  <td width="35%"> 
    <%=xz_yplydjb_lyrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">加油人</div>
  </td>
  <td width="35%"> 
    <%=xz_yplydjb_lyr%>
  </td>
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=xz_yplydjb_bz%>
  </td>
</tr>
         </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
