<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_khxxCxList.jsp" name="insertform"  >
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">所属分公司</td> 
  <td width="31%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">计算提成起始时间</td> 
  <td width="31%"><input type="text" name="tcqssj" value="<%=cf.firstDay()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="19%">计算提成截至时间 </td>
  <td width="31%"><input type="text" name="tcjzsj" value="<%=cf.lastDay()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.tcqssj)=="") {
		alert("请输入[计算提成起始时间]！");
		FormName.tcqssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tcqssj, "计算提成起始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjzsj)=="") {
		alert("请输入[计算提成截至时间]！");
		FormName.tcjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tcjzsj, "计算提成截至时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
