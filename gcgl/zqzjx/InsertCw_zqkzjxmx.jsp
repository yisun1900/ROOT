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
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_zqkzjxmx.jsp" name="insertform" target="_blank">
<div align="center">中期款增减项明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span><span class="STYLE2">客户编号</span></td> 
  <td width="34%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="17%"><span class="STYLE1">*</span>增减项标志</td> 
  <td width="33%"><input type="radio" name="zjxbz"  value="1">
    增项
      <input type="radio" name="zjxbz"  value="2">
      减项 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>名称</td>
  <td colspan="3"><input type="text" name="mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%"><span class="STYLE1">*</span>金额</td> 
  <td width="34%"><input type="text" name="je" value="" size="20" maxlength="17" ></td>
  <td align="right" width="17%"><span class="STYLE1">*</span>陪同人</td> 
  <td width="33%"><input type="text" name="ptr" value="" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>材料商</td>
  <td colspan="3"><input type="text" name="cls" value="" size="73" maxlength="50" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.zjxbz)) {
		alert("请选择[增减项标志]！");
		FormName.zjxbz[0].focus();
		return false;
	}

	if(	javaTrim(FormName.mc)=="") {
		alert("请输入[名称]！");
		FormName.mc.focus();
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}
	if(	javaTrim(FormName.cls)=="") {
		alert("请输入[材料商]！");
		FormName.cls.focus();
		return false;
	}
	if(	javaTrim(FormName.ptr)=="") {
		alert("请输入[陪同人]！");
		FormName.ptr.focus();
		return false;
	}

	if (FormName.zjxbz[1].checked)
	{
		if(	javaTrim(FormName.bz)=="") {
			alert("请输入[备注]！");
			FormName.bz.focus();
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
