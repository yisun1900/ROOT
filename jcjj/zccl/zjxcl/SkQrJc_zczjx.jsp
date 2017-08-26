<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=null;
String khbh=null;
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

double zqzjxze=0;
double zjxze=0;
double zjxcbze=0;
double zjxzkl=0;
String dzyy=null;
double zjxcxhdje=0;
String jssj=null;
String jsr=null;

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

double wdzje=0;
double hkze=0;
double htcxhdje=0;
double zqzjhze=0;
double zjhze=0;
double zjxcxhdjelj=0;

double yfkze=0;
double zcfk=0;

String sxhtsfysh=null;

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

	ls_sql="select jc_zczjx.sxhtsfysh,jc_zczjx.zjxcbze,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.zjxzkl,jc_zczjx.dzyy,jc_zczjx.zjxcxhdje,jc_zczjx.jssj,jc_zczjx.jsr,   zcdlbm,zcxlbm,ppbm,gys,ppmc,jc_zczjx.clgw,ztjjgw,jc_zczjx.xmzy,jjsjs,zjxfssj,jc_zczjx.fgsbh,qddm,jzsjs,DECODE(jc_zczjx.ddlx,'1','系统存在品牌订单','2','系统不存在品牌订单') ddlx,jc_zczjx.ddbh as ddbh,jc_zczjx.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.lxfs as crm_khxx_lxfs,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.dwbh as crm_khxx_dwbh,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,jc_zczjx.zczjxyybm as jc_zczjx_zczjxyybm,jc_zczjx.qrr as jc_zczjx_qrr,jc_zczjx.qrsj as jc_zczjx_qrsj,jc_zczjx.htshsj as jc_zczjx_htshsj,jc_zczjx.sshsj as jc_zczjx_sshsj,jc_zczjx.clzt as jc_zczjx_clzt,jc_zczjx.lrr as jc_zczjx_lrr,jc_zczjx.lrsj as jc_zczjx_lrsj,jc_zczjx.dwbh as jc_zczjx_dwbh,jc_zczjx.bz as jc_zczjx_bz ";
	ls_sql+=" from  crm_khxx,jc_zczjx";
	ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and (jc_zczjx.zjxbh='"+zjxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
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
		ddbh=cf.fillNull(rs.getString("ddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
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
		jc_zczjx_lrsj=cf.fillNull(rs.getDate("jc_zczjx_lrsj"));
		jc_zczjx_dwbh=cf.fillNull(rs.getString("jc_zczjx_dwbh"));
		jc_zczjx_bz=cf.fillNull(rs.getString("jc_zczjx_bz"));
	}
	rs.close();
	ps.close();

	if (sxhtsfysh.equals("N"))
	{
		out.println("<BR><strong><font color=\"#FF0000\">错误，手写合同未审核，不能确认！</font></strong>");
		return;
	}

	if (zjxzkl<10)
	{
//		out.println("提醒！已打折，必须特权确认！");
//		out.println("<BR>折扣率＝"+zjxzkl);
//		return ;
	}

	ls_sql="select wdzje,hkze,htcxhdje,zjxcxhdje,zqzjhze,zjhze";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wdzje=rs.getDouble("wdzje");
		hkze=rs.getDouble("hkze");
		htcxhdje=rs.getDouble("htcxhdje");
		zjxcxhdjelj=rs.getDouble("zjxcxhdje");
		zqzjhze=rs.getDouble("zqzjhze");
		zjhze=rs.getDouble("zjhze");
	}
	rs.close();
	ps.close();


	//家居预付款
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where zjxbh='"+zjxbh+"' and scbz='N' and fklxbm='23'";//21:木门；22:橱柜；23:主材；24：家具
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (zcfk < (zjxze-11))
	{
		out.println("提醒！付款不足或财务未审核，不能确认！");
		out.println("<BR>实付款＝￥"+zcfk);
		out.println("<BR>订单金额＝￥"+cf.round(zjxze,2)+"，应补交货款＝￥"+cf.round(zjxze-zcfk,2));
		return ;
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
<title>增减项－确认</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" >

<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#CCCCCC">订单和增减项合计（增减项编号：<%=zjxbh%>）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="25%" align="right" bgcolor="#CCCCCC"><b>折前－合同额</b></td>
    <td width="25%" bgcolor="#CCCCCC"><%=wdzje%></td>
    <td width="26%" align="right" bgcolor="#CCCCCC"><b>折后－合同额</b></td>
    <td width="24%" bgcolor="#CCCCCC"><%=hkze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCCC"><b>合同＋增减项（折前）</b></td>
    <td bgcolor="#CCCCCC"><%=cf.formatDouble(wdzje+zqzjhze)%></td>
    <td align="right" bgcolor="#CCCCCC"><b>合同＋增减项（折后）</b></td>
    <td bgcolor="#CCCCCC"><%=cf.formatDouble(hkze+zjhze)%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#CCCCCC"><b>计入促销活动金额（合同）</b></td>
    <td bgcolor="#CCCCCC"><%=htcxhdje%></td>
    <td align="right" bgcolor="#CCCCCC"><b>计入促销活动金额（合同＋增减项）</b></td>
    <td bgcolor="#CCCCCC"><%=cf.formatDouble(htcxhdje+zjxcxhdjelj)%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#FFFFFF">增减项－确认（增减项序号：<%=zjxbh%>）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><strong>折前<b>－</b>增减项金额</strong></td>
    <td><%=zqzjxze%></td>
    <td align="right"><strong>折后<b>－</b>增减项金额</strong></td>
    <td><%=zjxze%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>增减项折扣</strong></td>
    <td><%=zjxzkl%></td>
    <td align="right" bgcolor="#FFFFFF"><strong>增减项计入活动金额</strong></td>
    <td><%=zjxcxhdje%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong>打折原因</strong></td>
    <td colspan="3"><%=dzyy%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><strong><font color="#0000FF">可用预付款</font></strong></td>
    <td><%=yfkze%></td>
    <td align="right"><b><font color="#0000FF">订单已付款</font></b></td>
    <td><%=zcfk%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 增减项确认人</td>
    <td><input type="text" name="qrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    <td align="right">增减项确认时间 </td>
    <td><input type="text" name="qrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr>
    <td colspan="4" height="2"><div align="center">
        <input type="hidden" name="zjxbh" value="<%=zjxbh%>" >
        <input type="button"  value="保存" onClick="f_do(editform)">
        <input type="reset"  value="重输" name="reset">
        <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
    </div></td>
  </tr>
  </table>
</form>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      客户编号    </td>
    <td width="29%"> <%=khbh%> </td>
    <td width="21%" align="right"> 
      合同号    </td>
    <td width="29%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      客户姓名    </td>
    <td width="29%"><%=crm_khxx_khxm%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      设计师    </td>
    <td width="29%"><%=crm_khxx_sjs%> </td>
    <td width="21%" align="right"> 
      质检    </td>
    <td width="29%"><%=crm_khxx_zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      签约店面    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh",crm_khxx_dwbh,true);
%> </td>
    <td width="21%" align="right"> 
      施工队    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc",crm_khxx_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="26" colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 订单编号 </td>
    <td><%=ddbh%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 处理状态 </td>
    <td><%
	cf.selectToken(out,"00+录入未完成&01+录入已完成&02+已确认&04+厂家已接收&03+已送货&99+退单",jc_zczjx_clzt,true);
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
    <td width="21%" align="right">子品牌</td>
    <td width="29%"><%=ppbm%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">供应商</td>
    <td width="29%"><%=gys%></td>
    <td width="21%" align="right">品牌</td>
    <td width="29%"><%=ppmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="21%" align="right">驻店家居顾问</td>
    <td width="29%"><%=clgw%></td>
    <td width="21%" align="right">展厅家居顾问</td>
    <td width="29%"><%=ztjjgw%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">项目专员</td>
    <td width="29%"><%=xmzy%></td>
    <td width="21%" align="right">家居设计师</td>
    <td width="29%"><%=jjsjs%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      增减项原因    </td>
    <td width="29%"> <%
	cf.selectItem(out,"select zczjxyybm,zczjxyymc from jdm_zczjxyybm order by zczjxyybm",jc_zczjx_zczjxyybm,true);
%> </td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right"> 
      录入时间    </td>
    <td width="29%"> <%=jc_zczjx_lrsj%> </td>
    <td width="21%" align="right">录入人 </td>
    <td width="29%"><%=jc_zczjx_lrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">订单类型</td>
    <td width="29%"><%=ddlx%></td>
    <td width="21%" align="right">录入部门</td>
    <td width="29%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+jc_zczjx_dwbh+"'",jc_zczjx_dwbh,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="21%" align="right">备注</td>
    <td colspan="3"><%=jc_zczjx_bz%></td>
  </tr>
</table>
<table border="1" width="170%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%" bgcolor="#CCCCCC">系列</td>
	<td  width="7%">主材名称</td>
	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="3%">选择价格</td>
	<td  width="3%">单价</td>
	<td  width="2%">计量单位</td>
	<td  width="3%" >计入活动比率</td>
	<td  width="3%" bgcolor="#CC99FF">增减数量</td>
	<td  width="4%" bgcolor="#CC99FF">增减材料费</td>
	<td  width="4%" bgcolor="#CC99FF">增减远程费</td>
	<td  width="4%" bgcolor="#CC99FF">增减其它费</td>
	<td  width="4%" bgcolor="#CC99FF">增减合计</td>
	<td  width="4%" bgcolor="#CC99FF">增减计入活动金额</td>
	<td  width="4%">铺装位置</td>
	<td  width="4%">颜色</td>
	<td  width="3%">类型</td>
	<td  width="3%">手写标志</td>
	<td  width="5%">手写合同原因</td>
	<td  width="7%">子品牌</td>
	<td  width="3%">主材编码</td>
	<td  width="11%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql ="SELECT zclbbm,zcmc,jc_zcddmx.xinghao,jc_zcddmx.gg,DECODE(xzjg,'0','手写','1','销售价','2','<font color=\"#FF0000\">促销价</font>') xzjg,TO_CHAR(jc_zcddmx.dj) dj,jc_zcddmx.jldwbm,cxhdbl||'%' cxhdbl,jc_zczjxmx.zjsl,jc_zczjxmx.zjje ,jc_zczjxmx.zjycf,jc_zczjxmx.zjqtfy,(jc_zczjxmx.zjje+jc_zczjxmx.zjycf+jc_zczjxmx.zjqtfy),jc_zczjxmx.zjcxhdje,zcpzwzbm,jc_zcddmx.zcysbm,DECODE(jc_zczjxmx.lx,'1','原项目','2','新增') lx,DECODE(jc_zczjxmx.sxbz,'1','非手写','2','手写') sxbz,jc_zcddmx.sxhtyy,jc_zcddmx.dwbh,jc_zcddmx.zcbm,jc_zczjxmx.bz ";
	ls_sql+=" FROM jc_zczjxmx,jc_zcddmx";
    ls_sql+=" where jc_zczjxmx.xh=jc_zcddmx.xh and jc_zczjxmx.zjxbh='"+zjxbh+"'";
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.qrr)=="") {
		alert("请选择[增减项确认人]！");
		FormName.qrr.focus();
		return false;
	}
	if(	javaTrim(FormName.qrsj)=="") {
		alert("请选择[增减项确认时间 ]！");
		FormName.qrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qrsj, "增减项确认时间 "))) {
		return false;
	}


	FormName.action="SaveSkQrJc_zczjx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
