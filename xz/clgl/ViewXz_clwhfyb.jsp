<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_clwhfyb_djxh=null;
String xz_clwhfyb_xm=null;
String xz_clwhfyb_fy=null;
String xz_clwhfyb_djrq=null;
String xz_clwhfyb_jsr=null;
String xz_clwhfyb_pzr=null;
String xz_clwhfyb_bz=null;
String xz_qcdm_qcph=null;
String dm_dqbm_dqmc=null;
String wherexz_clwhfyb_djxh=null;
wherexz_clwhfyb_djxh=cf.GB2Uni(request.getParameter("djxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_clwhfyb.djxh as xz_clwhfyb_djxh,xz_clwhfyb.xm as xz_clwhfyb_xm,xz_clwhfyb.fy as xz_clwhfyb_fy,xz_clwhfyb.djrq as xz_clwhfyb_djrq,xz_clwhfyb.jsr as xz_clwhfyb_jsr,xz_clwhfyb.pzr as xz_clwhfyb_pzr,xz_clwhfyb.bz as xz_clwhfyb_bz,xz_qcdm.qcph as xz_qcdm_qcph,sq_dwxx.dwmc as sq_dwxx_dwmc ";
	ls_sql+=" from  xz_clwhfyb,xz_qcdm,sq_dwxx";
	ls_sql+=" where xz_clwhfyb.qcdm=xz_qcdm.qcdm and xz_qcdm.ssfgs=sq_dwxx.dwbh  and  (xz_clwhfyb.djxh='"+wherexz_clwhfyb_djxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_clwhfyb_djxh=cf.fillNull(rs.getString("xz_clwhfyb_djxh"));
		xz_clwhfyb_xm=cf.fillNull(rs.getString("xz_clwhfyb_xm"));
		xz_clwhfyb_fy=cf.fillNull(rs.getString("xz_clwhfyb_fy"));
		xz_clwhfyb_djrq=cf.fillNull(rs.getDate("xz_clwhfyb_djrq"));
		xz_clwhfyb_jsr=cf.fillNull(rs.getString("xz_clwhfyb_jsr"));
		xz_clwhfyb_pzr=cf.fillNull(rs.getString("xz_clwhfyb_pzr"));
		xz_clwhfyb_bz=cf.fillNull(rs.getString("xz_clwhfyb_bz"));
		xz_qcdm_qcph=cf.fillNull(rs.getString("xz_qcdm_qcph"));
		dm_dqbm_dqmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
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
    <%=xz_clwhfyb_djxh%>
  </td>
  <td width="15%"> 
    <div align="right">项目</div>
  </td>
  <td width="35%"> 
<%
	cf.selectToken(out,"01+修车&02+加油&03+保险&04+修饰&05+其它",xz_clwhfyb_xm,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">费用</div>
  </td>
  <td width="35%"> 
    <%=xz_clwhfyb_fy%>
  </td>
  <td width="15%"> 
    <div align="right">登记日期</div>
  </td>
  <td width="35%"> 
    <%=xz_clwhfyb_djrq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">经手人</div>
  </td>
  <td width="35%"> 
    <%=xz_clwhfyb_jsr%>
  </td>
  <td width="15%"> 
    <div align="right">批准人</div>
  </td>
  <td width="35%"> 
    <%=xz_clwhfyb_pzr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">备注</div>
  </td>
  <td width="35%"> 
    <%=xz_clwhfyb_bz%>
  </td>
  <td width="15%"> 
    <div align="right">汽车牌号</div>
  </td>
  <td width="35%"> 
    <%=xz_qcdm_qcph%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">分公司</div>
  </td>
  <td width="35%"> 
    <%=dm_dqbm_dqmc%>
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
