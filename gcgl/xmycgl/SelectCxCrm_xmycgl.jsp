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
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_xmycglCxList.jsp" name="selectform">
<div align="center">项目异常登记－查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
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
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
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
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">工程担当</td>
    <td><input type="text" name="zjxm" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">管家</td>
    <td><input type="text" name="gj" size="20" maxlength="20"></td>
    <td align="right">调度</td>
    <td><input type="text" name="dd" size="20" maxlength="20"></td>
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
    <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
    </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="20%">登记编号</td> 
  <td width="30%"> 
    <input type="text" name="crm_xmycgl_djbh" size="20" maxlength="10" >  </td>
  <td align="right" width="20%">状态</td> 
  <td width="30%"><select name="crm_xmycgl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">异常录入</option>
    <option value="2">制订方案</option>
    <option value="3">方案审核</option>
    <option value="4">已处理</option>
    <option value="5">停工申请</option>
    <option value="6">停工审批</option>
    <option value="7">办理停工</option>
    <option value="8">办理复工</option>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">出现问题时间 从</td>
  <td><input type="text" name="crm_xmycgl_cxwtsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_cxwtsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_xmycgl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">录入人</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="20%">当事人</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_dsr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">解决方案制订时间 从</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfazdsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">到</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfazdsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">解决方案制订人</td>
  <td><input type="text" name="crm_xmycgl_jjfazdr" size="20" maxlength="20" ></td>
  <td align="right">解决方案审核人</td>
  <td><input type="text" name="crm_xmycgl_jjfashr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">解决方案审核时间 从</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfashsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="20%">到</td> 
  <td width="30%"><input type="text" name="crm_xmycgl_jjfashsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">处理情况录入时间 从</td>
  <td><input type="text" name="crm_xmycgl_clqklrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_clqklrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">问题是否解决</td>
  <td><INPUT type="radio" name="crm_xmycgl_wtsfjj" value="Y">
    解决
      <INPUT type="radio" name="crm_xmycgl_wtsfjj" value="N">
      未解决 </td>
  <td align="right">处理情况录入人</td>
  <td><input type="text" name="crm_xmycgl_clqklrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工申请人</td>
  <td><input type="text" name="crm_xmycgl_tgsqr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工申请时间 从</td>
  <td><input type="text" name="crm_xmycgl_tgsqsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_tgsqsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工审核人</td>
  <td><input type="text" name="crm_xmycgl_tgshr" size="20" maxlength="20" ></td>
  <td align="right">停工审核结果</td>
  <td><INPUT type="radio" name="crm_xmycgl_tgshjg" value="Y">
    通过
      <INPUT type="radio" name="crm_xmycgl_tgshjg" value="N">
      未通过 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工审核时间 从</td>
  <td><input type="text" name="crm_xmycgl_tgshsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_tgshsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工原因</td>
  <td><select name="crm_xmycgl_tgyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm order by tgyybm","");
%>
  </select></td>
  <td align="right">停工录入人</td>
  <td><input type="text" name="crm_xmycgl_tglrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工录入时间 从</td>
  <td><input type="text" name="crm_xmycgl_tglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_tglrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">停工开始时间 从</td>
  <td><input type="text" name="crm_xmycgl_tgkssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_tgkssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">估计复工日期 从</td>
  <td><input type="text" name="crm_xmycgl_gjfgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_gjfgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">实际复工日期 从</td>
  <td><input type="text" name="crm_xmycgl_sjfgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_sjfgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">复工录入人</td>
  <td><input type="text" name="crm_xmycgl_fglrr" size="20" maxlength="20" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">复工录入时间 从</td>
  <td><input type="text" name="crm_xmycgl_fglrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_xmycgl_fglrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.qyrq2, "签约日期"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_xmycgl_cxwtsj, "出现问题时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_cxwtsj2, "出现问题时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_lrsj2, "录入时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.crm_xmycgl_jjfazdsj, "解决方案制订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_jjfazdsj2, "解决方案制订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_jjfashsj, "解决方案审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_jjfashsj2, "解决方案审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_clqklrsj, "处理情况录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_clqklrsj2, "处理情况录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgsqsj, "停工申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgsqsj2, "停工申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgshsj, "停工审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgshsj2, "停工审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgkssj, "停工开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tgkssj2, "停工开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_gjfgsj, "估计复工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_gjfgsj2, "估计复工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tglrsj, "停工录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_tglrsj2, "停工录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_sjfgsj, "实际复工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_sjfgsj2, "实际复工日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_fglrsj, "复工录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_xmycgl_fglrsj2, "复工录入时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
