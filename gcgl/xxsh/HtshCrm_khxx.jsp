<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
double qye=0;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;
String htshbz=null;
String zjxm =null;
String qyrq =null;
String jyjdrq =null;
double wdzgce =0;
double zkl=0;
String sfyyh=null;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String yhyy=null;
double suijin=0;
double suijinbfb=0;
double zjxje=0;
double glftd=0;
double guanlif=0;


String xxshr=null;
String xxshsj=null;
String htshdf=null;
String xxshyj=null;
String sfyrz=null;
String rzsc=null;
String zklx=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select cxhdbmzh,cxhdbmxq,rzsc,sfyrz,glftd,suijin,suijinbfb,zjxje,khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd,xxshr,xxshsj,xxshyj,htshbz,zjxm,qyrq,jyjdrq,wdzgce,zkl,sfyyh,cxhdbm,yhyy,guanlif";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		glftd=rs.getDouble("glftd");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxje=rs.getDouble("zjxje");
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		xxshr=cf.fillNull(rs.getString("xxshr"));
		xxshsj=cf.fillNull(rs.getDate("xxshsj"));
		xxshyj=cf.fillNull(rs.getString("xxshyj"));
		htshbz=cf.fillNull(rs.getString("htshbz"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		guanlif=rs.getDouble("guanlif");

	}
	rs.close();

	if (xxshr.equals(""))
	{
		xxshr=yhmc;
	}
	if (xxshsj.equals(""))
	{
		xxshsj=cf.today();
	}

	ls_sql="select zklx";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
%>

<html>
<head>
<title>信息审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">信息审核 </div>
  
<form method="post" action="" name="selectform" target='_blank'>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="19%"> 
        <div align="right">客户编号</div>
      </td>
      <td width="31%"><%=khbh%> </td>
      <td width="17%"> 
        <div align="right">合同号</div>
      </td>
      <td width="33%"><%=hth%> </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">客户姓名</td>
      <td width="31%" bgcolor="#CCCCFF"> 
        <input type="text" name="khxm" size="20" maxlength="50" value="<%=khxm%>">
      </td>
      <td width="17%" bgcolor="#CCCCFF" align="right">联系方式</td>
      <td width="33%" bgcolor="#CCCCFF"> 
        <input type="text" name="lxfs" size="20" maxlength="50" value="<%=lxfs%>">
      </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">房屋地址</td>
      <td colspan="3" bgcolor="#CCCCFF"> 
        <input type="text" name="fwdz" size="71" maxlength="50" value="<%=fwdz%>">
      </td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
      <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
      <td width="17%" bgcolor="#CCCCFF" align="right">装修设计师</td>
      <td width="33%" bgcolor="#CCCCFF"><%=sjs%></td>
    </tr>
    <tr> 
      <td width="19%" bgcolor="#CCCCFF"> 
        <div align="right">工程担当</div>
      </td>
      <td width="31%" bgcolor="#CCCCFF"><%=zjxm%> </td>
      <td width="17%" bgcolor="#CCCCFF"> 
        <div align="right">施工队</div>
      </td>
      <td width="33%" bgcolor="#CCCCFF"><%=sgd%> </td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">签约日期</td>
      <td width="31%" bgcolor="#CCCCFF"><%=qyrq%></td>
      <td width="17%" align="right" bgcolor="#CCCCFF">建议交底日期</td>
      <td width="33%" bgcolor="#CCCCFF"><%=jyjdrq%></td>
    </tr>
    <tr> 
      <td width="19%" align="right" bgcolor="#CCCCFF">合同开工日期</td>
      <td width="31%" bgcolor="#CCCCFF"><%=kgrq%></td>
      <td width="17%" align="right" bgcolor="#CCCCFF">合同竣工日期</td>
      <td width="33%" bgcolor="#CCCCFF"><%=jgrq%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">工程原报价</td>
      <td width="31%"><%=wdzgce%></td>
      <td width="17%" bgcolor="#E8E8FF" align="right">实际折扣率</td>
      <td width="33%"><%=zkl%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">工程签约额</td>
      <td width="31%"><%=qye%></td>
      <td width="17%" bgcolor="#E8E8FF" align="right"></td>
      <td width="33%"></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">是否有优惠</td>
      <td width="31%"><%
	cf.radioToken(out, "Y+是&N+否",sfyyh,true);
%></td>
      <td width="17%" bgcolor="#E8E8FF" align="right">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">优惠内容</td>
      <td colspan="3"><%=yhyy%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">参加公司促销活动</td>
      <td colspan="3"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">参加小区促销活动</td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">参加展会促销活动</td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">是否已认证</td>
      <td width="31%"><%
	cf.radioToken(out, "Y+是&N+否",sfyrz,true);
%></td>
      <td width="17%" bgcolor="#E8E8FF" align="right">认证市场</td>
      <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc||'（'||dwdh||'）' from sq_dwxx where dwbh='"+rzsc+"'",rzsc,true);
%></td>
    </tr>
  </table>


<P>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="20%" align="right">折扣类型</td>
      <td width="30%"><%
	cf.selectToken(out,"1+全额折扣&2+单项折扣",zklx,true);
%></td>
      <td width="21%" align="right">折扣率</td>
      <td width="29%"><%=zkl%></td>
    </tr>
  </table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td colspan="12"><b>电子报价综合取费（<font color="#FF0000">请注意<不记入签约额>项目，需独立收费</font>）</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="18%">收费项目</td>
    <td  width="14%">收费类型</td>
    <td  width="7%">记入签约额</td>
    <td  width="7%">记入税金</td>
    <td  width="7%">记入管理费</td>
    <td  width="8%">允许最低折扣</td>
    <td  width="8%">收费百分比</td>
    <td  width="12%">折前收费金额</td>
    <td  width="8%">实际折扣</td>
    <td  width="11%">折后收费金额</td>
  </tr>
<%
	String sfxmmc=null;
	String sflx=null;
	String sfjrqye=null;
	String jrsjbz=null;
	String jrglfbz=null;
	String sfkdz=null;
	double zdzk=0;
	double sfbfb=0;
	double zqsfje=0;
	double dxzkl=0;
	double sfje=0;
	ls_sql="SELECT sfxmmc,DECODE(bj_sfxmmx.sflx,'1','直接费百分比','2','固定金额(可改)','3','税金(百分比)','4','固定金额(不可改)','5','管理费(百分比)') sflx";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye";
	ls_sql+=" ,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfkdz,'N','不可打折','Y','可打折') sfkdz,zdzk,bj_sfxmmx.sfbfb";
	ls_sql+=" ,bj_sfxmmx.zqsfje,bj_sfxmmx.dxzkl,bj_sfxmmx.sfje";
	ls_sql+=" FROM bj_sfxmmx  ";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_sfxmmx.sfxmbm";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		sfxmmc=rs.getString("sfxmmc");
		sflx=rs.getString("sflx");
		sfjrqye=rs.getString("sfjrqye");
		jrsjbz=rs.getString("jrsjbz");
		jrglfbz=rs.getString("jrglfbz");
		sfkdz=rs.getString("sfkdz");
		zdzk=rs.getDouble("zdzk");
		sfbfb=rs.getDouble("sfbfb");
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		sfje=rs.getDouble("sfje");

		%>
		<tr bgcolor="#FFFFFF"  align="center">
		<td><%=sfxmmc%></td>
		<td><%=sflx%></td>
		<td><%=sfjrqye%></td>
		<td><%=jrsjbz%></td>
		<td><%=jrglfbz%></td>
		<td><%=zdzk%></td>
		<td><%=sfbfb%>%</td>
		<td><%=zqsfje%></td>
		<td><%=dxzkl%></td>
		<td><%=sfje%></td>
		</tr>
		<%
	}
	rs.close();
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
  </table>

<P>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%"><b>税金</b></td>
      <td width="31%"><%=cf.formatDouble(suijin)%>（<%=suijinbfb%>％）</td>
      <td width="17%" bgcolor="#E8E8FF" align="right">工程管理费</td>
      <td width="33%"><%=guanlif%></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">审核时间</td>
      <td width="31%"> 
        <input type="text" name="xxshsj" size="20" maxlength="10" value="<%=xxshsj%>" readonly>
      </td>
      <td width="17%" bgcolor="#E8E8FF" align="right">审核人</td>
      <td width="33%"> 
        <input type="text" name="xxshr" size="20" maxlength="20" value="<%=xxshr%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">信息审核意见</td>
      <td colspan="3"> 
        <textarea name="xxshyj" rows="3" cols="71"><%=xxshyj%></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center"> 
          <input type="button" value="录入不合格项目" onClick="f_lr(selectform)" name="lr" >
          <input type="button"  value="审核完成" onClick="f_do(selectform)" name="wc" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
        </div>
      </td>
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
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("请输入[房屋地址]！");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.xxshsj)=="") {
		alert("请输入[合同审核时间]！");
		FormName.xxshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xxshsj, "合同审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xxshr)=="") {
		alert("请输入[合同审核人]！");
		FormName.xxshr.focus();
		return false;
	}

	FormName.action="SaveKpdCrm_khxx.jsp";
	FormName.submit();
	return true;
}


function f_lr(FormName)//参数FormName:Form的名称
{

	FormName.action="InsertCrm_htshmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
