<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jc_cgjgb_cgbm=null;
String jc_cgjgb_cgmc=null;
String jc_cgjgb_zsmbdj=null;
String jdm_mbbm_mbmc=null;
String jdm_mbfbbm_mbfbmc=null;
String jdm_xtbm_xtmc=null;
String jdm_lsbm_lsmc=null;
String jdm_tjbbm_tjbmc=null;
String jdm_ctbm_ctmc=null;
String jdm_jlbm_jlmc=null;
String jc_cgjgb_zp=null;
String jc_cgjgb_bz=null;
String jc_cgjgb_dwbh=null;

String dwmc=null;
String dwdh=null;
String dwdz=null;

String cgbm=null;
cgbm=cf.GB2Uni(request.getParameter("cgbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select jc_cgjgb.cgbm as jc_cgjgb_cgbm,jc_cgjgb.cgmc as jc_cgjgb_cgmc,jc_cgjgb.zsmbdj as jc_cgjgb_zsmbdj,jdm_mbbm.mbmc as jdm_mbbm_mbmc,jdm_mbfbbm.mbfbmc as jdm_mbfbbm_mbfbmc,jdm_xtbm.xtmc as jdm_xtbm_xtmc,jdm_lsbm.lsmc as jdm_lsbm_lsmc,jdm_tjbbm.tjbmc as jdm_tjbbm_tjbmc,jdm_ctbm.ctmc as jdm_ctbm_ctmc,jdm_jlbm.jlmc as jdm_jlbm_jlmc,jc_cgjgb.zp as jc_cgjgb_zp,jc_cgjgb.bz as jc_cgjgb_bz,jc_cgjgb.dwbh as jc_cgjgb_dwbh ";
	ls_sql+=" from  jc_cgjgb,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm";
	ls_sql+=" where jc_cgjgb.jlbm=jdm_jlbm.jlbm(+) and jc_cgjgb.ctbm=jdm_ctbm.ctbm(+) and jc_cgjgb.tjbbm=jdm_tjbbm.tjbbm(+)";
	ls_sql+=" and jc_cgjgb.lsbm=jdm_lsbm.lsbm(+) and jc_cgjgb.xtbm=jdm_xtbm.xtbm(+) and jc_cgjgb.mbfbbm=jdm_mbfbbm.mbfbbm(+)";
	ls_sql+=" and jc_cgjgb.mbbm=jdm_mbbm.mbbm(+) and  (jc_cgjgb.cgbm='"+cgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jc_cgjgb_cgbm=cf.fillNull(rs.getString("jc_cgjgb_cgbm"));
		jc_cgjgb_cgmc=cf.fillNull(rs.getString("jc_cgjgb_cgmc"));
		jc_cgjgb_zsmbdj=cf.fillNull(rs.getString("jc_cgjgb_zsmbdj"));
		jdm_mbbm_mbmc=cf.fillNull(rs.getString("jdm_mbbm_mbmc"));
		jdm_mbfbbm_mbfbmc=cf.fillNull(rs.getString("jdm_mbfbbm_mbfbmc"));
		jdm_xtbm_xtmc=cf.fillNull(rs.getString("jdm_xtbm_xtmc"));
		jdm_lsbm_lsmc=cf.fillNull(rs.getString("jdm_lsbm_lsmc"));
		jdm_tjbbm_tjbmc=cf.fillNull(rs.getString("jdm_tjbbm_tjbmc"));
		jdm_ctbm_ctmc=cf.fillNull(rs.getString("jdm_ctbm_ctmc"));
		jdm_jlbm_jlmc=cf.fillNull(rs.getString("jdm_jlbm_jlmc"));
		jc_cgjgb_zp=cf.fillNull(rs.getString("jc_cgjgb_zp"));
		jc_cgjgb_bz=cf.fillNull(rs.getString("jc_cgjgb_bz"));
		jc_cgjgb_dwbh=cf.fillNull(rs.getString("jc_cgjgb_dwbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select dwmc,dwdh,dwdz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+jc_cgjgb_dwbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwdz=cf.fillNull(rs.getString("dwdz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">查看橱柜价格信息 </div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">橱柜编码</div>
    </td>
    <td width="33%"> <%=jc_cgjgb_cgbm%> </td>
    <td width="17%"> 
      <div align="right">橱柜名称</div>
    </td>
    <td width="33%"><%=jc_cgjgb_cgmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">生产厂家</td>
    <td width="33%"><%=dwmc%> </td>
    <td width="17%" align="right">厂家电话</td>
    <td width="33%"><%=dwdh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">厂家地址</td>
    <td colspan="3"><%=dwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">门板</div>
    </td>
    <td width="33%"> <%=jdm_mbbm_mbmc%> </td>
    <td width="17%"> 
      <div align="right">门板封边</div>
    </td>
    <td width="33%"> <%=jdm_mbfbbm_mbfbmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">箱体</div>
    </td>
    <td width="33%"> <%=jdm_xtbm_xtmc%> </td>
    <td width="17%"> 
      <div align="right">拉手</div>
    </td>
    <td width="33%"> <%=jdm_lsbm_lsmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">踢脚板</div>
    </td>
    <td width="33%"> <%=jdm_tjbbm_tjbmc%> </td>
    <td width="17%"> 
      <div align="right">抽屉</div>
    </td>
    <td width="33%"> <%=jdm_ctbm_ctmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">铰链</td>
    <td width="33%"><%=jdm_jlbm_jlmc%></td>
    <td rowspan="3" width="17%"> 
      <div align="right">照片</div>
    </td>
    <td rowspan="3" width="33%"><IMG SRC="/jcjj/cgjg/cgjg/images/<%=jc_cgjgb_zp%>" ></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">装饰门板单价</td>
    <td width="33%"><%=jc_cgjgb_zsmbdj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">照片</div>
    </td>
    <td width="33%"> <%=jc_cgjgb_zp%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">备注</td>
    <td colspan="3"><%=jc_cgjgb_bz%></td>
  </tr>
</table>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

%>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">吊柜进深区间</td>
	<td  width="35%">吊柜高度区间</td>
	<td  width="12%">零售价</td>
	<td  width="12%">优惠价</td>
</tr>
<%
	ls_sql="SELECT jdm_dgjsbm.dgjsmc as jdm_dgjsbm_dgjsmc,jdm_dggdbm.dggdmc as jdm_dggdbm_dggdmc,jc_dgjgb.lsj as jc_dgjgb_lsj,jc_dgjgb.yhj as jc_dgjgb_yhj  ";
	ls_sql+=" FROM jdm_dgjsbm,jdm_dggdbm,jc_dgjgb  ";
    ls_sql+=" where jc_dgjgb.dgjsbm=jdm_dgjsbm.dgjsbm and jc_dgjgb.dggdbm=jdm_dggdbm.dggdbm";
    ls_sql+=" and jc_dgjgb.cgbm='"+cgbm+"'";
    ls_sql+=" order by jc_dgjgb.dgjsbm,jc_dgjgb.dggdbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdm_dgjsbm_dgjsmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="25%">地柜进深区间</td>
	<td  width="35%">地柜高度区间</td>
	<td  width="12%">零售价</td>
	<td  width="12%">优惠价</td>
</tr>
<%
	ls_sql="SELECT jdm_tgjsbm.tgjsmc as jdm_tgjsbm_tgjsmc,jdm_tggdbm.tggdmc as jdm_tggdbm_tggdmc,jc_tgjgb.lsj as jc_tgjgb_lsj,jc_tgjgb.yhj as jc_tgjgb_yhj  ";
	ls_sql+=" FROM jdm_tgjsbm,jdm_tggdbm,jc_tgjgb  ";
    ls_sql+=" where jc_tgjgb.tgjsbm=jdm_tgjsbm.tgjsbm and jc_tgjgb.tggdbm=jdm_tggdbm.tggdbm";
    ls_sql+=" and jc_tgjgb.cgbm='"+cgbm+"'";
    ls_sql+=" order by jc_tgjgb.tgjsbm,jc_tgjgb.tggdbm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	spanColHash.put("jdm_tgjsbm_tgjsmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>


</body>
</html>
