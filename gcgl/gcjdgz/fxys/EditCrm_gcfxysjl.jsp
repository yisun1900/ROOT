<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String ysxmflbm=null;
String ysxmflmc=null;
String gcysxmbm=null;
String gcysxmmc=null;
String sffszg=null;
String yssj=null;
String ysr=null;
String ysjg=null;
String yssm=null;
String sfkhbrqz=null;
String dqzysq=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String gj=null;
String dd=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sybgcrq=null;
double ysdf=0;

String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ysdf,khbh,ysxmflbm,ysxmflmc,gcysxmbm,gcysxmmc,sffszg,yssj,ysr,ysjg,yssm,sfkhbrqz,dqzysq,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  crm_gcfxysjl";
	ls_sql+=" where  (ysjlh='"+ysjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ysdf=rs.getDouble("ysdf");
		khbh=cf.fillNull(rs.getString("khbh"));
		ysxmflbm=cf.fillNull(rs.getString("ysxmflbm"));
		ysxmflmc=cf.fillNull(rs.getString("ysxmflmc"));
		gcysxmbm=cf.fillNull(rs.getString("gcysxmbm"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		sffszg=cf.fillNull(rs.getString("sffszg"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		ysjg=cf.fillNull(rs.getString("ysjg"));
		yssm=cf.fillNull(rs.getString("yssm"));
		sfkhbrqz=cf.fillNull(rs.getString("sfkhbrqz"));
		dqzysq=cf.fillNull(rs.getString("dqzysq"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwmc,sgd,sgbz,gj,dd,zjxm,sybgcrq";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><strong>分项验收－维护</strong>（验收记录号：<%=ysjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> 客户姓名 </td>
    <td><%=khxm%></td>
    <td align="right"> 合同号 </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">房屋地址</td>
    <td><%=fwdz%></td>
    <td align="right">工程担当</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> 签约店面 </td>
    <td><%=dwmc%> </td>
    <td align="right"> 设计师 </td>
    <td><%=sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> 签约日期 </td>
    <td><%=qyrq%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"> 施工队 </td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%>    </td>
    <td align="right"> 班长 </td>
    <td><%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">管家</td>
    <td><%=gj%></td>
    <td align="right">调度</td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">合同开工日期</td>
    <td><font color="#000000"><%=kgrq%></font></td>
    <td align="right">合同竣工日期</td>
    <td><font color="#000000"><%=jgrq%></font></td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right">实际开工日期</td>
    <td><font color="#000000"><%=sjkgrq%></font></td>
    <td align="right">实际竣工日期</td>
    <td><font color="#000000"><%=sjjgrq%></font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCFF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>验收项目分类</td> 
  <td width="31%"> 
    <select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeYsxmflbm(insertform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm",ysxmflbm);
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>验收项目</td> 
  <td colspan="3"> 
    <select name="gcysxmbm" style="FONT-SIZE:12PX;WIDTH:525PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysxmbm,gcysxmmc||DECODE(sfhf,'Y','（需回访）','N','') from dm_gcysxm where ysxmflbm='"+ysxmflbm+"' order by ysxmflbm,gcysxmbm",gcysxmbm);
%>
    </select>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>验收人</td> 
  <td width="31%"> 
    <input type="text" name="ysr" size="20" maxlength="20"  value="<%=ysr%>" >  </td>
  <td align="right" width="19%"><font color="#FF0000">*</font>验收时间</td> 
  <td width="31%"><input type="text" name="yssj" size="20" maxlength="10"  value="<%=yssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>验收结果</td>
  <td><%
	cf.radioToken(out,"ysjg","1+合格&2+不合格",ysjg);
%></td>
  <td align="right"><font color="#FF0000">*</font>验收得分</td>
  <td><input type="text" name="ysdf" value="<%=ysdf%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>是否发生整改</td>
  <td><%
	cf.radioToken(out,"sffszg", "1+是&2+否",sffszg);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font>是否客户本人签字</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "sfkhbrqz","Y+是&N+否",sfkhbrqz);
%>  </td>
  <td align="right" width="19%"><font color="#FF0000">*</font>代签字是否有授权</td> 
  <td width="31%"> 
<%
	cf.radioToken(out, "dqzysq","Y+有&N+无授权",dqzysq);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">验收说明</td>
  <td colspan="3"><textarea name="yssm" cols="72" rows="3"><%=yssm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td> 
  <td width="31%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td> 
  <td width="31%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入部门</font> </td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
	  <input type="button"  value="保存" onClick="f_do(insertform)">
	  <input type="button"  value="上传照片" onClick="f_lr(insertform)" name="lr" >
      <input type="button"  value="查看照片" onClick="f_ck(insertform)" name="ck" >
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>


function changeYsxmflbm(FormName) 
{
	FormName.gcysxmbm.length=1;

	if (FormName.ysxmflbm.value=="")
	{
		return;
	}

	var sql;
	sql="select gcysxmbm,gcysxmmc||DECODE(sfhf,'Y','（需回访）','N','') from dm_gcysxm where ysxmflbm='"+FormName.ysxmflbm.value+"' order by gcysxmbm";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.gcysxmbm,ajaxRetStr);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("请选择[验收项目分类]！");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("请选择[验收项目]！");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysr)=="") {
		alert("请输入[验收人]！");
		FormName.ysr.focus();
		return false;
	}
	if(	javaTrim(FormName.yssj)=="") {
		alert("请输入[验收时间]！");
		FormName.yssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yssj, "验收时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.ysjg)) {
		alert("请选择[验收结果]！");
		FormName.ysjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ysdf)=="") {
		alert("请输入[验收得分]！");
		FormName.ysdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ysdf, "验收得分"))) {
		return false;
	}
	if(	!radioChecked(FormName.sffszg)) {
		alert("请选择[是否发生整改]！");
		FormName.sffszg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfkhbrqz)) {
		alert("请选择[是否客户本人签字]！");
		FormName.sfkhbrqz[0].focus();
		return false;
	}

	if (FormName.sfkhbrqz[1].checked)
	{
		if(	!radioChecked(FormName.dqzysq)) {
			alert("请选择[代签字是否有授权]！");
			FormName.dqzysq[0].focus();
			return false;
		}
	}
	else{
		FormName.dqzysq[0].checked=false;
		FormName.dqzysq[1].checked=false;
	}

	if (FormName.ysjg[1].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("验收结果不合格，请输入[验收说明]！");
			FormName.yssm.focus();
			return false;
		}
	}
	if (FormName.sffszg[0].checked)
	{
		if(	javaTrim(FormName.yssm)=="") {
			alert("发生整改，请输入[验收说明]！");
			FormName.yssm.focus();
			return false;
		}
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


	FormName.action="SaveEditCrm_gcfxysjl.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="UploadFile.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ysjlh)=="") {
		alert("请输入[验收记录号]！");
		FormName.ysjlh.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
