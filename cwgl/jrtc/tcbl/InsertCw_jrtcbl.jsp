<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jrtcbl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">�ֹ�˾</td> 
  <td width="28%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�곤��Ʒ���ɱ���</td>
  <td><input type="text" name="dzsjftcbl" value="" size="10" maxlength="17" >
% </td>
  <td align="right">�곤װ�޷���ɱ���</td>
  <td><input type="text" name="dzzxftcbl" value="" size="10" maxlength="17" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��Աװ�޷���ɱ���</td> 
  <td width="28%"><input type="text" name="wyzxftcbl" value="" size="10" maxlength="17" >
% </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">ҵ��Ա��Ʒ���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="khjlsjftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">ҵ��Աװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="khjlzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">���ʦ��Ʒ���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjssjftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">���ʦװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjszxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">���ʦԶ�̷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjsycftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">&nbsp;</td> 
  <td width="28%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ�����װ�޷���ɱ���</td>
  <td><input type="text" name="zjzxftcbl" value="" size="10" maxlength="17" >
%</td>
  <td align="right">�ͻ�����Զ�̷���ɱ���</td>
  <td><input type="text" name="zjycftcbl" value="" size="10" maxlength="17" >
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">����Աװ�޷���ɱ���</td> 
  <td width="28%"><input type="text" name="clyzxftcbl" value="" size="10" maxlength="17" >
% </td>
  <td align="right" width="22%">С������װ�޷���ɱ���</td> 
  <td width="28%"><input type="text" name="xqzgzxftcbl" value="" size="10" maxlength="17" >
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">С���鳤װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="xqzzzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">С��רԱװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="xqzyzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">����Ӫ������װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wlyxzgzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">Ӫ��רԱװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="yxzyzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��վ�߻�װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wzchzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">��ҳ���װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wysjzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��վ����Աװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wzcxyzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">�绰רԱװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="dhzyzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">��վ�ƹ�Աװ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="wztgyzxftcbl" value="" size="10" maxlength="17" > %  </td>
  <td align="right" width="22%">˾��װ�޷���ɱ���</td> 
  <td width="28%"> 
    <input type="text" name="sjzxftcbl" value="" size="10" maxlength="17" > %  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">¼����</td> 
  <td width="28%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" ></td>
  <td align="right" width="22%">¼��ʱ�� </td>
  <td width="28%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dzsjftcbl)=="") {
		alert("������[�곤��Ʒ���ɱ���]��");
		FormName.dzsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzsjftcbl, "�곤��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dzzxftcbl)=="") {
		alert("������[�곤װ�޷���ɱ���]��");
		FormName.dzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dzzxftcbl, "�곤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wyzxftcbl)=="") {
		alert("������[��Աװ�޷���ɱ���]��");
		FormName.wyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wyzxftcbl, "��Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlsjftcbl)=="") {
		alert("������[ҵ��Ա��Ʒ���ɱ���]��");
		FormName.khjlsjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlsjftcbl, "ҵ��Ա��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.khjlzxftcbl)=="") {
		alert("������[ҵ��Աװ�޷���ɱ���]��");
		FormName.khjlzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.khjlzxftcbl, "ҵ��Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjssjftcbl)=="") {
		alert("������[���ʦ��Ʒ���ɱ���]��");
		FormName.sjssjftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjssjftcbl, "���ʦ��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjszxftcbl)=="") {
		alert("������[���ʦװ�޷���ɱ���]��");
		FormName.sjszxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjszxftcbl, "���ʦװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsycftcbl)=="") {
		alert("������[���ʦԶ�̷���ɱ���]��");
		FormName.sjsycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsycftcbl, "���ʦԶ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjzxftcbl)=="") {
		alert("������[�ͻ�����װ�޷���ɱ���]��");
		FormName.zjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjzxftcbl, "�ͻ�����װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjycftcbl)=="") {
		alert("������[�ͻ�����Զ�̷���ɱ���]��");
		FormName.zjycftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycftcbl, "�ͻ�����Զ�̷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzgzxftcbl)=="") {
		alert("������[С������װ�޷���ɱ���]��");
		FormName.xqzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzgzxftcbl, "С������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzzzxftcbl)=="") {
		alert("������[С���鳤װ�޷���ɱ���]��");
		FormName.xqzzzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzzzxftcbl, "С���鳤װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.xqzyzxftcbl)=="") {
		alert("������[С��רԱװ�޷���ɱ���]��");
		FormName.xqzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.xqzyzxftcbl, "С��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wlyxzgzxftcbl)=="") {
		alert("������[����Ӫ������װ�޷���ɱ���]��");
		FormName.wlyxzgzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wlyxzgzxftcbl, "����Ӫ������װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.yxzyzxftcbl)=="") {
		alert("������[Ӫ��רԱװ�޷���ɱ���]��");
		FormName.yxzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.yxzyzxftcbl, "Ӫ��רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzchzxftcbl)=="") {
		alert("������[��վ�߻�װ�޷���ɱ���]��");
		FormName.wzchzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzchzxftcbl, "��վ�߻�װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wysjzxftcbl)=="") {
		alert("������[��ҳ���װ�޷���ɱ���]��");
		FormName.wysjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wysjzxftcbl, "��ҳ���װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wzcxyzxftcbl)=="") {
		alert("������[��վ����Աװ�޷���ɱ���]��");
		FormName.wzcxyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wzcxyzxftcbl, "��վ����Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.dhzyzxftcbl)=="") {
		alert("������[�绰רԱװ�޷���ɱ���]��");
		FormName.dhzyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.dhzyzxftcbl, "�绰רԱװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.wztgyzxftcbl)=="") {
		alert("������[��վ�ƹ�Աװ�޷���ɱ���]��");
		FormName.wztgyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.wztgyzxftcbl, "��վ�ƹ�Աװ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzxftcbl)=="") {
		alert("������[˾��װ�޷���ɱ���]��");
		FormName.sjzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzxftcbl, "˾��װ�޷���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.clyzxftcbl)=="") {
		alert("������[����Աװ�޷���ɱ���]��");
		FormName.clyzxftcbl.focus();
		return false;
	}
	if(!(isFloat(FormName.clyzxftcbl, "����Աװ�޷���ɱ���"))) {
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
