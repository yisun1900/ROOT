<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {	color: #FF0000;
	font-weight: bold;
}
.STYLE3 {color: #0000FF}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String bxkh="";
String jjwjbz="";
String gcjdbm="";
String fgsbh=null;
String khxm=null;
String lxfs=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
int fwmj=0;
String hyh=null;
String cxhdbm=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String gdjsjd=null;
String zjxxh="";
String khjsbz="";
String hxmc="";
String bjjbmc="";

double sjhtje=0;
double sssjf=0;

double wdzgce=0;
double qye=0;



double zqguanlif=0;
double guanlif=0;
double zqsuijin=0;
double suijin=0;
double glfbfb=0;

double zhzjxje=0;
double zjxsuijin=0;
double zjxguanlif=0;

double cwsfke=0;
double yjzck=0;
double fxjzck=0;
double sfke=0;
double dj=0;

double jsze=0;

double yjwk=0;
double yhje=0;
double fqbl=0;
double fqje=0;
double shfqje=0;


double zqljzjx=0;
double zhljzjx=0;
double zqhj=0;
double zhhj=0;

double djfxje=0;
double yhze=0;
double dyq=0;
double pck=0;
double khbjk=0;


double zqgczjf=0;
double zhgczjf=0;
double zkl=0;

double zjxje=0;
double zqzjxguanlif=0;
double zqzjxsuijin=0;
double zqqtsf=0;
double suijinbfb=0;

double zqqtsfzjx=0;
double zqwjrqyexm=0;
double zqwjrzjx=0;

double zqsjf=0;
double zqsjfzjx=0;
double zqhtzcbj=0;


double zcddjezq=0;
double zcddjezh=0;

double dgzcjezq=0;
double dgzcyh=0;
double zcjsje=0;
double zctcze=0;

String fxgck="";//订金折现
double fxdj=0;
String qtsfsm="";
String wjrqyexmsm="";
String zklmc="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bxkh,khjsbz,cxhdbm,hyh,fwmj,zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,lxfs,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce,qye,zqguanlif,guanlif,glfbfb,zqsuijin,suijin,zhzjxje,zjxsuijin,zjxguanlif,cwsfke,sfke";
	ls_sql+=" ,hxmc,bjjbmc,zqljzjx,zhljzjx,qtsfsm,wjrqyexmsm,crm_khxx.jjwjbz,crm_khxx.gcjdbm ";

	ls_sql+=" ,zqgczjf,zhgczjf,zjxje,zqzjxguanlif,zqzjxsuijin,zqqtsf,suijinbfb,zqqtsfzjx,zqwjrqyexm,zqwjrzjx,zqsjf,zqsjfzjx,zqhtzcbj";
	
	ls_sql+=" from  crm_khxx,sq_dwxx,dm_hxbm,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ls_sql+=" and  crm_khxx.hxbm=dm_hxbm.hxbm(+)";
	ls_sql+=" and  crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bxkh=cf.fillNull(rs.getString("bxkh"));
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		qtsfsm=cf.fillNull(rs.getString("qtsfsm"));
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		zqgczjf=rs.getDouble("zqgczjf");
		zhgczjf=rs.getDouble("zhgczjf");
		zjxje=rs.getDouble("zjxje");
		zqzjxguanlif=rs.getDouble("zqzjxguanlif");
		zqzjxsuijin=rs.getDouble("zqzjxsuijin");
		zqqtsf=rs.getDouble("zqqtsf");
		suijinbfb=rs.getDouble("suijinbfb");
		zqqtsfzjx=rs.getDouble("zqqtsfzjx");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zqwjrzjx=rs.getDouble("zqwjrzjx");
		zqsjf=rs.getDouble("zqsjf");
		zqsjfzjx=rs.getDouble("zqsjfzjx");
		zqhtzcbj=rs.getDouble("zqhtzcbj");
	
		
		
		
		hxmc=cf.fillNull(rs.getString("hxmc"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		khjsbz=cf.fillNull(rs.getString("khjsbz"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		zqljzjx=rs.getDouble("zqljzjx");
		zhljzjx=rs.getDouble("zhljzjx");

		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		glfbfb=rs.getDouble("glfbfb");
		zqsuijin=rs.getDouble("zqsuijin");
		suijin=rs.getDouble("suijin");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxsuijin=rs.getDouble("zjxsuijin");
		zjxguanlif=rs.getDouble("zjxguanlif");
		cwsfke=rs.getDouble("cwsfke");
		sfke=rs.getDouble("sfke");

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		hyh=cf.fillNull(rs.getString("hyh"));
		fwmj=rs.getInt("fwmj");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!khjsbz.equals("N"))
	{
		out.println("错误！客户已结算");
		return;
	}

	if (!gcjdbm.equals("5"))//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止
	{
//		out.println("错误！客户工程未完结");
//		return;
	}

	if (!jjwjbz.equals("Y"))//N：未完结；Y：完结
	{
//		out.println("错误！客户家居未完结");
//		return;
	}


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

		zklmc="整单折扣:"+zkl;
	}
	else {
		zkl=gcfqdzk;
		zklmc="工程费折扣:"+zkl;
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrkhjs.jsp" name="insertform" target="_blank">
<div align="center">客户结算(<font color="#0000FF">客户编号:<%=khbh%></font>)</div>
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
  <td align="right"><strong>
    小 计</strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce)%></strong></td>
  <td align="center"><strong><%=cf.formatDouble(zqljzjx)%></strong></td>
  <td align="center"><strong><%=cf.formatDouble(wdzgce+zqljzjx)%></strong></td>
</tr>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"><font color="#FF0000">*</font>客户赔偿款</td>
  <td width="32%"><input type="text" name="khpck" value="" size="20" maxlength="17" ></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>延期费</td>
  <td width="32%"><input type="text" name="yqf" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>结算优惠</td>
  <td><input type="text" name="jsyh" value="" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="khbh" value="<%=khbh%>">

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

	if(	javaTrim(FormName.khpck)=="") {
		alert("请输入[客户赔偿款]！");
		FormName.khpck.focus();
		return false;
	}
	if(!(isFloat(FormName.khpck, "客户赔偿款"))) {
		return false;
	}
	if(	javaTrim(FormName.yqf)=="") {
		alert("请输入[延期费]！");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "延期费"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyh)=="") {
		alert("请输入[结算优惠]！");
		FormName.jsyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyh, "结算优惠"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
