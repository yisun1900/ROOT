<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_dzyhppdmx_pdxh=null;
String xz_dzyhppdmx_bh=null;
String xz_dzyhppdmx_mc=null;
String xz_dzyhppdmx_dw=null;
String xz_dzyhppdmx_sl=null;
String xz_dzyhppdmx_xhjgg=null;
String xz_dzyhppdmx_grsj=null;
String xz_dzyhppdmx_gryz=null;
String xz_dzyhppdmx_zrr=null;
String xz_dzyhppdmx_pdr=null;
String xz_dzyhppdmx_pdsj=null;
String xz_dzyhppdmx_bz=null;
String sq_dwxx_dwmc=null;
String wherexz_dzyhppdmx_pdxh=null;
wherexz_dzyhppdmx_pdxh=cf.GB2Uni(request.getParameter("pdxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_dzyhppdmx.pdxh as xz_dzyhppdmx_pdxh,xz_dzyhppdmx.bh as xz_dzyhppdmx_bh,xz_dzyhppdmx.mc as xz_dzyhppdmx_mc,xz_dzyhppdmx.dw as xz_dzyhppdmx_dw,xz_dzyhppdmx.sl as xz_dzyhppdmx_sl,xz_dzyhppdmx.xhjgg as xz_dzyhppdmx_xhjgg,xz_dzyhppdmx.grsj as xz_dzyhppdmx_grsj,xz_dzyhppdmx.gryz as xz_dzyhppdmx_gryz,xz_dzyhppdmx.zrr as xz_dzyhppdmx_zrr,xz_dzyhppdmx.pdr as xz_dzyhppdmx_pdr,xz_dzyhppdmx.pdsj as xz_dzyhppdmx_pdsj,xz_dzyhppdmx.bz as xz_dzyhppdmx_bz,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" from  sq_dwxx,xz_dzyhppdmx";
	ls_sql+=" where xz_dzyhppdmx.dwbh=sq_dwxx.dwbh and  (xz_dzyhppdmx.pdxh='"+wherexz_dzyhppdmx_pdxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_dzyhppdmx_pdxh=cf.fillNull(rs.getString("xz_dzyhppdmx_pdxh"));
		xz_dzyhppdmx_bh=cf.fillNull(rs.getString("xz_dzyhppdmx_bh"));
		xz_dzyhppdmx_mc=cf.fillNull(rs.getString("xz_dzyhppdmx_mc"));
		xz_dzyhppdmx_dw=cf.fillNull(rs.getString("xz_dzyhppdmx_dw"));
		xz_dzyhppdmx_sl=cf.fillNull(rs.getString("xz_dzyhppdmx_sl"));
		xz_dzyhppdmx_xhjgg=cf.fillNull(rs.getString("xz_dzyhppdmx_xhjgg"));
		xz_dzyhppdmx_grsj=cf.fillNull(rs.getDate("xz_dzyhppdmx_grsj"));
		xz_dzyhppdmx_gryz=cf.fillNull(rs.getString("xz_dzyhppdmx_gryz"));
		xz_dzyhppdmx_zrr=cf.fillNull(rs.getString("xz_dzyhppdmx_zrr"));
		xz_dzyhppdmx_pdr=cf.fillNull(rs.getString("xz_dzyhppdmx_pdr"));
		xz_dzyhppdmx_pdsj=cf.fillNull(rs.getDate("xz_dzyhppdmx_pdsj"));
		xz_dzyhppdmx_bz=cf.fillNull(rs.getString("xz_dzyhppdmx_bz"));
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
    <div align="right">盘点序号</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_pdxh%>
  </td>
  <td width="15%"> 
    <div align="right">编号</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_bh%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">名称</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_mc%>
  </td>
  <td width="15%"> 
    <div align="right">单位</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_dw%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">数量</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_sl%>
  </td>
  <td width="15%"> 
    <div align="right">型号及规格</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_xhjgg%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">购入时间</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_grsj%>
  </td>
  <td width="15%"> 
    <div align="right">购入原值</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_gryz%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">责任人</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_zrr%>
  </td>
  <td width="15%"> 
    <div align="right">盘点人</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_pdr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">盘点时间</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_pdsj%>
  </td>
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=xz_dzyhppdmx_bz%>
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
