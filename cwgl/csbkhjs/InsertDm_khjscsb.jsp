<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_khjscsb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
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
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���������ۿ�</td>
  <td><input type="radio" name="sftzk"  value="1">
    ��
      <input type="radio" name="sftzk"  value="3">
      ��</td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ��н��㹤���Ż�</td>
  <td><input type="radio" name="sfyjsgcyh"  value="1">
�ֹ�¼��
  <input type="radio" name="sfyjsgcyh"  value="2">
�Զ���ȡ
<input type="radio" name="sfyjsgcyh"  value="3">
��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ��з�ȯ</td>
  <td><input type="radio" name="sfyfq"  value="1">
�ֹ�¼��
  <input type="radio" name="sfyfq"  value="2">
�Զ���ȡ
<input type="radio" name="sfyfq"  value="3">
�� </td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ��ж�����</td>
  <td><input type="radio" name="sfydjfx"  value="1">
�ֹ�¼��
  <input type="radio" name="sfydjfx"  value="2">
�Զ���ȡ
<input type="radio" name="sfydjfx"  value="3">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ��е���ȯ</td>
  <td><input type="radio" name="sfydyq"  value="1">
�ֹ�¼��
  <input type="radio" name="sfydyq"  value="2">
�Զ���ȡ
<input type="radio" name="sfydyq"  value="3">
�� </td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ������ķ���</td>
  <td><input type="radio" name="sfyzcfk"  value="1">
�ֹ�¼��
  <input type="radio" name="sfyzcfk"  value="2">
�Զ���ȡ
<input type="radio" name="sfyzcfk"  value="3">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����շ���Ŀ1</td>
  <td><select name="sfxmbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
  </select></td>
  <td align="right">�����շ���Ŀ2</td>
  <td><select name="sfxmbm2" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����շ���Ŀ3</td>
  <td><select name="sfxmbm3" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' order by sfxmmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д���Ʒ����</td> 
  <td width="32%"><input type="radio" name="sfydxpzc"  value="1">
�ֹ�¼��
  <input type="radio" name="sfydxpzc"  value="2">
�Զ���ȡ
<input type="radio" name="sfydxpzc"  value="3">
�� </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д���Ʒ�����Ż�</td> 
  <td width="32%"><input type="radio" name="sfydxpzcyh"  value="1">
�ֹ�¼��
  <input type="radio" name="sfydxpzcyh"  value="2">
�Զ���ȡ
<input type="radio" name="sfydxpzcyh"  value="3">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д�������</td> 
  <td width="32%"><input type="radio" name="sfydgzc"  value="1">
�ֹ�¼��
  <input type="radio" name="sfydgzc"  value="2">
�Զ���ȡ
<input type="radio" name="sfydgzc"  value="3">
�� </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��д��������Ż�</td> 
  <td width="32%"><input type="radio" name="sfydgzcyh"  value="1">
�ֹ�¼��
  <input type="radio" name="sfydgzcyh"  value="2">
�Զ���ȡ
<input type="radio" name="sfydgzcyh"  value="3">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��н��������Ż�</td> 
  <td width="32%"><input type="radio" name="sfyjszcyh"  value="1">
�ֹ�¼��
  <input type="radio" name="sfyjszcyh"  value="2">
�Զ���ȡ
<input type="radio" name="sfyjszcyh"  value="3">
�� </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��пͻ��⳥��</td> 
  <td width="32%"><input type="radio" name="sfykhpc"  value="1">
    �ֹ�¼��
      <input type="radio" name="sfykhpc"  value="2">
      �Զ���ȡ
      <input type="radio" name="sfykhpc"  value="3">
      �� </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���������1</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqtx1"  value="1">��
    <input type="radio" name="sfyqtx1"  value="3">��  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ������ڷ�</td> 
  <td width="32%"><input type="radio" name="sfyyqf"  value="1">
�ֹ�¼��
  <input type="radio" name="sfyyqf"  value="2">
�Զ���ȡ
<input type="radio" name="sfyyqf"  value="3">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������1����</td>
  <td colspan="3"><input type="text" name="qtx1mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���������2</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqtx2"  value="1">��
    <input type="radio" name="sfyqtx2"  value="3">��  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������2����</td>
  <td colspan="3"><input type="text" name="qtx2mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���������3</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqtx3"  value="1">��
    <input type="radio" name="sfyqtx3"  value="3">��  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������3����</td>
  <td colspan="3"><input type="text" name="qtx3mc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�������</td> 
  <td width="32%"> 
    <input type="radio" name="sfxsp"  value="1">��
    <input type="radio" name="sfxsp"  value="3">��  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ��������Ȩ</td> 
  <td width="32%"> 
    <input type="radio" name="sfxsq"  value="1">��
    <input type="radio" name="sfxsq"  value="3">��  </td>
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
<%
	cf.ajax(out);//����AJAX
%>


function changeFgs(FormName) 
{
	FormName.sfxmbm1.length=1;
	FormName.sfxmbm2.length=1;
	FormName.sfxmbm3.length=1;

	if (FormName.fgsbh.value=="")
	{
		return;
	}

	var sql;
	sql="select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm in(select dqbm from sq_dwxx where dwbh='"+FormName.fgsbh.value+"') order by sfxmmc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.sfxmbm1,ajaxRetStr);
	strToSelect(insertform.sfxmbm2,ajaxRetStr);
	strToSelect(insertform.sfxmbm3,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftzk)) {
		alert("��ѡ��[���������ۿ�]��");
		FormName.sftzk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjsgcyh)) {
		alert("��ѡ��[�Ƿ��н��㹤���Ż�]��");
		FormName.sfyjsgcyh[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyfq)) {
		alert("��ѡ��[�Ƿ��з�ȯ]��");
		FormName.sfyfq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydjfx)) {
		alert("��ѡ��[�Ƿ��ж�����]��");
		FormName.sfydjfx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydyq)) {
		alert("��ѡ��[�Ƿ��е���ȯ]��");
		FormName.sfydyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyzcfk)) {
		alert("��ѡ��[�Ƿ������ķ���]��");
		FormName.sfyzcfk[0].focus();
		return false;
	}



	if(	!radioChecked(FormName.sfydxpzc)) {
		alert("��ѡ��[�Ƿ��д���Ʒ����]��");
		FormName.sfydxpzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydxpzcyh)) {
		alert("��ѡ��[�Ƿ��д���Ʒ�����Ż�]��");
		FormName.sfydxpzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzc)) {
		alert("��ѡ��[�Ƿ��д�������]��");
		FormName.sfydgzc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfydgzcyh)) {
		alert("��ѡ��[�Ƿ��д��������Ż�]��");
		FormName.sfydgzcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyjszcyh)) {
		alert("��ѡ��[�Ƿ��н��������Ż�]��");
		FormName.sfyjszcyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfykhpc)) {
		alert("��ѡ��[�Ƿ��пͻ��⳥��]��");
		FormName.sfykhpc[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyyqf)) {
		alert("��ѡ��[�Ƿ������ڷ�]��");
		FormName.sfyyqf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqtx1)) {
		alert("��ѡ��[�Ƿ���������1]��");
		FormName.sfyqtx1[0].focus();
		return false;
	}
	if (FormName.sfyqtx1[0].checked)
	{
		if(	javaTrim(FormName.qtx1mc)=="") {
			alert("��ѡ��[������1����]��");
			FormName.qtx1mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx1mc.value="";
	}

	if(	!radioChecked(FormName.sfyqtx2)) {
		alert("��ѡ��[�Ƿ���������2]��");
		FormName.sfyqtx2[0].focus();
		return false;
	}
	if (FormName.sfyqtx2[0].checked)
	{
		if(	javaTrim(FormName.qtx2mc)=="") {
			alert("��ѡ��[������1����]��");
			FormName.qtx2mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx2mc.value="";
	}
	if(	!radioChecked(FormName.sfyqtx3)) {
		alert("��ѡ��[�Ƿ���������3]��");
		FormName.sfyqtx3[0].focus();
		return false;
	}
	if (FormName.sfyqtx3[0].checked)
	{
		if(	javaTrim(FormName.qtx3mc)=="") {
			alert("��ѡ��[������3����]��");
			FormName.qtx3mc.focus();
			return false;
		}
	}
	else{
		FormName.qtx3mc.value="";
	}
	if(	!radioChecked(FormName.sfxsp)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxsp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxsq)) {
		alert("��ѡ��[�Ƿ��������Ȩ]��");
		FormName.sfxsq[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
