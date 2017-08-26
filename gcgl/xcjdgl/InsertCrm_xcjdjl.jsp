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
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ls_sql=null;
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">交底记录号</td>
	<td  width="6%">申请日期</td>
	<td  width="6%">申请人</td>
	<td  width="6%">计划交底日期</td>
	<td  width="6%">计划交底时间</td>
	<td  width="6%">最终确认交底日期</td>
	<td  width="6%">最终确认交底时间</td>
	<td  width="6%">实际交底时间</td>
	<td  width="6%">交底是否成功</td>
	<td  width="6%">处理状态</td>
	<td  width="6%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="6%">失败是否处理</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_xcjdjl.jdjlh,crm_xcjdjl.sqrq,crm_xcjdjl.sqr,crm_xcjdjl.jhjdrq,crm_xcjdjl.jhjdsj,crm_xcjdjl.zzqrjdrq,crm_xcjdjl.zzqrjdsj,crm_xcjdjl.sjjdsj, DECODE(crm_xcjdjl.jdsfcg,'Y','成功','N','否'), DECODE(crm_xcjdjl.clzt,'1','申请','2','确认','3','部分确认','4','特批完成','5','发布','6','已交底'),crm_xcjdjl.lrr,crm_xcjdjl.lrsj, DECODE(crm_xcjdjl.sbsfcl,'Y','是','N','否')  ";
	ls_sql+=" FROM crm_khxx,crm_xcjdjl  ";
    ls_sql+=" where crm_xcjdjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_xcjdjl.khbh='"+khbh+"'";
    ls_sql+=" order by crm_xcjdjl.jdjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%>
</table>

<%
String jdjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

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

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";
String xcjdbz="";
String htshbz="";

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

String bgcolor="E8E8FF";

try {
	conn=cf.getConnection();

	ls_sql="select htshbz,xcjdbz,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		htshbz=cf.fillNull(rs.getString("htshbz"));
		xcjdbz=cf.fillNull(rs.getString("xcjdbz"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
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
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (!htshbz.equals("Y"))
	{
		out.println("错误!合同未审核,不能操作");
		return;
	}


	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='店面经理' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(jdjlh,8,3)),0)";
	ls_sql+=" from  crm_xcjdjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jdjlh=khbh+cf.addZero(count+1,3);

	if (!xcjdbz.equals("0") && !xcjdbz.equals("A") && !xcjdbz.equals("B"))//0：未申请；1：普通申请；2：特批申请；3：确认通过；4：确认失败；5：部分确认；6：特批同意；7：特批不同意；8：发布；9：交底成功；A：交底失败；B：失败已出方案
	{
		out.println("错误！已录入申请");
		return;
	}

%>

<div align="center">录入交底申请（交底记录号：<%=jdjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">工程担当</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">管家</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">调度</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">客户经理</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">店长及电话</span></td>
    <td><%=dmjl%>（<%=dmjldh%>）</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">建议交底日期</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>交底类型</td>
    <td>
	  <select name="jdlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
         <OPTION  value=""></OPTION>
      <%
cf.selectItem(out,"select jdlxbm,jdlxmc from dm_jdlxbm order by jdlxbm","");
%>
    </select>	</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>交底项目</td>
    <td colspan="3">
      <input type="checkbox" name="jdxmbm" value="00" onClick="f_no(insertform)">无产品
<%
	String jdxmbm=null;
	String jdxmmc=null;

	ls_sql="SELECT jdxmbm,jdxmmc";
	ls_sql+=" FROM dm_jdxmbm";
	ls_sql+=" order by jdxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;
		jdxmbm=cf.fillNull(rs.getString("jdxmbm"));
		jdxmmc=cf.fillNull(rs.getString("jdxmmc"));

		%>
		  <input type="checkbox" name="jdxmbm" value="<%=jdxmbm%>" onClick="f_change(insertform)"><%=jdxmmc%>
		<%

	}
	rs.close();
	ps.close();
%>

   </td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>申请日期</td> 
  <td width="32%"> 
    <input type="text" name="sqrq" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>申请人</td> 
  <td width="32%"> 
    <input type="text" name="sqr" value="<%=yhmc%>" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>申请人联系电话</td> 
  <td colspan="3"> 
    <input type="text" name="sqrlxdh" value="" size="72" maxlength="40" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计划交底日期</td> 
  <td width="32%"> 
    <input type="text" name="jhjdrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>计划交底时间</td> 
  <td width="32%"> 
    <input type="text" name="jhjdsj" value="" size="6" maxlength="8" >
    时
    （<strong>录入小时</strong>） </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否需特批</td>
  <td><input type="radio" name="sfxtp"  value="Y">
    是
    <input type="radio" name="sfxtp"  value="N">
    否 </td>
  <td align="right">最迟完成时间</td>
  <td><input type="text" name="zcwcsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">申请说明</td>
  <td colspan="3"><textarea name="sqsm" cols="71" rows="3"></textarea></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%> <%=Calendar.getInstance().get(Calendar.HOUR_OF_DAY)%>时" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
</table>


<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
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
</table>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center"> 
      <td colspan="4"> 
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="button" onClick="f_lr(insertform)"  value="交底明细" name="mx" disabled>
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_no(FormName)//参数FormName:Form的名称
{
	for (var i=1;i<=<%=row%> ;i++ )
	{
		FormName.jdxmbm[i].checked=false;
	}
}

function f_change(FormName)//参数FormName:Form的名称
{
	FormName.jdxmbm[0].checked=false;
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("请输入[交底记录号]！");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jdlxbm)=="") {
		alert("请输入[交底类型]！");
		FormName.jdlxbm.focus();
		return false;
	}
    if(	!radioChecked(FormName.jdxmbm)) {
		alert("请选择[交底项目]！");
		FormName.jdxmbm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrlxdh)=="") {
		alert("请输入[申请人联系电话]！");
		FormName.sqrlxdh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxtp)) {
		alert("请选择[是否需特批]！");
		FormName.sfxtp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jhjdrq)=="") {
		alert("请输入[计划交底日期]！");
		FormName.jhjdrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjdrq, "计划交底日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jhjdsj)=="") {
		alert("请输入[计划交底时间]！");
		FormName.jhjdsj.focus();
		return false;
	}
	if(!(isFloat(FormName.jhjdsj, "计划交底时间"))) {
		return false;
	}
	if (FormName.jhjdsj.value<0 || FormName.jhjdsj.value>24)
	{
		alert("[计划交底时间]只能是0到24小时之间！");
		FormName.jhjdsj.select();
		return false;
	}
	if(!(isDatetime(FormName.zcwcsj, "最迟完成时间"))) {
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

	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveInsertCrm_xcjdjl.jsp";
	FormName.submit();

	if (!FormName.jdxmbm[0].checked)
	{
		FormName.mx.disabled=false;
	}
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("请输入[交底记录号]！");
		FormName.jdjlh.focus();
		return false;
	}
	FormName.action="InsertCrm_jdxmmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
