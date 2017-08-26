<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_pcsq_sqxh=null;
String xz_pcsq_sqrq=null;
String xz_pcsq_dwbh=null;
String xz_pcsq_ycsy=null;
String xz_pcsq_mdd=null;
String xz_pcsq_ycsj=null;
String xz_pcsq_fhsj=null;
String xz_pcsq_gls=null;
String xz_pcsq_sqr=null;
String xz_pcsq_pzr=null;
String xz_pcsq_qcdm=null;
String wherexz_pcsq_sqxh=null;
wherexz_pcsq_sqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_pcsq.sqxh as xz_pcsq_sqxh,xz_pcsq.sqrq as xz_pcsq_sqrq,xz_pcsq.dwbh as xz_pcsq_dwbh,xz_pcsq.ycsy as xz_pcsq_ycsy,xz_pcsq.mdd as xz_pcsq_mdd,xz_pcsq.ycsj as xz_pcsq_ycsj,xz_pcsq.fhsj as xz_pcsq_fhsj,xz_pcsq.gls as xz_pcsq_gls,xz_pcsq.sqr as xz_pcsq_sqr,xz_pcsq.pzr as xz_pcsq_pzr,xz_pcsq.qcdm as xz_pcsq_qcdm ";
	ls_sql+=" from  xz_pcsq,sq_dwxx,xz_qcdm";
	ls_sql+=" where xz_pcsq.qcdm=xz_qcdm.qcdm(+) and xz_pcsq.dwbh=sq_dwxx.dwbh(+) and  (xz_pcsq.sqxh='"+wherexz_pcsq_sqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_pcsq_sqxh=cf.fillNull(rs.getString("xz_pcsq_sqxh"));
		xz_pcsq_sqrq=cf.fillNull(rs.getDate("xz_pcsq_sqrq"));
		xz_pcsq_dwbh=cf.fillNull(rs.getString("xz_pcsq_dwbh"));
		xz_pcsq_ycsy=cf.fillNull(rs.getString("xz_pcsq_ycsy"));
		xz_pcsq_mdd=cf.fillNull(rs.getString("xz_pcsq_mdd"));
		xz_pcsq_ycsj=cf.fillNull(rs.getString("xz_pcsq_ycsj"));
		xz_pcsq_fhsj=cf.fillNull(rs.getString("xz_pcsq_fhsj"));
		xz_pcsq_gls=cf.fillNull(rs.getString("xz_pcsq_gls"));
		xz_pcsq_sqr=cf.fillNull(rs.getString("xz_pcsq_sqr"));
		xz_pcsq_pzr=cf.fillNull(rs.getString("xz_pcsq_pzr"));
		xz_pcsq_qcdm=cf.fillNull(rs.getString("xz_pcsq_qcdm"));
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
    <%=xz_pcsq_sqxh%>
  </td>
  <td width="15%"> 
    <div align="right">申请日期</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_sqrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">申请部门编号</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh",xz_pcsq_dwbh,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">用车事由</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_ycsy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">目的地</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_mdd%>
  </td>
  <td width="15%"> 
    <div align="right">用车时间</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_ycsj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">返回时间</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_fhsj%>
  </td>
  <td width="15%"> 
    <div align="right">公里数</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_gls%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">申请人</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_sqr%>
  </td>
  <td width="15%"> 
    <div align="right">批准人</div>
  </td>
  <td width="35%"> 
    <%=xz_pcsq_pzr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">车号</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select qcdm,qcph from xz_qcdm order by qcdm",xz_pcsq_qcdm,true);
%>
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
