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
String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");
String kfgssq=(String)session.getAttribute("kfgssq");
String sjs=yhmc;
if (!zwbm.equals("04"))
{
	sjs="";
}
String ywy=yhmc;
if (!zwbm.equals("19"))
{
	ywy="";
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_fdkhhfXgXxrList.jsp" name="selectform">
<div align="center">信息人回访－修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right">所属分公司</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
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
    <td align="right">咨询店面</td>
    <td><select name="zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <td align="right">客户编号</td>
    <td><input type="text" name="khbh" size="20" maxlength="20" >    </td>
    <td align="right">客户姓名</td>
    <td><input type="text" name="khxm" size="20" maxlength="50" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">房屋地址</td>
    <td colspan="3"><input type="text" name="fwdz" size="73" maxlength="100" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">业务员</td>
    <td><input type="text" name="ywy" value="<%=ywy%>" size="20" maxlength="100" <% if (!ywy.equals("")) out.println("readonly");%>>    </td>
    <td align="right">设计师</td>
    <td><input type="text" name="sjs" value="<%=sjs%>" size="20" maxlength="100" <% if (!sjs.equals("")) out.println("readonly");%>>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">回访记录号</td> 
  <td width="31%"> 
    <input type="text" name="crm_fdkhhf_hfjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">回访人</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_hfr" size="20" maxlength="20" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">回访时间 从</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_hfsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">到</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_hfsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">回访飞单原因</td> 
  <td width="31%"> 
    <select name="crm_fdkhhf_hfsbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
%>
    </select>  </td>
  <td align="right" width="19%">回访飞单客户流向</td> 
  <td width="31%"> 
    <select name="crm_fdkhhf_hfsbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"'","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">回访飞单时间</td> 
  <td width="31%"> 
    <input type="text" name="crm_fdkhhf_hfsbsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="19%">录入人</td> 
  <td width="31%"><input type="text" name="crm_fdkhhf_lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">类型</td> 
  <td colspan="3"><%
	cf.radioToken(out, "crm_fdkhhf_lx","1+飞单回访&2+随机回访&3+信息人回访","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间 从</td>
  <td><input type="text" name="crm_fdkhhf_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="crm_fdkhhf_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">录入部门</td> 
  <td width="31%"> 
    <select name="crm_fdkhhf_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;  </td>
  <td width="31%">&nbsp;  </td>
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
	FormName.zxdm.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	var sql;
	if ("<%=kfgssq%>"=="1" || "<%=kfgssq%>"=="2")//1：授权单个分公司;2：授权多个分公司
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";
	}
	else{
		sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' and dwbh in(select dwbh from sq_sqbm where ygbh='<%=ygbh%>') order by cxbz,dwbh";
	}

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.zxdm,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.crm_fdkhhf_hfsj, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_hfsj2, "回访时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_hfsbsj, "回访飞单时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_fdkhhf_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
