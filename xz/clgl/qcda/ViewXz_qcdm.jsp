<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_qcdm_qcph=null;
String xz_qcdm_qcxh=null;
String xz_qcdm_sjxm=null;
String xz_qcdm_gcsj=null;
String xz_qcdm_njrq=null;
String xz_qcdm_yxsgls=null;
String sq_dwxx_dwmc=null;
String xz_qcdm_lrr=null;
String xz_qcdm_lrsj=null;
String xz_qcdm_bz=null;
String wherexz_qcdm_qcph=null;
wherexz_qcdm_qcph=cf.GB2Uni(request.getParameter("qcph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_qcdm.qcph as xz_qcdm_qcph,xz_qcdm.qcxh as xz_qcdm_qcxh,xz_qcdm.sjxm as xz_qcdm_sjxm,xz_qcdm.gcsj as xz_qcdm_gcsj,xz_qcdm.njrq as xz_qcdm_njrq,xz_qcdm.yxsgls as xz_qcdm_yxsgls,sq_dwxx.dwmc as sq_dwxx_dwmc,xz_qcdm.lrr as xz_qcdm_lrr,xz_qcdm.lrsj as xz_qcdm_lrsj,xz_qcdm.bz as xz_qcdm_bz ";
	ls_sql+=" from  sq_dwxx,xz_qcdm";
	ls_sql+=" where sq_dwxx.dwbh=xz_qcdm.ssfgs and  (xz_qcdm.qcph='"+wherexz_qcdm_qcph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_qcdm_qcph=cf.fillNull(rs.getString("xz_qcdm_qcph"));
		xz_qcdm_qcxh=cf.fillNull(rs.getString("xz_qcdm_qcxh"));
		xz_qcdm_sjxm=cf.fillNull(rs.getString("xz_qcdm_sjxm"));
		xz_qcdm_gcsj=cf.fillNull(rs.getDate("xz_qcdm_gcsj"));
		xz_qcdm_njrq=cf.fillNull(rs.getDate("xz_qcdm_njrq"));
		xz_qcdm_yxsgls=cf.fillNull(rs.getString("xz_qcdm_yxsgls"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		xz_qcdm_lrr=cf.fillNull(rs.getString("xz_qcdm_lrr"));
		xz_qcdm_lrsj=cf.fillNull(rs.getDate("xz_qcdm_lrsj"));
		xz_qcdm_bz=cf.fillNull(rs.getString("xz_qcdm_bz"));
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
<div align="center"> 汽车档案</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 汽车牌号 </td>
    <td width="31%"> <%=xz_qcdm_qcph%> </td>
    <td align="right" width="19%">司机姓名 </td>
    <td width="31%"> <%=xz_qcdm_sjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 汽车型号 </td>
    <td colspan="3"><%=xz_qcdm_qcxh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">购车时间 </td>
    <td width="31%"><%=xz_qcdm_gcsj%> </td>
    <td align="right" width="19%">年检日期 </td>
    <td width="31%"><%=xz_qcdm_njrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%"> 所属分公司 </td>
    <td width="31%"> <%=sq_dwxx_dwmc%> </td>
    <td align="right" width="19%">已行使公里数 </td>
    <td width="31%"><%=xz_qcdm_yxsgls%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">录入人</td>
    <td width="31%"><%=xz_qcdm_lrr%></td>
    <td align="right" width="19%">录入时间</td>
    <td width="31%"><%=xz_qcdm_lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right" width="19%">备注 </td>
    <td colspan="3"><%=xz_qcdm_bz%> </td>
  </tr>
</table>
</body>
</html>
