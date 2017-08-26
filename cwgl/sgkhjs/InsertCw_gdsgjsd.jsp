<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<%
String lrbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=request.getParameter("khbh");

int count=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String xb=null;
String sjs=null;
String hth=null;
String qyrq=null;
String jgrq=null;
String dwbh=null;
String sjsbh=null;
String fgsbh=null;
String sgd=null;
String zjxm=null;
double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double sfke=0;
double zjxssk=0;

double yfgckze=0;
double gckzc=0;
double zjxje=0;
double zhzjxje=0;
double kglf=0;
double kqtk=0;
double zkl=0;
double gckk=0;
double suijin=0;
double suijinbfb=0;
double zjxsuijin=0;
double guanlif=0;
double zjxguanlif=0;

String sgbz=null;
String sjsdh=null;
String bzdh=null;
String zjdh=null;
String sjfkzc=null;
String zjxwcbz=null;
String gcjdmc=null;
String gckkspbz=null;
String fkcsmc=null;
String ztmc=null;

String cxhdbm=null;
String sffj=null;
double fjje=0;
double gsfje=0;
String sfyrz=null;
String rzsc=null;
String sfyyh=null;
String yhyy=null;
double khjsje=0;
String qsjhtsj=null;
double sjhtje=0;



Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";

String fkxh="";
try {
	conn=cf.getConnection();
	ls_sql="select DECODE(zt,'2','家装客户','3','退单客户','4','非家装客户','5','设计客户') ztmc,zjxssk,guanlif,zjxguanlif,suijin,suijinbfb,zjxsuijin,cxhdbm,sffj,fjje,gsfje,sfyrz,rzsc,sfyyh,yhyy,fkcsmc,kqtk,kglf,gckkspbz,gcjdmc,zjxwcbz,gckk,zkl,sjfkzc,fgsbh,sjsbh,khxm,fwdz,lxfs,xb,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,sjf,glf,sfke,zjxje,zhzjxje,sgbz,jgrq,khjsje";
	ls_sql+=" from  crm_khxx,dm_gcjdbm,cw_fkcs";
	ls_sql+=" where crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and khbh='"+khbh+"' and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+)";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));
		zjxssk=rs.getDouble("zjxssk");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		zjxsuijin=rs.getDouble("zjxsuijin");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		fjje=rs.getDouble("fjje");
		gsfje=rs.getDouble("gsfje");
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));

		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
		kglf=rs.getDouble("kglf");
		kqtk=rs.getDouble("kqtk");
		gckkspbz=cf.fillNull(rs.getString("gckkspbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		gckk=rs.getDouble("gckk");
		zkl=rs.getDouble("zkl");
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		xb=cf.fillNull(rs.getString("xb"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		wdzgce=rs.getDouble("wdzgce");
		khjsje=rs.getDouble("khjsje");
		qye=rs.getDouble("qye");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		zjxguanlif=rs.getDouble("zjxguanlif");

		sfke=rs.getDouble("sfke");
		zjxje=rs.getDouble("zjxje");
		zhzjxje=rs.getDouble("zhzjxje");
	}
	rs.close();
	ps.close();


	//设计师电话
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
	
	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//质检电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+fgsbh+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql="select qsjhtsj from crm_zxkhxx ";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qsjhtsj=cf.fillNull(rs.getDate("qsjhtsj"));
	}
	rs.close();
	ps.close();

	//包括量房金、委托金、设计费、预算款、效果图款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm in('52','55','57','53','58') and scbz='N'";
	ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjhtje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
%>


<form method="post" action="SaveInsertCw_gdsgjsd.jsp" name="insertform" target="_blank">
<div align="center">录入－客户结算单（客户编号：<%=khbh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF">
      <td align="right">客户编号</td>
      <td><%=khbh%>（<%=ztmc%>）</td>
      <td align="right">合同号</td>
      <td><%=hth%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td><div align="right">房屋地址</div></td>
      <td><%=fwdz%></td>
      <td><div align="right">客户姓名</div></td>
      <td><%=khxm%></td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td><div align="right">签约店面</div></td>
      <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
      <td bgcolor="#E8E8FF" align="right">设计师</td>
      <td><%=sjs%>（<%=sjsdh%>） </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td align="right" bgcolor="#E8E8FF">施工队</td>
      <td colspan="2"><%
	cf.selectItem(out,"select sgd,sgdmc||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
      <td>质检：<%=zjxm%>（<%=zjdh%>） </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td><div align="right">签约－－合同竣工</div></td>
      <td>[<%=qyrq%>]－－[<%=jgrq%>]</td>
      <td><div align="right">工程进度</div></td>
      <td><%=gcjdmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">工程预算款</td>
      <td width="33%"><input type="text" name="wdzje" value="<%=wdzgce%>" size="20" maxlength="17" readonly></td>
      <td align="right" width="17%">实收款</td>
      <td width="33%"><input type="text" name="ssk" value="<%=sfke%>" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">委托金</td>
      <td width="33%"> 
      <input type="text" name="wtj" value="<%=sjhtje%>" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">委托金日期</td>
      <td width="33%"> 
      <input type="text" name="wtjrq" value="<%=qsjhtsj%>" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">增项金额</td>
      <td><input type="text" name="zxje" value="" size="20" maxlength="17" ></td>
      <td align="right">减项金额</td>
      <td><input type="text" name="jxje" value="" size="20" maxlength="17" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">结算款</td>
      <td width="33%"> 
      <input type="text" name="jsk" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="17%">结算日期</td>
      <td width="33%"> 
      <input type="text" name="jsrq" value="" size="20" maxlength="10"  onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">结算优惠</td>
      <td colspan="3"><textarea name="jsyh" cols="71" rows="3"></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入人</td>
      <td width="33%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
      <td align="right" width="17%">录入时间</td>
      <td width="33%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入部门</td>
      <td width="33%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
      </select></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
        <input type="button"  value="存盘" onClick="f_do(insertform)">
      <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
</form>
<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#FFFFFF" cellpadding="2" cellspacing="2">
  <tr>
    <td> 甲方代表签字：</td>
    <td colspan="2"> 乙方代表签字：</td>
    <td colspan="2">工程负责人签字：</td>
  </tr>
  <tr>
    <td>日      期：</td>
    <td colspan="2">日      期：</td>
    <td colspan="2">日      期：</td>
  </tr>
  <tr>
    <td>工程部经理签字：</td>
    <td colspan="2">工程总监签字：</td>
    <td colspan="2">分公司经理签字：</td>
  </tr>
  <tr>
    <td>日      期：</td>
    <td colspan="2">日      期：</td>
    <td colspan="2">日      期：</td>
  </tr>
  <tr>
    <td colspan="5"><div align="center">客  户  留  言</div></td>
  </tr>
  <tr>
    <td height="80" colspan="5">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><div align="center">完    结    审    核</div></td>
  </tr>
  <tr>
    <td td height="80" colspan="5">&nbsp;</td>
  </tr>
    <td colspan="2">核对签字：</td>
    <td colspan="3">审核签字：</td>
    </tr>
    <td colspan="2">日      期：</td>
    <td colspan="3">日      期：</td>
    </tr>
</table>
</body>
</html>


<%
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[工程预算款]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "工程预算款"))) {
		return false;
	}
	if(	javaTrim(FormName.zxje)=="") {
		alert("请输入[增项金额]！");
		FormName.zxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zxje, "增项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jxje)=="") {
		alert("请输入[减项金额]！");
		FormName.jxje.focus();
		return false;
	}
	if(!(isFloat(FormName.jxje, "减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("请输入[实收款]！");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "实收款"))) {
		return false;
	}

	if(	javaTrim(FormName.wtj)=="") {
		alert("请输入[委托金]！");
		FormName.wtj.focus();
		return false;
	}
	if(!(isFloat(FormName.wtj, "委托金"))) {
		return false;
	}
	if(!(isDatetime(FormName.wtjrq, "委托金日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jsk)=="") {
		alert("请输入[结算款]！");
		FormName.jsk.focus();
		return false;
	}
	if(!(isFloat(FormName.jsk, "结算款"))) {
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "结算日期"))) {
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
