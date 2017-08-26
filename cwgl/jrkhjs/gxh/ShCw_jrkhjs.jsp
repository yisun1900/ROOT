<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>个性化客户结算－审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE3 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

double htsjf=0;
double sssjf=0;
double wdzgce=0;
double qye=0;
double zqljzjx=0;
double zhljzjx=0;
double zqhj=0;
double zhhj=0;
double jsze=0;
double yjzxk=0;
double dj=0;
double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double djfxje=0;
double dyq=0;
double yhze=0;
double shfqje=0;
double yjzck=0;
double zcddjezq=0;
double zcddyh=0;
double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double pck=0;
double khbjk=0;
String lrr=null;
String lrsj=null;
String bz=null;
String clzt=null;

String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String fwmj=null;
String hxmc=null;
String bjjbmc=null;
String hth=null;
String sjs=null;
String hyh=null;
String qyrq=null;
String kgrq=null;

double zqgczjf=0;
double zjxje=0;
double zqqtsf=0;
double zqqtsfzjx=0;
double zqwjrqyexm =0;
double zqwjrzjx=0;
String qtsfsm=null;
String wjrqyexmsm=null;

double glfbfb=0;
double zqguanlif=0;
double zqzjxguanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double zqzjxsuijin=0;
String cxhdbm=null;
double zkl=0;
String fxgck=null;
double fxdj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,lxfs,fwdz,fwmj,hxmc,bjjbmc,hth,sjs,hyh,qyrq,kgrq";
	ls_sql+=" ,zqgczjf,zjxje,zqqtsf,zqqtsfzjx,zqwjrqyexm,zqwjrzjx,qtsfsm,wjrqyexmsm";
	ls_sql+=" ,glfbfb,zqguanlif,zqzjxguanlif,suijinbfb,zqsuijin,zqzjxsuijin,cxhdbm";
	
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_hxbm,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hyh=cf.fillNull(rs.getString("hyh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));

		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		zqqtsf=rs.getDouble("zqqtsf");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));

		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		suijinbfb=rs.getDouble("suijinbfb");
		zqsuijin=rs.getDouble("zqsuijin");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();

	String zklx="";
	double zdzk=0;
	double gcfqdzk=0;
	ls_sql="SELECT zklx,zdzk,gcfqdzk";
	ls_sql+=" FROM crm_khzk  ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
		zdzk=rs.getDouble("zdzk");
		gcfqdzk=rs.getDouble("gcfqdzk");
	}
	rs.close();
	ps.close();
	
	if (zklx.equals("1"))//1：整单打折；2：单项打折；3：部分费用打折
	{
		zkl=zdzk;
	}
	else {
		zkl=gcfqdzk;
	}
	//订金折现
	ls_sql="SELECT fxgck";
	ls_sql+=" FROM jc_cxhd  ";
	ls_sql+=" where cxhdmc='"+cxhdbm+"' and fgsbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxgck=cf.fillNull(rs.getString("fxgck"));//多倍返现工程款
	}
	rs.close();
	ps.close();

	double zdfxdj=0;//最大返现订金
	ls_sql="select jc_cxhddjfxbz.zdfxdj";
	ls_sql+=" from jc_cxhd,jc_cxhddjfxbz";
	ls_sql+=" where jc_cxhd.cxhdbm=jc_cxhddjfxbz.cxhdbm and jc_cxhd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_cxhd.hdlx in('1','2') and jc_cxhd.cxhdmc='"+cxhdbm+"'";
	ls_sql+=" and qd<"+wdzgce+" and "+wdzgce+"<=zd ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdfxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	//客户交返现订金
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl ";
	ls_sql+=" where cw_khfkjl.fkje!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  cw_khfkjl.fklxbm in('52')";//51：促销活动订金；52：量房订金；53：设计费
	ls_sql+=" and khbh ='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fxdj=rs.getDouble(1);
	}
	rs.close();
	ps.close();


	if (fxdj>zdfxdj)
	{
		fxdj=zdfxdj;
	}

	ls_sql="select clzt,htsjf,sssjf,wdzgce,qye,zqljzjx,zhljzjx,zqhj,zhhj,jsze,yjzxk,dj,yjwk,yhje,fqbl,fqje,djfxje,dyq,yhze,shfqje,yjzck,zcddjezq,zcddyh,dgzcjezq,dgzcyh,zcjsje,pck,khbjk,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_jrkhjs";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		htsjf=rs.getDouble("htsjf");
		sssjf=rs.getDouble("sssjf");
		wdzgce=rs.getDouble("wdzgce");

		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");

		zhljzjx=rs.getDouble("zhljzjx");
		zqhj=rs.getDouble("zqhj");
		zhhj=rs.getDouble("zhhj");
		jsze=rs.getDouble("jsze");
		yjzxk=rs.getDouble("yjzxk");
		dj=rs.getDouble("dj");
		yjwk=rs.getDouble("yjwk");
		yhje=rs.getDouble("yhje");
		fqbl=rs.getDouble("fqbl");
		fqje=rs.getDouble("fqje");
		djfxje=rs.getDouble("djfxje");
		dyq=rs.getDouble("dyq");
		yhze=rs.getDouble("yhze");
		shfqje=rs.getDouble("shfqje");
		yjzck=rs.getDouble("yjzck");
		zcddjezq=rs.getDouble("zcddjezq");
		zcddyh=rs.getDouble("zcddyh");
		dgzcjezq=rs.getDouble("dgzcjezq");
		dgzcyh=rs.getDouble("dgzcyh");
		zcjsje=rs.getDouble("zcjsje");
		pck=rs.getDouble("pck");
		khbjk=rs.getDouble("khbjk");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
	
	if (clzt.equals("2"))//1：未审批；2：审批同意；3：审批不同意 
	{
		out.println("错误！客户已审核");
		return;
	}

}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveShCw_jrkhjs.jsp" name="insertform" >
<div align="center">个性化客户结算－审核(<font color="#0000FF">客户编号:<%=khbh%></font>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">客户姓名</font></td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">联系方式</font></td>
    <td width="32%"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">面积</font></td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">户型</font></td>
    <td><%=hxmc%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">报价级别</font></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同号</font></td>
    <td><%=hth%></td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">会员卡号</font></td>
    <td><%=hyh%></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">开工日期</font></td>
    <td><%=kgrq%></td>
  </tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">设计费情况</span></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同设计费</font></td> 
  <td width="32%"><%=htsjf%></td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">实收设计费</font></td> 
  <td width="32%"><%=sssjf%></td>
</tr>
</table>
  
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td colspan="4" align="center"><span class="STYLE4">工程费情况</span></td>
  </tr>
<tr align="center" bgcolor="#FFFFFF">
  <td>&nbsp;</td>
  <td><strong>合同</strong></td>
  <td><strong>增减项</strong></td>
  <td><strong>合计</strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>工程直接费</strong></td>
  <td width="32%" align="center"><%=zqgczjf%></td>
  <td align="center" width="25%"><%=zjxje%></td>
  <td width="25%" align="center"><%=cf.formatDouble(zqgczjf+zjxje)%></td>
</tr>
<%
if (zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx!=0)
{
	%>
	<tr bgcolor="#FFFFFF">
	  <td align="right"><strong><%=qtsfsm%>、<%=wjrqyexmsm%></strong></td>
	  <td align="center"><%=cf.round(zqqtsf+zqwjrqyexm,2)%></td>
	  <td align="center"><%=cf.round(zqqtsfzjx+zqwjrzjx,2)%></td>
	  <td align="center"><%=cf.round(zqqtsf+zqqtsfzjx+zqwjrqyexm+zqwjrzjx,2)%></td>
	</tr>
	<%
}
%>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>管理费(<%=glfbfb%>%)</strong></td>
  <td width="32%" align="center"><%=zqguanlif%></td>
  <td align="center" width="25%"><%=zqzjxguanlif%></td>
  <td width="25%" align="center"><%=cf.formatDouble(zqguanlif+zqzjxguanlif)%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>税金(<%=suijinbfb%>%)</strong></td>
  <td align="center"><%=zqsuijin%></td>
  <td align="center"><%=zqzjxsuijin%></td>
  <td align="center"><%=cf.formatDouble(zqsuijin+zqzjxsuijin)%></td>
</tr>




<tr bgcolor="#FFFFFF">
  <td align="right"><strong>小 计</strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%></strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%></strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%></strong></td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">客户已交装修款</font></td>
  <td width="32%"><%=yjzxk%></td><td colspan="2" bgcolor="#FFFFFF">其中定金转家装款:<%=dj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">应交装修尾款</font></td>
  <td><%=yjwk%></td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">优惠情况</span></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">促销活动内容</font></td>
  <td colspan="3"><%=cxhdbm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">返券优惠</font></td>
  <td><%=fqje%>  </td>
  <td colspan="2">返券比例:<%=fqbl%>％ </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">折扣优惠</font></td>
  <td><%=yhje%>  </td>
  <td colspan="2">折扣：<%=zkl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">订金折现优惠</font></td>
  <td><%=djfxje%>  </td>
  <td colspan="2"><%=fxgck%>倍订金折现，客户交订金:<%=fxdj%>，订金折现优惠=<%=fxdj%>*(<%=fxgck%>-1)倍*<%=zkl%>折</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">抵用券</span></td>
  <td><%=dyq%></td><td colspan="2">    人工录入</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">收回减项返券金额</span></td>
  <td><%=shfqje%>  </td><td colspan="2">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">优惠合计金额</font></td>
  <td><%=yhze%> </td><td colspan="2">优惠金额＝折扣优惠+订金折现优惠＋抵用券-收回减项返券金额</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td colspan="4" align="center" bgcolor="#FFFFCC"><span class="STYLE4">主材情况</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">已交主材款</font></td>
  <td><%=yjzck%></td><td width="18%" align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000FF">机电代销</font></td>
  <td><font color="#0000FF"><%=zcddjezq%>
    </font></td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE3">代购主材</span></td>
  <td><%=dgzcjezq%></td><td align="right" bgcolor="#FFFFFF"><span class="STYLE3">代购主材优惠</span></td>
  <td bgcolor="#FFFFFF"><font color="#0000FF"><%=dgzcyh%>
  </font></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF" class="STYLE3">主材结算额</td>
  <td><%=zcjsje%>  </td>
  <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
  <td bgcolor="#FFFFFF">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">客户赔偿款</span></td>
  <td><%=pck%></td><td align="right"><span class="STYLE3">客户补交款</span></td>
  <td><%=khbjk%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">结算人</font></td>
  <td><%=lrr%></td>
  <td align="right"><font color="#0000CC">结算时间</font></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#0000CC">备注</font></td>
  <td colspan="3"><%=bz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>审批结论</td>
  <td><%
	cf.radioToken(out, "clzt","2+同意&3+不同意","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">审批人</font></td>
  <td><input type="text" name="spr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">审批时间</font></td>
  <td><input type="text" name="spsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审批意见</td>
  <td colspan="3"><textarea name="spyj" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>">
	  <input type="hidden" name="wdzgce" value="<%=wdzgce%>">
	  <input type="hidden" name="qye" value="<%=qye%>">
	  <input type="hidden" name="zqljzjx" value="<%=zqljzjx%>">
	  <input type="hidden" name="zhljzjx" value="<%=zhljzjx%>">
	  <input type="hidden" name="zqhj" value="<%=zqhj%>">
	  <input type="hidden" name="zhhj" value="<%=zhhj%>">

	  <input type="hidden" name="jsze" value="<%=jsze%>">
      <input type="hidden" name="dj" value="<%=dj%>"  >

      <input type="hidden" name="fqje" value="<%=fqje%>">
	  <input type="hidden" name="fqbl" value="<%=fqbl%>">

	  <input type="hidden" name="zcddyh" value="0">

	  <input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.clzt)) {
		alert("请选择[审批结论]！");
		FormName.clzt[0].focus();
		return false;
	}
	if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.spyj)=="") {
			alert("请输入[审批意见]！");
			FormName.spyj.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.spr)=="") {
		alert("请输入[审批人]！");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("请输入[审批时间]！");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
