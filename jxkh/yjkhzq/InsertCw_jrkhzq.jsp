<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrkhzq.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="khzq" value="" size="20" maxlength="6" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������ʼʱ��</td> 
  <td width="32%"> 
    <input type="text" name="khqssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���˽���ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="khjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ȫ������</td>
  <td><input type="text" name="qqts" value="" size="20" maxlength="10"  ></td>
  <td align="right">�Ƿ�۱���</td>
  <td><label>
    <input type="radio" name="radiobutton" value="radiobutton">
�۱���
<input type="radio" name="radiobutton" value="radiobutton">
���۱���</label></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("������[��������]��");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khqssj)=="") {
		alert("������[������ʼʱ��]��");
		FormName.khqssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khqssj, "������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.khjzsj)=="") {
		alert("������[���˽���ʱ��]��");
		FormName.khjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khjzsj, "���˽���ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.qqts)=="") {
		alert("������[ȫ������]��");
		FormName.qqts.focus();
		return false;
	}
	if(!(isFloat(FormName.qqts, "ȫ������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
