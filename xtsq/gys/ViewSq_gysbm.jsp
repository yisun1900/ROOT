<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_gysbm_gysbm=null;
String sq_gysbm_gys=null;
String dm_dqbm_dqmc=null;
String sq_gysbm_gyslb=null;
String jdm_zcdlbm_zcdlmc=null;
String sq_gysbm_gysdz=null;
String sq_gysbm_gysfzr=null;
String sq_gysbm_gysdh=null;
String sq_gysbm_gyscz=null;
String sq_gysbm_email=null;
String sq_gysbm_cxbz=null;
String sq_gysbm_bz=null;
String yhdlm=null;
String yhkl=null;
String yhmc=null;

String yhzmc="";

String gysbm=request.getParameter("gysbm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yhdlm,yhkl,yhmc,sq_gysbm.gysbm as sq_gysbm_gysbm,sq_gysbm.gys as sq_gysbm_gys,dm_dqbm.dqmc as dm_dqbm_dqmc,sq_gysbm.gysdz as sq_gysbm_gysdz,sq_gysbm.gysfzr as sq_gysbm_gysfzr,sq_gysbm.gysdh as sq_gysbm_gysdh,sq_gysbm.gyscz as sq_gysbm_gyscz,sq_gysbm.email as sq_gysbm_email,sq_gysbm.bz as sq_gysbm_bz ";
	ls_sql+=" from  dm_dqbm,sq_gysbm";
	ls_sql+=" where sq_gysbm.dqbm=dm_dqbm.dqbm";
	ls_sql+=" and  sq_gysbm.gysbm='"+gysbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		sq_gysbm_gysbm=cf.fillNull(rs.getString("sq_gysbm_gysbm"));
		sq_gysbm_gys=cf.fillNull(rs.getString("sq_gysbm_gys"));
		dm_dqbm_dqmc=cf.fillNull(rs.getString("dm_dqbm_dqmc"));
		sq_gysbm_gysdz=cf.fillNull(rs.getString("sq_gysbm_gysdz"));
		sq_gysbm_gysfzr=cf.fillNull(rs.getString("sq_gysbm_gysfzr"));
		sq_gysbm_gysdh=cf.fillNull(rs.getString("sq_gysbm_gysdh"));
		sq_gysbm_gyscz=cf.fillNull(rs.getString("sq_gysbm_gyscz"));
		sq_gysbm_email=cf.fillNull(rs.getString("sq_gysbm_email"));
		sq_gysbm_bz=cf.fillNull(rs.getString("sq_gysbm_bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select yhzmc ";
	ls_sql+=" from  sq_yhssz,sq_yhz";
	ls_sql+=" where sq_yhssz.yhdlm='"+yhdlm+"' and sq_yhssz.yhzbh =sq_yhz.yhzbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		yhzmc+=cf.fillNull(rs.getString("yhzmc"))+"；";
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
<div align="center">供应商信息 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">供应商编号</div>
    </td>
    <td width="29%"> <%=sq_gysbm_gysbm%> </td>
    <td width="21%"> 
      <div align="right">供应商名称</div>
    </td>
    <td width="29%"> <%=sq_gysbm_gys%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">所属地区</div>
    </td>
    <td width="29%"> <%=dm_dqbm_dqmc%> </td>
    <td width="21%"> 
      <div align="right">供应商电话</div>
    </td>
    <td width="29%"><%=sq_gysbm_gysdh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">供应商地址</td>
    <td colspan="3"><%=sq_gysbm_gysdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">供应商传真</div>
    </td>
    <td width="29%"> <%=sq_gysbm_gyscz%> </td>
    <td width="21%"> 
      <div align="right">EMail</div>
    </td>
    <td width="29%"> <%=sq_gysbm_email%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">用户登录名</td>
    <td width="29%"><%=yhdlm%></td>
    <td width="21%" align="right">用户口令</td>
    <td width="29%"><%=cf.makejm(yhkl)%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%"> 
      <div align="right">用户名称</div>
    </td>
    <td width="29%"><%=yhmc%> </td>
    <td width="21%"> 
      <div align="right">供应商负责人</div>
    </td>
    <td width="29%"><%=sq_gysbm_gysfzr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">用户所属组</td>
    <td colspan="3"><%=yhzmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">备注</td>
    <td colspan="3"><%=sq_gysbm_bz%></td>
  </tr>
</table>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">联系人姓名</td>
	<td  width="10%">职务</td>
	<td  width="14%">手机</td>
	<td  width="22%">办公电话</td>
	<td  width="12%">传真</td>
	<td  width="8%">是否离职</td>
	<td  width="18%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT sq_gyslxr.lxrxm as lxrxm,sq_gyslxr.zw as sq_gyslxr_zw,sq_gyslxr.sj as sq_gyslxr_sj,sq_gyslxr.bgdh as sq_gyslxr_bgdh,sq_gyslxr.cz as sq_gyslxr_cz, DECODE(sq_gyslxr.sflz,'Y','是','N','否') as sq_gyslxr_sflz,sq_gyslxr.bz as sq_gyslxr_bz  ";
	ls_sql+=" FROM sq_gyslxr  ";
    ls_sql+=" where sq_gyslxr.gysbm='"+gysbm+"'";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">品牌供应商编号</td>
	<td  width="20%">品牌供应商名称</td>
	<td  width="6%">每日安装户数限制</td>
	<td  width="7%">供应商类别</td>
	<td  width="11%">主材类别</td>
	<td  width="5%">品牌编码</td>
	<td  width="15%">品牌名称</td>
	<td  width="6%">所属地区</td>
	<td  width="24%">备注</td>
</tr>
<%
	ls_sql="SELECT sq_gysxx.gysbh,sq_gysxx.gysmc,mrazhs,DECODE(sq_gysxx.gyslb,'1','木门','2','橱柜','3','家具','4','主材') gyslb,zclb,sq_gysxx.ppbm,sq_gysxx.ppmc,dm_dqbm.dqmc, sq_gysxx.bz  ";
	ls_sql+=" FROM dm_dqbm,sq_gysxx  ";
    ls_sql+=" where sq_gysxx.dqbm=dm_dqbm.dqbm and sq_gysxx.gysbm='"+gysbm+"'";
	ls_sql+=" order by sq_gysxx.dqbm,sq_gysxx.gyslb,sq_gysxx.zclb";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


%>
</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50%">供应商编号</td>
	<td  width="50%">所属分公司</td>
</tr>
<%
	ls_sql="SELECT sq_gyssqfgs.gysbm,dwmc";
	ls_sql+=" FROM sq_gyssqfgs,sq_dwxx  ";
    ls_sql+=" where sq_gyssqfgs.ssfgs=sq_dwxx.dwbh and sq_gyssqfgs.gysbm='"+gysbm+"'";
	ls_sql+=" order by sq_gyssqfgs.ssfgs";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


%>
</table>

</body>
</html>
