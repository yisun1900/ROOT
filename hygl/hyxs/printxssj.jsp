<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ywxh=request.getParameter("ywxh");
String wherehy_hyxxb_hybh=cf.executeQuery("select khbh from dm_xsjl where ywxh='"+ywxh+"'");


String hy_hyxxb_hybh=null;
String hy_hyxxb_sfzf=null;
String hy_hyxxb_hymm=null;
String hy_hyxxb_hyxm=null;
String hy_hyxxb_xb=null;
String hy_hyxxb_yzbm=null;
String hy_hyxxb_hydz=null;
String hy_hyxxb_sfzhm=null;
String hy_hyxxb_dh=null;
String hy_hyxxb_sj=null;
String hy_hyxxb_dzxx=null;
String hy_hyxxb_csrq=null;
String hy_hyxxb_zydm=null;
String hy_hyxxb_ysrdm=null;
String hy_hyxxb_hyzk=null;
String hy_hyxxb_jhjnr=null;
String hy_hyxxb_arxm=null;
String hy_hyxxb_arsr=null;
String hy_hyxxb_jgyxbm=null;
String hy_hyxxb_fwyxbm=null;
String hy_hyxxb_fgyxbm=null;
String hy_hyxxb_gyyxbm=null;
String hy_hyxxb_zdfgbm=null;
String hy_hyxxb_psahbm=null;
String hy_hyxxb_bzzz=null;
String hy_hyxxb_sztlpp=null;
String hy_hyxxb_shop=null;
String hy_hyxxb_hzppp=null;
String hy_hyxxb_fzpp=null;
String sq_dwxx_dwmc=null;
String hy_hyxxb_rhrq=null;
String hy_hyxxb_yxrq=null;
String hy_hyxxb_hykh=null;
String hy_hyjbb_hyjb=null;
String hy_hyxxb_fwlx=null;
String hy_hyxxb_gmcs=null;
String hy_hyxxb_xfzje=null;
String hy_hyxxb_jf=null;
String hy_hyxxb_wdhjf=null;
String hy_hyxxb_xxlrr=null;
String hy_hyxxb_bz=null;
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
PreparedStatement ps=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hy_hyxxb.hybh as hy_hyxxb_hybh,hy_hyxxb.sfzf as hy_hyxxb_sfzf,hy_hyxxb.hymm as hy_hyxxb_hymm,hy_hyxxb.hyxm as hy_hyxxb_hyxm,hy_hyxxb.xb as hy_hyxxb_xb,hy_hyxxb.yzbm as hy_hyxxb_yzbm,hy_hyxxb.hydz as hy_hyxxb_hydz,hy_hyxxb.sfzhm as hy_hyxxb_sfzhm,hy_hyxxb.dh as hy_hyxxb_dh,hy_hyxxb.sj as hy_hyxxb_sj,hy_hyxxb.dzxx as hy_hyxxb_dzxx,hy_hyxxb.csrq as hy_hyxxb_csrq,hy_hyxxb.zydm as hy_hyxxb_zydm,hy_hyxxb.ysrdm as hy_hyxxb_ysrdm,hy_hyxxb.hyzk as hy_hyxxb_hyzk,hy_hyxxb.jhjnr as hy_hyxxb_jhjnr,hy_hyxxb.arxm as hy_hyxxb_arxm,hy_hyxxb.arsr as hy_hyxxb_arsr,hy_hyxxb.jgyxbm as hy_hyxxb_jgyxbm,hy_hyxxb.fwyxbm as hy_hyxxb_fwyxbm,hy_hyxxb.fgyxbm as hy_hyxxb_fgyxbm,hy_hyxxb.gyyxbm as hy_hyxxb_gyyxbm,hy_hyxxb.zdfgbm as hy_hyxxb_zdfgbm,hy_hyxxb.psahbm as hy_hyxxb_psahbm,hy_hyxxb.bzzz as hy_hyxxb_bzzz,hy_hyxxb.sztlpp as hy_hyxxb_sztlpp,hy_hyxxb.shop as hy_hyxxb_shop,hy_hyxxb.hzppp as hy_hyxxb_hzppp,hy_hyxxb.fzpp as hy_hyxxb_fzpp,sq_dwxx.dwmc as sq_dwxx_dwmc,hy_hyxxb.rhrq as hy_hyxxb_rhrq,hy_hyxxb.yxrq as hy_hyxxb_yxrq,hy_hyxxb.hykh as hy_hyxxb_hykh,hy_hyjbb.hyjb as hy_hyjbb_hyjb,hy_hyxxb.fwlx as hy_hyxxb_fwlx,hy_hyxxb.gmcs as hy_hyxxb_gmcs,hy_hyxxb.xfzje as hy_hyxxb_xfzje,hy_hyxxb.jf as hy_hyxxb_jf,hy_hyxxb.wdhjf as hy_hyxxb_wdhjf,hy_hyxxb.xxlrr as hy_hyxxb_xxlrr,hy_hyxxb.bz as hy_hyxxb_bz ";
	ls_sql+=" from  hy_hyjbb,hy_hyxxb,sq_dwxx";
	ls_sql+=" where hy_hyxxb.dwbh=sq_dwxx.dwbh and hy_hyxxb.hyjb=hy_hyjbb.hyjbbh(+) and (hy_hyxxb.hybh='"+wherehy_hyxxb_hybh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hy_hyxxb_hybh=cf.fillNull(rs.getString("hy_hyxxb_hybh"));
		hy_hyxxb_sfzf=cf.fillNull(rs.getString("hy_hyxxb_sfzf"));
		hy_hyxxb_hymm=cf.fillNull(rs.getString("hy_hyxxb_hymm"));
		hy_hyxxb_hyxm=cf.fillNull(rs.getString("hy_hyxxb_hyxm"));
		hy_hyxxb_xb=cf.fillNull(rs.getString("hy_hyxxb_xb"));
		hy_hyxxb_yzbm=cf.fillNull(rs.getString("hy_hyxxb_yzbm"));
		hy_hyxxb_hydz=cf.fillNull(rs.getString("hy_hyxxb_hydz"));
		hy_hyxxb_sfzhm=cf.fillNull(rs.getString("hy_hyxxb_sfzhm"));
		hy_hyxxb_dh=cf.fillNull(rs.getString("hy_hyxxb_dh"));
		hy_hyxxb_sj=cf.fillNull(rs.getString("hy_hyxxb_sj"));
		hy_hyxxb_dzxx=cf.fillNull(rs.getString("hy_hyxxb_dzxx"));
		hy_hyxxb_csrq=cf.fillNull(rs.getDate("hy_hyxxb_csrq"));
		hy_hyxxb_zydm=cf.fillNull(rs.getString("hy_hyxxb_zydm"));
		hy_hyxxb_ysrdm=cf.fillNull(rs.getString("hy_hyxxb_ysrdm"));
		hy_hyxxb_hyzk=cf.fillNull(rs.getString("hy_hyxxb_hyzk"));
		hy_hyxxb_jhjnr=cf.fillNull(rs.getDate("hy_hyxxb_jhjnr"));
		hy_hyxxb_arxm=cf.fillNull(rs.getString("hy_hyxxb_arxm"));
		hy_hyxxb_arsr=cf.fillNull(rs.getDate("hy_hyxxb_arsr"));
		hy_hyxxb_jgyxbm=cf.fillNull(rs.getString("hy_hyxxb_jgyxbm"));
		hy_hyxxb_fwyxbm=cf.fillNull(rs.getString("hy_hyxxb_fwyxbm"));
		hy_hyxxb_fgyxbm=cf.fillNull(rs.getString("hy_hyxxb_fgyxbm"));
		hy_hyxxb_gyyxbm=cf.fillNull(rs.getString("hy_hyxxb_gyyxbm"));
		hy_hyxxb_zdfgbm=cf.fillNull(rs.getString("hy_hyxxb_zdfgbm"));
		hy_hyxxb_psahbm=cf.fillNull(rs.getString("hy_hyxxb_psahbm"));
		hy_hyxxb_bzzz=cf.fillNull(rs.getString("hy_hyxxb_bzzz"));
		hy_hyxxb_sztlpp=cf.fillNull(rs.getString("hy_hyxxb_sztlpp"));
		hy_hyxxb_shop=cf.fillNull(rs.getString("hy_hyxxb_shop"));
		hy_hyxxb_hzppp=cf.fillNull(rs.getString("hy_hyxxb_hzppp"));
		hy_hyxxb_fzpp=cf.fillNull(rs.getString("hy_hyxxb_fzpp"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		hy_hyxxb_rhrq=cf.fillNull(rs.getDate("hy_hyxxb_rhrq"));
		hy_hyxxb_yxrq=cf.fillNull(rs.getDate("hy_hyxxb_yxrq"));
		hy_hyxxb_hykh=cf.fillNull(rs.getString("hy_hyxxb_hykh"));
		hy_hyjbb_hyjb=cf.fillNull(rs.getString("hy_hyjbb_hyjb"));
		hy_hyxxb_fwlx=cf.fillNull(rs.getString("hy_hyxxb_fwlx"));
		hy_hyxxb_gmcs=cf.fillNull(rs.getString("hy_hyxxb_gmcs"));
		hy_hyxxb_xfzje=cf.fillNull(rs.getString("hy_hyxxb_xfzje"));
		hy_hyxxb_jf=cf.fillNull(rs.getString("hy_hyxxb_jf"));
		hy_hyxxb_wdhjf=cf.fillNull(rs.getString("hy_hyxxb_wdhjf"));
		hy_hyxxb_xxlrr=cf.fillNull(rs.getString("hy_hyxxb_xxlrr"));
		hy_hyxxb_bz=cf.fillNull(rs.getString("hy_hyxxb_bz"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>打印销售票据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">打印销售票据（<%=ywxh%>） </div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">会员编号</div>
    </td>
    <td width="33%"> <%=hy_hyxxb_hybh%> </td>
    <td width="15%"> 
      <div align="right">水质分析卡号</div>
    </td>
    <td width="35%"><%=hy_hyxxb_hykh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">会员级别</div>
    </td>
    <td width="33%"><%=hy_hyjbb_hyjb%> </td>
    <td width="15%"> 
      <div align="right">会员姓名</div>
    </td>
    <td width="35%"><%=hy_hyxxb_hyxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">入会日期</div>
    </td>
    <td width="33%"> <%=hy_hyxxb_rhrq%> </td>
    <td width="15%"> 
      <div align="right">有效日期</div>
    </td>
    <td width="35%"> <%=hy_hyxxb_yxrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">消费总金额</div>
    </td>
    <td width="33%"> <%=hy_hyxxb_xfzje%></td>
    <td width="15%"> 
      <div align="right">购买次数</div>
    </td>
    <td width="35%"><%=hy_hyxxb_gmcs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">积分</div>
    </td>
    <td width="33%"><%=hy_hyxxb_jf%> </td>
    <td width="15%"> 
      <div align="right">未兑换积分</div>
    </td>
    <td width="35%"><%=hy_hyxxb_wdhjf%> </td>
  </tr>
</table>
<table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14">
  <tr> 
    <td width="25%"> 
      <div align="center">产品编码</div>
    </td>
    <td width="36%"> 
      <div align="center">品名</div>
    </td>
    <td width="39%"> 
      <div align="center">实销价</div>
    </td>
  </tr>
<%
String sql=null;
String cpbm=null;
String plmc=null;
double sxj=0;
double allsxj=0;
try{
	conn=cf.getConnection();

	sql="select cpbm,plmc,sxj";
	sql+=" from dm_xsjl,xt_plbm";
	sql+=" where dm_xsjl.plbm=xt_plbm.plbm and ywxh='"+ywxh+"'";
//	out.println(sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	while(rs.next()){
		cpbm=rs.getString("cpbm");
		plmc=rs.getString("plmc");
		sxj=rs.getDouble("sxj");
		allsxj+=sxj;
%>
  <tr align="center"> 
    <td ><%=cpbm%></td>
    <td ><%=plmc%></td>
    <td ><%=sxj%></td>
  </tr>
<%
	}
	rs.close();
	ps.close();
}
catch (Exception e){
	out.print("数据库操作失败：" + e);
	out.print("sql=" + sql);
}
finally{
	try{
		if (ps!= null) ps.close();
		if (rs!=null) rs.close();
		if (conn != null) cf.close(conn);
	}
	catch (Exception e){
		out.println("数据库操作失败："+e.getMessage());
	}
}

 %>
  <tr align="center"> 
    <td > 合 计</td>
    <td >&nbsp;</td>
    <td ><%=allsxj%></td>
  </tr>
</table>
</body>
</html>
