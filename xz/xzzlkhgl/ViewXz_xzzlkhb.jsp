<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xz_xzzlkhb_xh=null;
String xz_xzzlkhb_dwbh=null;
String xz_xzzlkhb_khsj=null;
String xz_xzzlkhb_khr=null;
String xz_xzzlkhb_cw=null;
String xz_xzzlkhb_ht=null;
String xz_xzzlkhb_dmgl=null;
String xz_xzzlkhb_wj=null;
String xz_xzzlkhb_wpsb=null;
String xz_xzzlkhb_bgyp=null;
String xz_xzzlkhb_xcyp=null;
String xz_xzzlkhb_gxbb=null;
String xz_xzzlkhb_jk=null;
String xz_xzzlkhb_kq=null;
String xz_xzzlkhb_gzap=null;
String xz_xzzlkhb_ts=null;
String xz_xzzlkhb_khbm=null;
String wherexz_xzzlkhb_xh=null;
wherexz_xzzlkhb_xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select xz_xzzlkhb.xh as xz_xzzlkhb_xh,xz_xzzlkhb.dwbh as xz_xzzlkhb_dwbh,xz_xzzlkhb.khsj as xz_xzzlkhb_khsj,xz_xzzlkhb.khr as xz_xzzlkhb_khr,xz_xzzlkhb.cw as xz_xzzlkhb_cw,xz_xzzlkhb.ht as xz_xzzlkhb_ht,xz_xzzlkhb.dmgl as xz_xzzlkhb_dmgl,xz_xzzlkhb.wj as xz_xzzlkhb_wj,xz_xzzlkhb.wpsb as xz_xzzlkhb_wpsb,xz_xzzlkhb.bgyp as xz_xzzlkhb_bgyp,xz_xzzlkhb.xcyp as xz_xzzlkhb_xcyp,xz_xzzlkhb.gxbb as xz_xzzlkhb_gxbb,xz_xzzlkhb.jk as xz_xzzlkhb_jk,xz_xzzlkhb.kq as xz_xzzlkhb_kq,xz_xzzlkhb.gzap as xz_xzzlkhb_gzap,xz_xzzlkhb.ts as xz_xzzlkhb_ts,xz_xzzlkhb.khbm as xz_xzzlkhb_khbm ";
	ls_sql+=" from  xz_xzzlkhb,sq_dwxx";
	ls_sql+=" where xz_xzzlkhb.dwbh=sq_dwxx.dwbh and  (xz_xzzlkhb.xh='"+wherexz_xzzlkhb_xh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xz_xzzlkhb_xh=cf.fillNull(rs.getString("xz_xzzlkhb_xh"));
		xz_xzzlkhb_dwbh=cf.fillNull(rs.getString("xz_xzzlkhb_dwbh"));
		xz_xzzlkhb_khsj=cf.fillNull(rs.getDate("xz_xzzlkhb_khsj"));
		xz_xzzlkhb_khr=cf.fillNull(rs.getString("xz_xzzlkhb_khr"));
		xz_xzzlkhb_cw=cf.fillNull(rs.getString("xz_xzzlkhb_cw"));
		xz_xzzlkhb_ht=cf.fillNull(rs.getString("xz_xzzlkhb_ht"));
		xz_xzzlkhb_dmgl=cf.fillNull(rs.getString("xz_xzzlkhb_dmgl"));
		xz_xzzlkhb_wj=cf.fillNull(rs.getString("xz_xzzlkhb_wj"));
		xz_xzzlkhb_wpsb=cf.fillNull(rs.getString("xz_xzzlkhb_wpsb"));
		xz_xzzlkhb_bgyp=cf.fillNull(rs.getString("xz_xzzlkhb_bgyp"));
		xz_xzzlkhb_xcyp=cf.fillNull(rs.getString("xz_xzzlkhb_xcyp"));
		xz_xzzlkhb_gxbb=cf.fillNull(rs.getString("xz_xzzlkhb_gxbb"));
		xz_xzzlkhb_jk=cf.fillNull(rs.getString("xz_xzzlkhb_jk"));
		xz_xzzlkhb_kq=cf.fillNull(rs.getString("xz_xzzlkhb_kq"));
		xz_xzzlkhb_gzap=cf.fillNull(rs.getString("xz_xzzlkhb_gzap"));
		xz_xzzlkhb_ts=cf.fillNull(rs.getString("xz_xzzlkhb_ts"));
		xz_xzzlkhb_khbm=cf.fillNull(rs.getString("xz_xzzlkhb_khbm"));
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
    <div align="right">考核序号</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_xh%>
  </td>
  <td width="15%"> 
    <div align="right">被考核部门</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh",xz_xzzlkhb_dwbh,true);
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考核时间</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_khsj%>
  </td>
  <td width="15%"> 
    <div align="right">考核人</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_khr%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">财务15分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_cw%>
  </td>
  <td width="15%"> 
    <div align="right">合同10分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_ht%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">店面管理10分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_dmgl%>
  </td>
  <td width="15%"> 
    <div align="right">文件5分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_wj%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">物品设备10</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_wpsb%>
  </td>
  <td width="15%"> 
    <div align="right">办公用品5分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_bgyp%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">宣传用品5分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_xcyp%>
  </td>
  <td width="15%"> 
    <div align="right">各项报表15分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_gxbb%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">监控5分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_jk%>
  </td>
  <td width="15%"> 
    <div align="right">考勤7分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_kq%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">工作安排8分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_gzap%>
  </td>
  <td width="15%"> 
    <div align="right">其它部门及人员投诉5分</div>
  </td>
  <td width="35%"> 
    <%=xz_xzzlkhb_ts%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考核部门</div>
  </td>
  <td width="35%"> 
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh",xz_xzzlkhb_khbm,true);
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
