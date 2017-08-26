<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String qh_fyb_sbxh=null;
String qh_fyb_sbrq=null;
String qh_fyb_zl=null;
String qh_fyb_sfjhn=null;
String qh_fyb_tfsj=null;
String qh_fyb_htfy=null;
String qh_fyb_sjfy=null;
String qh_fyb_htsfsp=null;
String qh_fyb_bz=null;
String sq_dwxx_dwmc=null;
String dm_xxlybm_xxlymc=null;
String whereqh_fyb_sbxh=null;
whereqh_fyb_sbxh=cf.GB2Uni(request.getParameter("sbxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select qh_fyb.sbxh as qh_fyb_sbxh,qh_fyb.sbrq as qh_fyb_sbrq,qh_fyb.zl as qh_fyb_zl,qh_fyb.sfjhn as qh_fyb_sfjhn,qh_fyb.tfsj as qh_fyb_tfsj,qh_fyb.htfy as qh_fyb_htfy,qh_fyb.sjfy as qh_fyb_sjfy,qh_fyb.htsfsp as qh_fyb_htsfsp,qh_fyb.bz as qh_fyb_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,dm_xxlybm.xxlymc as dm_xxlybm_xxlymc ";
	ls_sql+=" from  qh_fyb,sq_dwxx,dm_xxlybm";
	ls_sql+=" where qh_fyb.dwbh=sq_dwxx.dwbh and qh_fyb.xxlybm=dm_xxlybm.xxlybm and  (qh_fyb.sbxh='"+whereqh_fyb_sbxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		qh_fyb_sbxh=cf.fillNull(rs.getString("qh_fyb_sbxh"));
		qh_fyb_sbrq=cf.fillNull(rs.getDate("qh_fyb_sbrq"));
		qh_fyb_zl=cf.fillNull(rs.getString("qh_fyb_zl"));
		qh_fyb_sfjhn=cf.fillNull(rs.getString("qh_fyb_sfjhn"));
		qh_fyb_tfsj=cf.fillNull(rs.getString("qh_fyb_tfsj"));
		qh_fyb_htfy=cf.fillNull(rs.getString("qh_fyb_htfy"));
		qh_fyb_sjfy=cf.fillNull(rs.getString("qh_fyb_sjfy"));
		qh_fyb_htsfsp=cf.fillNull(rs.getString("qh_fyb_htsfsp"));
		qh_fyb_bz=cf.fillNull(rs.getString("qh_fyb_bz"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		dm_xxlybm_xxlymc=cf.fillNull(rs.getString("dm_xxlybm_xxlymc"));
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
    <div align="right">上报序号</div>
  </td>
  <td width="35%"> 
    <%=qh_fyb_sbxh%>
  </td>
  <td width="15%"> 
    <div align="right">申报日期</div>
  </td>
  <td width="35%"> 
    <%=qh_fyb_sbrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">种类</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"1+1类&2+2类",qh_fyb_zl,true);
%>
  </td>
  <td width="15%"> 
    <div align="right">是否计划内</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "Y+是&N+否",qh_fyb_sfjhn,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">投放时间</div>
  </td>
  <td width="35%"> 
    <%=qh_fyb_tfsj%>
  </td>
  <td width="15%"> 
    <div align="right">合同费用</div>
  </td>
  <td width="35%"> 
    <%=qh_fyb_htfy%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">实际费用</div>
  </td>
  <td width="35%"> 
    <%=qh_fyb_sjfy%>
  </td>
  <td width="15%"> 
    <div align="right">合同是否审批</div>
  </td>
  <td width="35%"> 
<%
	cf.radioToken(out, "Y+是&N+否",qh_fyb_htsfsp,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=qh_fyb_bz%>
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
    <div align="right">信息来源名称</div>
  </td>
  <td width="35%"> 
    <%=dm_xxlybm_xxlymc%>
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
