<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Ybj_stybjglCxList.jsp" name="selectform">
<div align="center">实体样板间查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">样板间编号</td> 
  <td width="35%"> 
    <input type="text" name="ybj_stybjgl_ybjbh" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"><select name="ybj_stybjgl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">类型</td> 
  <td width="35%"><%
	cf.radioToken(out, "ybj_stybjgl_lx","1+样板间&2+独立隔间","");
%></td>
  <td align="right" width="15%">状态</td> 
  <td width="35%"><%
	cf.radioToken(out, "ybj_stybjgl_clzt","1+在使用&2+作废","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入人</td>
  <td><input type="text" name="ybj_stybjgl_lrr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"><input type="text" name="ybj_stybjgl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="ybj_stybjgl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.ybj_stybjgl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_stybjgl_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
