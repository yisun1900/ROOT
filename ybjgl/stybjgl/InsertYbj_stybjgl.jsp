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
String dwbh=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertYbj_stybjgl.jsp" name="insertform" target="_blank">
<div align="center">实体样板间登记</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>样板间编号</td> 
  <td width="35%"> 
    <input type="text" name="ybjbh" value="" size="20" maxlength="20" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>所属分公司</td> 
  <td width="35%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>面积</td>
  <td><input type="text" name="mj" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>装修造价</td>
  <td><input type="text" name="zxzj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>风格描述</td> 
  <td colspan="3"> 
    <textarea name="fgms" cols="72" rows="6"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>类型</td> 
  <td width="35%"> 
    <input type="radio" name="lx"  value="1">样板间
    <input type="radio" name="lx"  value="2">独立隔间  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>状态</td> 
  <td width="35%"> 
    <input name="clzt" type="radio"  value="1" checked>在使用</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ","");
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ybjbh)=="") {
		alert("请输入[样板间编号]！");
		FormName.ybjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mj)=="") {
		alert("请输入[面积]！");
		FormName.mj.focus();
		return false;
	}
	if(!(isFloat(FormName.mj, "面积"))) {
		return false;
	}
	if(	javaTrim(FormName.fgms)=="") {
		alert("请输入[风格描述]！");
		FormName.fgms.focus();
		return false;
	}
	if(	javaTrim(FormName.zxzj)=="") {
		alert("请输入[装修造价]！");
		FormName.zxzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzj, "装修造价"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
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
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
