<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String fgsmc= null;
String dwbh= null;
String dwmc= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
double wdzgce= 0;
double qye= 0;
double cdzwjmje= 0;
double suijin= 0;
double suijinbfb= 0;
double glfbfb=0;//管理费百分比
double zqguanlif= 0;
double guanlif= 0;
double glfjmje= 0;
double sjjmje= 0;

double zqwjrqyexm= 0;
double zhwjrqyexm= 0;
String wjrqyexmsm= null;

double sjf= 0;
double glf= 0;
double zkl= 0;
double zjxzkl= 0;

double qdhdzk=10;
double glfzk=10;
double zjxhdzk=10;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zklx="";


try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,crm_khxx.fgsbh,a.dwmc fgsmc,crm_khxx.dwbh,b.dwmc dwmc,sjsbh,sjs,sjsgh,wdzgce";
	ls_sql+=" ,zkl,zjxzkl,cdzwjmje,glfjmje,sjjmje,qye,suijin,suijinbfb,sjf,glf,glfbfb,zqguanlif,guanlif ";
	ls_sql+=" ,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where  crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		fgsmc=cf.fillNull(rs.getString("fgsmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		zjxzkl=rs.getDouble("zjxzkl");
		qye=rs.getDouble("qye");
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		glfbfb=rs.getDouble("glfbfb");
		zqguanlif=rs.getDouble("zqguanlif");
		guanlif=rs.getDouble("guanlif");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();


	//ls_sql="select qdhdzk,glfzk,zjxhdzk";
	ls_sql+=" from  crm_cxhdzk";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdhdzk=rs.getDouble("qdhdzk");
		glfzk=rs.getDouble("glfzk");
		zjxhdzk=rs.getDouble("zjxhdzk");
	}
	rs.close();
	ps.close();

	ls_sql="select zklx";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zklx=cf.fillNull(rs.getString("zklx"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  cw_sjxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);


%>


<div align="center">修改税金（修改记录号：<%=xgjlh%>）</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="20%" align="right"><font color="#0000FF">合同号</font></td>
      <td width="30%"><%=hth%> </td>
      <td width="21%" align="right"><font color="#0000FF">客户姓名</font></td>
      <td width="29%"><%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">分公司</font></td>
      <td><%=fgsmc%> </td>
      <td align="right"><font color="#0000FF">签约店面</font></td>
      <td><%=dwmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">设计师</font></td>
      <td><%=sjs%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">工程原报价</font></td>
      <td><%=wdzgce%></td>
      <td align="right"><font color="#0000FF">签约额</font></td>
      <td><%=qye%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">合同减免额</font></td>
      <td><%=cdzwjmje%></td>
      <td align="right"><font color="#0000FF">管理费百分比</font></td>
      <td><%=glfbfb%>%</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">折前管理费</font></td>
      <td><%=zqguanlif%></td>
      <td align="right"><font color="#0000FF">折后管理费</font></td>
      <td><%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">管理费减免额</font></td>
      <td><%=glfjmje%></td>
      <td align="right"><font color="#0000FF">税金减免额</font></td>
      <td><%=sjjmje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">税金百分比</font></td>
      <td><%=suijinbfb%> % </td>
      <td align="right"><font color="#0000FF">税金</font></td>
      <td><%=suijin%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">折前未记入签约额项目</font></td>
      <td><%=zqwjrqyexm%></td>
      <td align="right"><font color="#0000FF">折后未记入签约额项目</font></td>
      <td><%=zhwjrqyexm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">未记入签约额项目说明</font></td>
      <td colspan="3"><%=wjrqyexmsm%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">设计费</font></td>
      <td><%=sjf%></td>
      <td align="right"><font color="#0000FF">服务费</font></td>
      <td><%=glf%></td>
    </tr>
  </table>
  <BR>

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right">折扣类型</td>
      <td><%
	cf.selectToken(out,"1+全额折扣&2+单项折扣",zklx,true);
%></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="20%" align="right">合同折扣</td>
      <td width="30%"><%=zkl%></td>
      <td width="21%" align="right">增减项折扣</td>
      <td width="29%"><%=zjxzkl%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center">促销活动折扣</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">签单折扣</td>
      <td><%=qdhdzk%></td>
      <td align="right">管理费折扣</td>
      <td><%=glfzk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="20%" align="right">增减项折扣</td>
      <td width="30%"><%=zjxhdzk%></td>
      <td width="21%" align="right">&nbsp;</td>
      <td width="29%">&nbsp;</td>
    </tr>
  </table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td colspan="12"><b>电子报价综合取费</b></td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="18%">收费项目</td>
    <td  width="14%">收费类型</td>
    <td  width="7%">记入签约额</td>
    <td  width="7%">记入税金</td>
    <td  width="7%">记入管理费</td>
    <td  width="8%">收费百分比</td>
    <td  width="12%">折前收费金额</td>
    <td  width="8%">单项折扣</td>
    <td  width="8%">促销活动折扣</td>
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
	double cxhdzkl=0;
	double sfje=0;
	ls_sql="SELECT sfxmmc,DECODE(bj_sfxmmx.sflx,'1','直接费百分比','2','固定金额(可改)','3','税金','4','固定金额(不可改)','5','管理费','6','设计费') sflx";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfjrqye,'1','记入','2','<font color=\"#FF0000\"><B>不记入</B></font>') sfjrqye";
	ls_sql+=" ,DECODE(bj_sfxmmx.jrsjbz,'1','记入','2','不记入') jrsjbz,DECODE(bj_sfxmmx.jrglfbz,'1','记入','2','不记入') jrglfbz";
	ls_sql+=" ,DECODE(bj_sfxmmx.sfkdz,'N','不可打折','Y','可打折') sfkdz,bj_sfxmmx.sfbfb";
	ls_sql+=" ,bj_sfxmmx.zqsfje,bj_sfxmmx.dxzkl,bj_sfxmmx.cxhdzkl,bj_sfxmmx.sfje";
	ls_sql+=" FROM bj_sfxmmx  ";
	ls_sql+=" where bj_sfxmmx.khbh='"+khbh+"'";
	ls_sql+=" order by bj_sfxmmx.sfxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sfxmmc=rs.getString("sfxmmc");
		sflx=rs.getString("sflx");
		sfjrqye=rs.getString("sfjrqye");
		jrsjbz=rs.getString("jrsjbz");
		jrglfbz=rs.getString("jrglfbz");
		sfbfb=rs.getDouble("sfbfb");
		zqsfje=rs.getDouble("zqsfje");
		dxzkl=rs.getDouble("dxzkl");
		cxhdzkl=rs.getDouble("cxhdzkl");
		sfje=rs.getDouble("sfje");

		%>
		<tr bgcolor="#FFFFFF"  align="center">
		<td><%=sfxmmc%></td>
		<td><%=sflx%></td>
		<td><%=sfjrqye%></td>
		<td><%=jrsjbz%></td>
		<td><%=jrglfbz%></td>
		<td><%=sfbfb%>%</td>
		<td><%=zqsfje%></td>
		<td><%=dxzkl%></td>
		<td><%=cxhdzkl%></td>
		<td><%=sfje%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<BR>
<form method="post" action="SaveInsertCw_sjxgjl.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">修改前税率</font></td> 
  <td width="30%"><input type="text" name="xgqsuijinbfb" value="<%=suijinbfb%>" size="10" maxlength="9" readonly>
    %</td>
  <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000FF">修改前税金</font></td> 
  <td width="29%"><input type="text" name="xgqsuijin" value="<%=suijin%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>修改后税率</td> 
  <td width="30%"> 
    <input type="text" name="xghsuijinbfb" value="" size="10" maxlength="9" onChange="calValue(insertform)">
    %  </td>
  <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000FF">修改后税金</font></td> 
  <td width="29%"><input type="text" name="xghsuijin" value="<%=suijin%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000FF">录入部门</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>税金减免额</td>
  <td><input type="text" name="sjjmje" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td> 
  <td width="30%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td> 
  <td width="29%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="20%"><font color="#FF0000">*</font>备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="73" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="fgsbh" value="<%=fgsbh%>" >
	<input type="hidden" name="xgjlh" value="<%=xgjlh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="khxm" value="<%=khxm%>" >
	<input type="hidden" name="wdzgce" value="<%=wdzgce%>" >
	<input type="hidden" name="guanlif" value="<%=guanlif%>" >
	<input type="hidden" name="qye" value="<%=qye%>" ></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	var xghsuijin=(FormName.qye.value*1.0+FormName.guanlif.value*1.0)*FormName.xghsuijinbfb.value/100.0-FormName.sjjmje.value;
	xghsuijin=round(xghsuijin,2);
	FormName.xghsuijin.value=xghsuijin;      
}    

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.xgjlh)=="") {
		alert("请输入[修改记录号]！");
		FormName.xgjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(!(isFloat(FormName.qye, "签约额"))) {
		return false;
	}
	if(!(isFloat(FormName.guanlif, "折后管理费"))) {
		return false;
	}

	if(	javaTrim(FormName.xgqsuijinbfb)=="") {
		alert("请选择[修改前税率]！");
		FormName.xgqsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.xgqsuijinbfb, "修改前税率"))) {
		return false;
	}

	if(	javaTrim(FormName.xghsuijinbfb)=="") {
		alert("请选择[修改后税率]！");
		FormName.xghsuijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.xghsuijinbfb, "修改后税率"))) {
		return false;
	}
	if (FormName.xghsuijinbfb.value<0 || FormName.xghsuijinbfb.value>100)
	{
		alert("错误！[修改后税率]应该在0和100之间！");
		FormName.xghsuijinbfb.select();
		return false;
	}

	if(	javaTrim(FormName.xgqsuijin)=="") {
		alert("请选择[修改前税金]！");
		FormName.xgqsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.xgqsuijin, "修改前税金"))) {
		return false;
	}

	if(	javaTrim(FormName.xghsuijin)=="") {
		alert("请选择[修改后税金]！");
		FormName.xghsuijin.focus();
		return false;
	}
	if(!(isFloat(FormName.xghsuijin, "修改后税金"))) {
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

	if(	javaTrim(FormName.bz)=="") {
		alert("请选择[备注]！");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
