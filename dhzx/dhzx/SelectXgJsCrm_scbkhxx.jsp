<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #0000CC; font-weight: bold; }
-->
</style>
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
String dwbh=(String)session.getAttribute("dwbh");

String yhmc=(String)session.getAttribute("yhmc");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhxxXgJsList.jsp" name="selectform">
<div align="center">市场部客户－删除接收</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td align="right">所属分公司</td>
  <td>
		<select name="crm_scbkhxx_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
		</select>			  </td>
  <td align="right">接收部门</td>
  <td><select name="crm_scbkhxx_yjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">市场部客户编号</td> 
  <td width="33%"> 
    <input type="text" name="crm_scbkhxx_scbkhbh" size="20" maxlength="20" >  </td>
  <td align="right" width="17%">状态</td> 
  <td width="33%"><input type="radio" name="crm_scbkhxx_zt" value="4" checked>
    已接收</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">客户姓名</span></td>
  <td><input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" ></td>
  <td width="17%" align="right">客户姓名</td>
  <td><input type="text" name="crm_scbkhxx_khxm2" size="14" maxlength="50" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE3">房屋地址</span></td> 
  <td width="33%"> 
    <input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
  <td align="right">房屋地址</td>
  <td width="33%"><input type="text" name="crm_scbkhxx_fwdz2" size="14" maxlength="100" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">电话</span></td>
  <td><input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" ></td>
  <td align="right">联系方式</td>
  <td><input type="text" name="crm_scbkhxx_lxfs2" size="14" maxlength="50" >
    （模糊查询）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">业务员</td> 
  <td width="33%"> 
    <input type="text" name="crm_scbkhxx_ywy" size="20" maxlength="20" >  </td>
  <td align="right" width="17%">所属小组</td> 
  <td width="33%"> 
    <input type="text" name="crm_scbkhxx_ywyssxz" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">失败原因</td> 
  <td width="33%"><select name="crm_scbkhxx_sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
  </select></td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_scbkhxx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">录入人</td> 
  <td width="33%"> 
    <input type="text" name="crm_scbkhxx_lrr" size="20" maxlength="20" value="" >  </td>
  <td align="right" width="17%">失败登记人</td> 
  <td width="33%"><input type="text" name="crm_scbkhxx_sbdjr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">失败登记时间 从</td>
  <td><input type="text" name="crm_scbkhxx_sbdjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_sbdjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">移交时间 从</td>
  <td><input type="text" name="crm_scbkhxx_yjsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_scbkhxx_yjsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">移交人</td>
  <td><input type="text" name="crm_scbkhxx_yjr" size="20" maxlength="20" value="" >  </td>
  <td align="right">录入部门</td>
  <td><select name="crm_scbkhxx_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
			}
			else if (kfgssq.equals("5") || kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwflbm='07' and  cxbz='N' and ssfgs='"+ssfgs+"'","");
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
			%>
  </select></td>
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
	//启用Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.crm_scbkhxx_lrbm.length=1;
	FormName.crm_scbkhxx_yjbm.length=1;

	if (FormName.crm_scbkhxx_ssfgs.value=="")
	{
		return;
	}


	var sql="select dwbh,dwmc from sq_dwxx where dwflbm='07' and  cxbz='N' and ssfgs='"+FormName.crm_scbkhxx_ssfgs.value+"' order by cxbz,dwbh";
	var sql1="select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+FormName.crm_scbkhxx_ssfgs.value+"' order by cxbz,dwbh";


	var actionStr="/ajax/selectstrs.jsp?sql="+sql+"&sql1="+sql1;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	selectform.crm_scbkhxx_lrbm.length=1;
	var value1=getStrValue(ajaxRetStr,1);
	strToSelect(selectform.crm_scbkhxx_lrbm,value1);

	selectform.crm_scbkhxx_yjbm.length=1;
	var value2=getStrValue(ajaxRetStr,2);
	strToSelect(selectform.crm_scbkhxx_yjbm,value2);
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_scbkhxx_sbdjsj, "失败登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_sbdjsj2, "失败登记时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjsj, "移交时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhxx_yjsj2, "移交时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
