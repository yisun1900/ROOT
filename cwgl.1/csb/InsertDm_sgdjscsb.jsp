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
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_sgdjscsb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%> 
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%">
  <select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">��һ��</option>
    <option value="2">�ڶ���</option>
    <option value="3">������</option>
    <option value="4">���Ĵ�</option>
    <option value="5">�����</option>
    <option value="6">������</option>
    <option value="7">���ߴ�</option>
    <option value="8">�ڰ˴�</option>
    <option value="9">�ھŴ�</option>
    <option value="10">��ʮ��</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td> 
    <input type="radio" name="bfjs"  value="1">���̷�
	<BR>
    <input type="radio" name="bfjs"  value="2">���̷ѣ�������
	<BR>
    <input type="radio" name="bfjs"  value="3">ʵ�տ��ܶ�
	<BR>
    <input type="radio" name="bfjs"  value="4">һ�ڿ�
	<BR>
    <input type="radio" name="bfjs"  value="5">���ڿ�
	<BR>
    <input type="radio" name="bfjs"  value="6">���ڿ�
	<BR>
    <input type="radio" name="bfjs"  value="7">���̻�������
	<BR>
    <input type="radio" name="bfjs"  value="8">���̻������ۣ������ѻ�������
	<BR>
    <input type="radio" name="bfjs"  value="9">����ʩ���ɱ���
	<BR>
    <input type="radio" name="bfjs"  value="A">����ʩ���ɱ��ۣ�������ʩ���ɱ�
	<BR>
    <input type="radio" name="bfjs"  value="B">���̳ɱ���  
	<BR>
    <input type="radio" name="bfjs"  value="C">���̳ɱ��ۣ������ѳɱ�	</td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="bfbl" value="" size="10" maxlength="9" >
% </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ˮ��·���㷽ʽ</td>
  <td>
	<input type="radio" name="sdljsfs"  value="1">ͳһ��������
	<BR>
	<input type="radio" name="sdljsfs"  value="2">������������
	<BR>
	<input type="radio" name="sdljsfs"  value="3">�ֹ�¼�������
	<BR>
	<input type="radio" name="sdljsfs"  value="9">������  </td>
  <td align="right">ˮ��·��������</td>
  <td><input type="text" name="sdlbfbl" value="" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���ʱ���</td> 
  <td width="32%">
	<input type="radio" name="sfkzbj"  value="Y">���ʱ���������ɸ�
	<BR>
	<input type="radio" name="sfkzbj"  value="M">���ʱ�������ɸ�
	<BR>
	<input type="radio" name="sfkzbj"  value="N">�����ʱ���  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ������</td>
  <td><input type="radio" name="kzbjjs"  value="1">
    �������
      <input type="radio" name="kzbjjs"  value="2">
      �����ܶ� </td>
  <td align="right">���ʱ������</td>
  <td><input type="text" name="kzbjbl" value="" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td> 
  <td width="32%"> 
    <input type="radio" name="sfkclk"  value="Y">��
    <input type="radio" name="sfkclk"  value="N">��  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۹�����Ʒ</td> 
  <td width="32%"> 
    <input type="radio" name="sfkgdyp"  value="Y">��
    <input type="radio" name="sfkgdyp"  value="N">��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѹ�����</td>
  <td><input type="radio" name="sfkyfgf"  value="Y">
    ��
      <input type="radio" name="sfkyfgf"  value="N">
      �� </td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ���ʩ���Ӽ������</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��깤����</td> 
  <td width="32%"><input type="radio" name="sfwgjs"  value="Y">
��
  <input type="radio" name="sfwgjs"  value="N">
�� </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�������</td> 
  <td width="32%"><input type="radio" name="sfhzjx"  value="Y">
    ��
      <input type="radio" name="sfhzjx"  value="N">
      �� </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="button3" type="button" onClick="f_lr(insertform)"  value="����������">
    <input name="button" type="button" onClick="f_lr(insertform)"  value="���ʱ������">
    <input name="button" type="button" onClick="f_jbtz(insertform)"  value="ʩ���Ӽ�����������">
    <input name="button2" type="button" onClick="f_zbjtz(insertform)"  value="�ʱ�����������">
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
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.bfjs)) {
		alert("��ѡ��[��������]��");
		FormName.bfjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}

	if(	!radioChecked(FormName.sdljsfs)) {
		alert("��ѡ��[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs[0].focus();
		return false;
	}
	if (FormName.sdljsfs[1].checked)
	{
		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("������[ˮ��·��������]��");
			FormName.sdlbfbl.focus();
			return false;
		}
	}
	if(!(isFloat(FormName.sdlbfbl, "ˮ��·��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfwgjs)) {
		alert("��ѡ��[�Ƿ��깤����]��");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclk)) {
		alert("��ѡ��[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkgdyp)) {
		alert("��ѡ��[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyfgf)) {
		alert("��ѡ��[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzbj)) {
		alert("��ѡ��[�Ƿ���ʱ���]��");
		FormName.sfkzbj[0].focus();
		return false;
	}
	if (FormName.sfkzbj[0].checked || FormName.sfkzbj[1].checked)
	{
		if(	!radioChecked(FormName.kzbjjs)) {
			alert("��ѡ��[���ʱ������]��");
			FormName.kzbjjs[0].focus();
			return false;
		}
		if(	javaTrim(FormName.kzbjbl)=="") {
			alert("������[���ʱ������]��");
			FormName.kzbjbl.focus();
			return false;
		}
		if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("��ѡ��[�Ƿ���ʩ���Ӽ������]��");
		FormName.sgdjbxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhzjx)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfhzjx[0].focus();
		return false;
	}

	FormName.action="SaveInsertDm_sgdjscsb.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_kzbjbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_jbtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_jbtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_zbjtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_zbjtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
