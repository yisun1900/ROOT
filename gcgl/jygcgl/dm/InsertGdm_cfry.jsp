<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertGdm_cfry.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Υ�漶�����</td> 
  <td width="35%"> 
	<select name="wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <option value=""></option>
	  <%
cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm","");
%> 
	</select>
  </td>
  <td align="right" width="15%">������Աְ��</td> 
  <td width="35%"> 
	<select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <option value=""></option>
	  <%
cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
	</select>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("������[Υ�漶�����]��");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("������[������Աְ��]��");
		FormName.xzzwbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
