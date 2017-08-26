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
	String zjxm=yhmc;
	if (!zwbm.equals("05"))
	{
		zjxm="";
	}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_yqdglXgShList.jsp" name="selectform">
<div align="center">
  <DIV align="center">审核－维护</DIV>
</div>
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
    <td align="right">合同号</td>
    <td><input type="text" name="hth" size="20" maxlength="20">    </td>
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20">    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" size="20" maxlength="20">    </td>
    <td align="right">工程担当</td>
   <td><input type="text" name="zjxm" size="20" maxlength="20"  value="<%=zjxm%>" <% if (!zjxm.equals("")) out.println("readonly");%>>    </td>
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
  <td align="right" width="18%">序号</td> 
  <td width="32%"> 
    <input type="text" name="crm_yqdgl_yqdbh" size="20" maxlength="10" >  </td>
  <td align="right" width="19%">处理状态</td> 
  <td width="31%">
	<INPUT type="radio" name="crm_yqdgl_clzt" value="2" checked>审批	</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">申请时间 从</td>
  <td><input type="text" name="crm_yqdgl_sqsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yqdgl_sqsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">工期增加天数 从</td>
  <td><input type="text" name="crm_yqdgl_zjts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yqdgl_zjts2" size="20" maxlength="8" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_yqdgl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yqdgl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">录入人</td> 
  <td width="32%"> 
    <input type="text" name="crm_yqdgl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核人</td>
  <td><input type="text" name="crm_yqdgl_shr" size="20" maxlength="20" ></td>
  <td align="right">审核结果</td>
  <td><%
	cf.radioToken(out, "crm_yqdgl_shjg","Y+通过&N+未通过","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核时间 从</td>
  <td><input type="text" name="crm_yqdgl_shsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yqdgl_shsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">审核增加天数 从</td>
  <td><input type="text" name="crm_yqdgl_shts" size="20" maxlength="8" ></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_yqdgl_shts2" size="20" maxlength="8" ></td>
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
	if(!(isDatetime(FormName.crm_yqdgl_sqsj, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yqdgl_sqsj2, "申请时间"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_yqdgl_zjts, "工期增加天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_yqdgl_zjts2, "工期增加天数"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yqdgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yqdgl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yqdgl_shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_yqdgl_shsj2, "审核时间"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_yqdgl_shts, "审核增加天数"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_yqdgl_shts2, "审核增加天数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
