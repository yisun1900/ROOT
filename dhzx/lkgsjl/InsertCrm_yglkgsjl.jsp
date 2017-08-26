<%@ page contentType="text/html;charset=GBK" %>
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
String ssfgs=(String)session.getAttribute("ssfgs");
String lrbm=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_yglkgsjl.jsp" name="insertform" target="_blank">
<div align="center">录入离开公司申请</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">员工编号</span></td> 
  <td width="32%"><input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>人员类型</td> 
  <td width="32%"><select name="rylx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rylx c1,rylx c2 from dm_rylx order by rylx","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">员工名称</span></td> 
  <td width="32%"> 
    <input type="text" name="yhmc" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">员工部门</span></td> 
  <td width="32%"> 
    <select name="ygbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计划离开日期</td> 
  <td width="32%"><input type="text" name="jhlkrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>离开公司目的</td> 
  <td width="32%"><select name="lkgsmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lkgsmd c1,lkgsmd c2 from dm_lkgsmd order by lkgsmd","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计划离开时间</td> 
  <td width="32%"> 
    <input type="text" name="jhlksj" value="" size="8" maxlength="9" >
    <strong>（录入小时） </strong></td>
  <td align="right" width="18%">计划返回时间</td> 
  <td width="32%"> 
    <input type="text" name="jhfhsj" value="" size="8" maxlength="9" >
    <strong>（录入小时） </strong> </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>离开公司说明</td>
  <td colspan="3"><textarea name="lkgssm" cols="72" rows="3"></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">所属分公司</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">备注</td>
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工编号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工编号"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("请输入[员工名称]！");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbm)=="") {
		alert("请选择[员工部门]！");
		FormName.ygbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rylx)=="") {
		alert("请选择[人员类型]！");
		FormName.rylx.focus();
		return false;
	}
	if(	javaTrim(FormName.jhlkrq)=="") {
		alert("请输入[计划离开日期]！");
		FormName.jhlkrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhlkrq, "计划离开日期"))) {
		return false;
	}
	if(	javaTrim(FormName.jhlksj)=="") {
		alert("请输入[计划离开时间]！");
		FormName.jhlksj.focus();
		return false;
	}
	if(!(isFloat(FormName.jhlksj, "计划离开时间"))) {
		return false;
	}
	if (FormName.jhlksj.value<0 || FormName.jhlksj.value>24)
	{
		alert("[计划离开时间]只能是0到24小时之间！");
		FormName.jhlksj.select();
		return false;
	}
	if(!(isFloat(FormName.jhfhsj, "计划返回时间"))) {
		return false;
	}
	if (FormName.jhfhsj.value<0 || FormName.jhfhsj.value>24)
	{
		alert("[计划返回时间]只能是0到24小时之间！");
		FormName.jhfhsj.select();
		return false;
	}
	if(	javaTrim(FormName.lkgsmd)=="") {
		alert("请选择[离开公司目的]！");
		FormName.lkgsmd.focus();
		return false;
	}
	if(	javaTrim(FormName.lkgssm)=="") {
		alert("请输入[离开公司说明]！");
		FormName.lkgssm.focus();
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.bc.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
