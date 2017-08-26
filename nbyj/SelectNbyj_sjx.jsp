<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yjygbh=(String)session.getAttribute("ygbh");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Nbyj_sjxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">邮件编号</td> 
  <td width="35%"> 
    <input type="text" name="yjbh" size="20" maxlength="8" > 
	<input type="hidden" name="yjygbh" value="<%=yjygbh%>"> 
</td>
  <td align="right" width="15%">发件人</td> 
  <td width="35%">
  <select name="fjr" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
 <%
	cf.selectItem(out,"select ygbh,yhmc||'（'||dwmc||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N') order by yhmc","");
%>
  </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">邮件主题</td> 
  <td colspan="3"><input type="text" name="yjzt" size="60" maxlength="200" >（模糊）</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">发送时间 从</td> 
  <td width="35%"> 
    <input type="text" name="fssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="fssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">邮件类型</td>
  <td>
  <input type="radio" name="yjlx" value="J" >
紧急
  <input type="radio" name="yjlx" value="P" >
普通</td>
  <td align="right">是否已读</td>
  <td>
  <input type="radio" name="sfyd" value="Y" >
已读
  <input type="radio" name="sfyd" value="N" >
未读</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">附件原名</td> 
  <td width="35%"><input type="text" name="fjym" size="20" maxlength="200" ></td>
  <td align="right" width="15%">附件名称</td> 
  <td width="35%"> 
    <input type="text" name="fjmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">邮件内容</td> 
  <td colspan="3"><input type="text" name="yjnr" size="60" maxlength="2000" >（模糊）</td>
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
	if(!(isNumber(FormName.fjr, "发件人"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj, "发送时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj2, "发送时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
