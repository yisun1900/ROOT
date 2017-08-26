<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String jc_zczjx_ddbh=null;
String jc_zczjx_zjxbh=null;
String jc_zczjx_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_dwbh=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String jc_zczjx_zczjxyybm=null;
String jc_zczjx_qrr=null;
String jc_zczjx_qrsj=null;
String jc_zczjx_htshsj=null;
String jc_zczjx_sshsj=null;
String jc_zczjx_clzt=null;
String jc_zczjx_lrr=null;
String jc_zczjx_lrsj=null;
String jc_zczjx_dwbh=null;
String jc_zczjx_bz=null;


String sxhtsfysh=null;
String sxhtshr=null;
String sxhtshsj=null;
String sfjs=null;
String jissj=null;
String jisr=null;
String wjsj=null;


double zqzjxze=0;
double zjxze=0;
double zjxcbze=0;
double zjxzkl=0;
String dzyy=null;
double zjxcxhdje=0;
String jssj=null;
String jsr=null;

double zqzjxclf=0;
double zhzjxclf=0;
double zjxycf=0;
double zjxqtf=0;

String zcfgsbh="";
String qddm="";
String jzsjs="";
String zjxfssj="";

String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String gys=null;
String ppmc=null;
String clgw=null;
String ztjjgw=null;
String xmzy=null;
String jjsjs=null;
String khjl=null;
String sfjrht=null;

double zsje=0;
double zjxyjjrje=0;
String yjjzsj=null;
double sskje=0;
double shsskje=0;


String ddlx=null;
String zjxbh=null;
zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select DECODE(sfjrht,'Y','计入','N','不计入') sfjrht,jc_zczjx.zsje,jc_zczjx.zjxcbze,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.zjxzkl,jc_zczjx.dzyy,jc_zczjx.zjxcxhdje,jc_zczjx.jssj,jc_zczjx.jsr,   zcdlbm,zcxlbm,ppbm,gys,ppmc,jc_zczjx.clgw,ztjjgw,jc_zczjx.xmzy,jjsjs,zjxfssj,jc_zczjx.fgsbh,qddm,jzsjs,DECODE(jc_zczjx.ddlx,'1','系统存在品牌订单','2','系统不存在品牌订单') ddlx,jc_zczjx.ddbh as jc_zczjx_ddbh,jc_zczjx.zjxbh as jc_zczjx_zjxbh,jc_zczjx.khbh as jc_zczjx_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,jc_zczjx.zczjxyybm as jc_zczjx_zczjxyybm,jc_zczjx.qrr as jc_zczjx_qrr,jc_zczjx.qrsj as jc_zczjx_qrsj,jc_zczjx.htshsj as jc_zczjx_htshsj,jc_zczjx.sshsj as jc_zczjx_sshsj,jc_zczjx.clzt as jc_zczjx_clzt,jc_zczjx.lrr as jc_zczjx_lrr,jc_zczjx.lrsj as jc_zczjx_lrsj,jc_zczjx.dwbh as jc_zczjx_dwbh,jc_zczjx.bz as jc_zczjx_bz ";
	ls_sql+=" ,jc_zczjx.zqzjxclf,jc_zczjx.zhzjxclf,jc_zczjx.zjxycf,jc_zczjx.zjxqtf,jc_zczjx.khjl";
	ls_sql+=" ,jc_zczjx.zjxyjjrje,jc_zczjx.yjjzsj,jc_zczjx.sskje,jc_zczjx.shsskje,DECODE(jc_zczjx.sxhtsfysh,'M','非手写合同','Y','已审核','N','未审核') sxhtsfysh,jc_zczjx.sxhtshr,jc_zczjx.sxhtshsj,DECODE(jc_zczjx.sfjs,'N','未结算','C','已选择结算','Y','已结算','M','结算已审核') sfjs,jc_zczjx.jissj,jc_zczjx.jisr,jc_zczjx.wjsj";
	ls_sql+=" from  crm_khxx,jc_zczjx";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and (jc_zczjx.zjxbh='"+zjxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxyjjrje=rs.getDouble("zjxyjjrje");
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		sskje=rs.getDouble("sskje");
		shsskje=rs.getDouble("shsskje");
		sfjrht=cf.fillNull(rs.getString("sfjrht"));
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sxhtshr=cf.fillNull(rs.getString("sxhtshr"));
		sxhtshsj=cf.fillNull(rs.getString("sxhtshsj"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		jissj=cf.fillNull(rs.getString("jissj"));
		jisr=cf.fillNull(rs.getString("jisr"));
		wjsj=cf.fillNull(rs.getString("wjsj"));
		
		zsje=rs.getDouble("zsje");
		khjl=cf.fillNull(rs.getString("khjl"));
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");
		zjxycf=rs.getDouble("zjxycf");
		zjxqtf=rs.getDouble("zjxqtf");

		zjxcbze=rs.getDouble("zjxcbze");
		zqzjxze=rs.getDouble("zqzjxze");
		zjxze=rs.getDouble("zjxze");
		zjxzkl=rs.getDouble("zjxzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		zjxcxhdje=rs.getDouble("zjxcxhdje");
		jssj=cf.fillNull(rs.getString("jssj"));
		jsr=cf.fillNull(rs.getString("jsr"));

		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		jjsjs=cf.fillNull(rs.getString("jjsjs"));

		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		zcfgsbh=cf.fillNull(rs.getString("fgsbh"));
		qddm=cf.fillNull(rs.getString("qddm"));
		jzsjs=cf.fillNull(rs.getString("jzsjs"));
		ddlx=cf.fillNull(rs.getString("ddlx"));
		jc_zczjx_ddbh=cf.fillNull(rs.getString("jc_zczjx_ddbh"));
		jc_zczjx_zjxbh=cf.fillNull(rs.getString("jc_zczjx_zjxbh"));
		jc_zczjx_khbh=cf.fillNull(rs.getString("jc_zczjx_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_lxfs=cf.fillNull(rs.getString("crm_khxx_lxfs"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		jc_zczjx_zczjxyybm=cf.fillNull(rs.getString("jc_zczjx_zczjxyybm"));
		jc_zczjx_qrr=cf.fillNull(rs.getString("jc_zczjx_qrr"));
		jc_zczjx_qrsj=cf.fillNull(rs.getString("jc_zczjx_qrsj"));
		jc_zczjx_htshsj=cf.fillNull(rs.getDate("jc_zczjx_htshsj"));
		jc_zczjx_sshsj=cf.fillNull(rs.getDate("jc_zczjx_sshsj"));
		jc_zczjx_clzt=cf.fillNull(rs.getString("jc_zczjx_clzt"));
		jc_zczjx_lrr=cf.fillNull(rs.getString("jc_zczjx_lrr"));
		jc_zczjx_lrsj=cf.fillNull(rs.getString("jc_zczjx_lrsj"));
		jc_zczjx_dwbh=cf.fillNull(rs.getString("jc_zczjx_dwbh"));
		jc_zczjx_bz=cf.fillNull(rs.getString("jc_zczjx_bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
if (yhjs.equals("G0"))
{
	crm_khxx_sjs="&nbsp;";
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
.STYLE2 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">
<div align="center">主材增减项 
</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      客户编号    </td>
    <td width="32%"> <%=jc_zczjx_khbh%> </td>
    <td width="18%" align="right"> 
      合同号    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      客户姓名    </td>
    <td width="32%"><%=crm_khxx_khxm%> （ 
      <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=jc_zczjx_khbh%>')" name="button4" >
）</td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      设计师    </td>
    <td width="32%"><%=crm_khxx_sjs%> </td>
    <td width="18%" align="right"> 
      质检    </td>
    <td width="32%"><%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      签约店面    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
    <td width="18%" align="right"> 
      施工队    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="18%" align="right" bgcolor="#CCFFCC">订单所属分公司</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zcfgsbh+"'",zcfgsbh,true);
%></td>
    <td width="18%" align="right">订单所属店面</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+qddm+"'",qddm,true);
%></td>
  </tr>

  <tr bgcolor="#FFFFFF"> 
    <td width="18%" bgcolor="#CCFFCC" align="right">订单所属设计师</td>
    <td width="32%" bgcolor="#CCFFCC"><%=jzsjs%></td>
    <td width="18%" align="right" bgcolor="#CCFFCC">客户经理</td>
    <td width="32%" bgcolor="#CCFFCC"><%=jzsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 订单编号 </td>
    <td><%=jc_zczjx_ddbh%> </td>
    <td align="right"> 增减项序号 </td>
    <td><%=jc_zczjx_zjxbh%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>是否计入家装合同</strong></td>
    <td><strong><%=sfjrht%></strong></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 处理状态 </td>
    <td><%
	cf.selectToken(out,"00+录入未完成&01+录入已完成&02+已确认&04+厂家已接收&03+已送货&05+部分送货&30+单项完结&99+退单",jc_zczjx_clzt,true);
%>    </td>
    <td align="right"> 增减项发生时间</td>
    <td><%=zjxfssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">主材大类</td>
    <td><%=zcdlbm%></td>
    <td align="right">主材小类</td>
    <td><%=zcxlbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">子品牌</td>
    <td width="32%"><%=ppbm%></td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">供应商</td>
    <td width="32%"><%=gys%></td>
    <td width="18%" align="right">品牌</td>
    <td width="32%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">驻店家居顾问</td>
    <td width="32%"><%=clgw%></td>
    <td width="18%" align="right">展厅家居顾问</td>
    <td width="32%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">项目专员</td>
    <td width="32%"><%=xmzy%></td>
    <td width="18%" align="right">家居设计师</td>
    <td width="32%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">手写合同是否已审核</td>
    <td><%=sxhtsfysh%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">手写合同审核人</td>
    <td><%=sxhtshr%></td>
    <td align="right">手写合同审核时间</td>
    <td><%=sxhtshsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">是否已结算</td>
    <td><%=sfjs%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">结算人</td>
    <td><%=jisr%></td>
    <td align="right">结算时间</td>
    <td><%=jissj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      增减项原因    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm",jc_zczjx_zczjxyybm,true);
%> </td>
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><span class="STYLE1">增减项折扣</span></td>
    <td><%=zjxzkl%></td>
    <td align="right" class="STYLE1">赠送金额</td>
    <td><%=zsje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">打折原因</span></td>
    <td colspan="3" bgcolor="#FFFFCC"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><strong>折前－增减项材料费</strong></td>
    <td><%=zqzjxclf%></td>
    <td align="right"><strong>折后－增减项材料费</strong></td>
    <td><%=zhzjxclf%></td>
  </tr>
  
  <tr bgcolor="#FFFFCC">
    <td align="right" bgcolor="#FFFFCC"><strong>增减项远程费</strong></td>
    <td><%=zjxycf%></td>
    <td align="right"><strong>增减项其它费</strong></td>
    <td><%=zjxqtf%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><strong>折前增减项总额</strong></td>
    <td bgcolor="#FFFFCC"><%=zqzjxze%></td>
    <td align="right" bgcolor="#FFFFCC"><strong>折后增减项总额</strong></td>
    <td bgcolor="#FFFFCC"><%=zjxze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><strong>增减项计入活动金额</strong></td>
    <td bgcolor="#FFFFCC"><%=zjxcxhdje%></td>
    <td align="right" bgcolor="#FFFFCC"><strong>增减项业绩记入金额</strong></td>
    <td bgcolor="#FFFFCC"><%=zjxyjjrje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">实收款金额</span></td>
    <td bgcolor="#FFFFCC"><%=sskje%></td>
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">财务审核实收款金额</span></td>
    <td bgcolor="#FFFFCC"><%=shsskje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFCC"><span class="STYLE2">记入业绩时间</span></td>
    <td bgcolor="#FFFFCC"><%=yjjzsj%></td>
    <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
    <td bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      确认人    </td>
    <td width="32%"> <%=jc_zczjx_qrr%> </td>
    <td width="18%" align="right"> 
      确认时间    </td>
    <td width="32%"> <%=jc_zczjx_qrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">厂家接受人</td>
    <td><%=jsr%></td>
    <td align="right">厂家接受时间</td>
    <td><%=jssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      合同送货时间    </td>
    <td width="32%"> <%=jc_zczjx_htshsj%> </td>
    <td width="18%" align="right"> 
      实送货时间    </td>
    <td width="32%"> <%=jc_zczjx_sshsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=jc_zczjx_lrsj%> </td>
    <td width="18%" align="right">录入人 </td>
    <td width="32%"><%=jc_zczjx_lrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">订单类型</td>
    <td width="32%"><%=ddlx%></td>
    <td width="18%" align="right">录入部门</td>
    <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_zczjx_dwbh+"'",jc_zczjx_dwbh,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">备注</td>
    <td><%=jc_zczjx_bz%></td>
    <td><div align="right">完结时间</div></td>
    <td><%=wjsj%></td>
  </tr>
</table>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">类型</td>
	<td  width="4%">主材编码</td>
	<td  width="3%">手写标志</td>
	<td  width="2%">是否赠品</td>
	<td  width="5%" bgcolor="#CCCCCC">系列</td>
	<td  width="6%">主材名称</td>
	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="3%">选择价格</td>
	<td  width="3%">单价</td>
	<td  width="2%">计量单位</td>
	<td  width="3%" >计入活动比率</td>
	<td  width="3%" >业绩记入比例</td>
	<td  width="3%" bgcolor="#CC99FF">赠送单价</td>
	<td  width="3%" bgcolor="#CC99FF">赠送金额</td>
	<td  width="3%" bgcolor="#CC99FF">增减数量</td>
	<td  width="4%" bgcolor="#CC99FF">折前增减材料费</td>
	<td  width="4%" bgcolor="#CC99FF">折后增减材料费</td>
	<td  width="4%" bgcolor="#CC99FF">增减远程费</td>
	<td  width="4%" bgcolor="#CC99FF">增减其它费</td>
	<td  width="4%" bgcolor="#CC99FF">增减合计</td>
	<td  width="4%" bgcolor="#CC99FF">增减计入活动金额</td>
	<td  width="4%" bgcolor="#CC99FF">增减业绩记入金额</td>
	<td  width="4%">铺装位置</td>
	<td  width="3%">颜色</td>
	<td  width="4%">手写合同原因</td>
	<td  width="13%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql ="SELECT DECODE(jc_zczjxmx.lx,'1','原项目','2','新增') lx,jc_zcddmx.zcbm,DECODE(jc_zczjxmx.sxbz,'1','非手写','2','手写') sxbz,DECODE(jc_zcddmx.sfzp,'Y','赠品','N','否') sfzp,zclbbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,DECODE(xzjg,'0','手写','1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jc_zcddmx.jldwbm,cxhdbl||'%' cxhdbl,yjjrbl||'%' yjjrbl,TO_CHAR(jc_zcddmx.zsdj),round(jc_zcddmx.zsdj*jc_zczjxmx.zjsl,2),jc_zczjxmx.zjsl,jc_zczjxmx.zqzjje,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,(jc_zczjxmx.zjje+jc_zczjxmx.zjycf+jc_zczjxmx.zjqtfy),jc_zczjxmx.zjcxhdje,jc_zczjxmx.zjyjjrje,zcpzwzbm,jc_zcddmx.zcysbm,jc_zcddmx.sxhtyy,jc_zczjxmx.bz ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh(+) and jc_zczjxmx.zjxbh='"+zjxbh+"'";
    ls_sql+=" order by jc_zczjxmx.lx,jc_zcddmx.zcbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
</body>
</html>
