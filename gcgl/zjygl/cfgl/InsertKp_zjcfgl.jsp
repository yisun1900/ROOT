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
<form method="post" action="SaveInsertKp_zjcfgl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������¼��</td> 
  <td width="35%"> 
    <input type="text" name="cfjlh" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">���̵���</td> 
  <td width="35%"> 
    <input type="text" name="zjxm" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="cfr" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cfsj" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="cflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cflxbm,cflxmc from kp_cflxbm order by cflxbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ԭ��</td> 
  <td width="35%"> 
    <select name="cfyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cfyybm,cfyymc from kp_cfyybm order by cfyybm","");
%>
    </select>
  </td>
  <td align="right" width="15%">�����ܶ�</td> 
  <td width="35%"> 
    <input type="text" name="fkze" value="" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�۷�</td> 
  <td width="35%"> 
    <input type="text" name="kf" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼�뵥λ</td> 
  <td width="35%"> 
    <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="3"></textarea>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(	javaTrim(FormName.cfjlh)=="") {
		alert("������[������¼��]��");
		FormName.cfjlh.focus();
		return false;
	}
	if(!(isNumber(FormName.cfjlh, "������¼��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("������[���̵���]��");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cfr)=="") {
		alert("������[������]��");
		FormName.cfr.focus();
		return false;
	}
	if(	javaTrim(FormName.cfsj)=="") {
		alert("������[����ʱ��]��");
		FormName.cfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cfsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cflxbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.cflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cfyybm)=="") {
		alert("��ѡ��[����ԭ��]��");
		FormName.cfyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.fkze)=="") {
		alert("������[�����ܶ�]��");
		FormName.fkze.focus();
		return false;
	}
	if(!(isFloat(FormName.fkze, "�����ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kf)=="") {
		alert("������[�۷�]��");
		FormName.kf.focus();
		return false;
	}
	if(!(isNumber(FormName.kf, "�۷�"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrdw)=="") {
		alert("��ѡ��[¼�뵥λ]��");
		FormName.lrdw.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
