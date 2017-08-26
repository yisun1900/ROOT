<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String zwbm=(String)session.getAttribute("zwbm");
String yhmc=(String)session.getAttribute("yhmc");

String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_xcjdjlCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"> 分公司 </td>
    <td><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <%
					if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
					}
					else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
				%>
      </select>    </td>
    <td align="right"> 签约店面 </td>
    <td>
	<select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
        <%
					if (kfgssq.equals("2") || kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
					{
						out.println("<option value=\"\"></option>");
					}
					else if (kfgssq.equals("1") )
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
					}
					else if (kfgssq.equals("3"))
					{
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') ","");
					}
					else if (kfgssq.equals("4"))
					{
						out.println("<option value=\"\"></option>");
						cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"') order by dwbh ","");
					}
					else{
						out.println("错误！未进行客户资料授权，请联系系统管理员");
						return;
					}
					%>
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">签约日期 从</td>
    <td><input type="text" name="qyrq" size="20" maxlength="10" value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">到</td>
    <td><input type="text" name="qyrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
  <td width="34%"><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="20" <% if (!sjs.equals("")) out.println("readonly");%>></td>
    <td align="right">工程担当</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>客户姓名</b></font></td>
    <td><input type="text" name="khxm" size="20" maxlength="50">    </td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm2" size="14" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>联系方式</b></font> </td>
    <td><input type="text" name="lxfs" size="20" maxlength="50">    </td>
    <td align="right"> 联系方式 </td>
    <td><input type="text" name="lxfs2" size="14" maxlength="50">
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000CC"><b>房屋地址</b></font></td>
    <td colspan="3"><input type="text" name="fwdz" size="71" maxlength="100">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 房屋地址 </td>
    <td colspan="3"><input type="text" name="fwdz2" size="65" maxlength="50" >
      （模糊查询） </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
    </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="19%">交底记录号</td> 
  <td width="31%"> 
    <input type="text" name="crm_xcjdjl_jdjlh" size="20" maxlength="10" >  </td>
  <td align="right" width="19%">处理状态</td> 
  <td width="31%">
	<select name="crm_xcjdjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX"  >
		<option value=""></option>
		<option value="1">申请</option>
		<option value="2">确认</option>
		<option value="3">部分确认</option>
		<option value="4">特批完成</option>
		<option value="5">发布</option>
		<option value="6">已交底</option>
	</select>
  </td>

</tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">交底是否成功</td>
    <td><%
	cf.radioToken(out, "crm_xcjdjl_jdsfcg","Y+成功&N+否","");
%></td>
    <td align="right">是否可开工</td>
    <td><%
	cf.radioToken(out, "crm_xcjdjl_sfkkg","Y+是&N+否","");
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right">申请日期 从</td>
  <td><input type="text" name="crm_xcjdjl_sqrq" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xcjdjl_sqrq2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">申请人</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_sqr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">申请人联系电话</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_sqrlxdh" size="20" maxlength="40" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">是否需特批</td> 
  <td width="31%">
	<INPUT type="radio" name="crm_xcjdjl_sfxtp" value="Y">是
    <INPUT type="radio" name="crm_xcjdjl_sfxtp" value="N">否
  </td>
  <td align="right" width="19%">失败是否处理</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_sbsfcl","Y+是&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">计划交底日期 从</td>
  <td><input type="text" name="crm_xcjdjl_jhjdrq" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xcjdjl_jhjdrq2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">最迟完成时间 从</td>
  <td><input type="text" name="crm_xcjdjl_zcwcsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xcjdjl_zcwcsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">特批是否通过</td>
  <td><%
	cf.radioToken(out, "crm_xcjdjl_tpsftg","Y+通过&N+未通过","");
%></td>
  <td align="right">特批审核人</td>
  <td><input type="text" name="crm_xcjdjl_tpshr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">特批审核时间 从</td>
  <td><input type="text" name="crm_xcjdjl_tpshsj" size="20" maxlength="10" ></td>
  <td align="right">到 </td>
  <td><input type="text" name="crm_xcjdjl_tpshsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">交底确认完成时间 从</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_jdqrwcsj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_jdqrwcsj2" size="20" maxlength="10" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">交底发布人</td> 
  <td width="31%"> 
    <input type="text" name="crm_xcjdjl_fbr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">交底发布时间 从</td>
  <td><input type="text" name="crm_xcjdjl_fbsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xcjdjl_fbsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最终确认交底日期 从</td>
  <td><input type="text" name="crm_xcjdjl_zzqrjdrq" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xcjdjl_zzqrjdrq2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">实际交底时间 从</td>
  <td><input type="text" name="crm_xcjdjl_sjjdsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xcjdjl_sjjdsj2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">图纸是否完整</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_tzsfqr","Y+是&N+否","");
%></td>
  <td align="right" width="19%">方案是否可行</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_fasfkx","Y+是&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">客户是否认可</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_khsfqr","Y+是&N+否","");
%></td>
  <td align="right" width="19%">现场负责人充分理解</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_xcfzrqr","Y+是&N+否","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">墙体垂直度是否确认</td> 
  <td width="31%"><%
	cf.radioToken(out, "crm_xcjdjl_qtczdqr","Y+是&N+否","");
%></td>
  <td align="right" width="19%">录入人</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_lrr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">录入时间 从</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_xcjdjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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


function changeFgs(FormName) 
{
	FormName.dwbh.length=1;

	if (FormName.fgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.fgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.dwbh,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_xcjdjl_sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jhjdrq, "计划交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jhjdrq2, "计划交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zcwcsj, "最迟完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zcwcsj2, "最迟完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jdqrwcsj, "交底确认完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_jdqrwcsj2, "交底确认完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_fbsj, "交底发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_fbsj2, "交底发布时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zzqrjdrq, "最终确认交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_zzqrjdrq2, "最终确认交底日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_sjjdsj, "实际交底时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_sjjdsj2, "实际交底时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_tpshsj, "特批审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xcjdjl_tpshsj2, "特批审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
