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
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">¼�룭�Զ�������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�������</td>
  <td><select name="rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm","");
%>
  </select></td>
  <td align="right"><span class="STYLE2">*</span>�������(4λ)</td>
  <td><input type="text" name="rwbm" value="" size="20" maxlength="4" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>��������</td> 
  <td colspan="3"><input type="text" name="rwmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ժҪ����</td>
  <td colspan="3">
  <select name="zyrwbm" style="FONT-SIZE:12PX;WIDTH:524PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�蹤��ͣ��</td>
  <td><input type="radio" name="xgytg"  value="Y">
    ��
    <input type="radio" name="xgytg"  value="N">
    �� </td>
  <td rowspan="4" align="right">�漰��Ʒ����</td>
  <td rowspan="4"><select name="cpflbm" size="7" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm order by cpflbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ͣ������</td>
  <td><input type="text" name="gytgts" value="" size="20" maxlength="8" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ��漰��Ʒ��Ϣ</td>
  <td><input type="radio" name="sjcpxx"  value="Y">
    ��
    <input type="radio" name="sjcpxx"  value="N">
    �� </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>��������</td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from dm_bjjbbm order by bjjbbm","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�������</td>
  <td colspan="3"><input type="radio" name="bjlb"  value="1">
    ��ǰ����
      <input type="radio" name="bjlb"  value="2">
      �º�����
      <input type="radio" name="bjlb"  value="3">
      ��ǰ�º�����
      <input type="radio" name="bjlb"  value="9">
      һ���¼ </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ǰ��������</td> 
  <td width="33%"> 
    <input type="text" name="sqtxts" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="17%">�º���������</td> 
  <td width="33%"><input type="text" name="shtxts" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ǰ��������</td> 
  <td colspan="3"><textarea name="sqtxnr" cols="72" rows="2"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�º���������</td>
  <td colspan="3"><textarea name="shtxnr" cols="72" rows="2"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>�Ƿ�Ϊ��̱�</td>
  <td><input type="radio" name="sfwlcb"  value="Y">
��
  <input type="radio" name="sfwlcb"  value="N">
�� </td>
  <td align="right"><span class="STYLE2">*</span>�������</td>
  <td><input name="rwxh" type="text" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>�Ƿ�Ӱ���������</td> 
  <td width="33%"><input type="radio" name="sfyxhxgq"  value="Y">
    ��
      <input type="radio" name="sfyxhxgq"  value="N">
      �� </td>
  <td align="right" width="17%"><span class="STYLE2">*</span>�Ƿ�Ӱ�츴��</td> 
  <td width="33%"><input type="radio" name="sfyxfc"  value="Y">
    ��
      <input type="radio" name="sfyxfc"  value="N">
      �� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>�Ƿ�������</td> 
  <td width="33%"><input type="radio" name="sfxys"  value="Y">
    ��
      <input type="radio" name="sfxys"  value="N">
      �� </td>
  <td align="right" width="17%"><span class="STYLE2">*</span>�ص�������</td> 
  <td width="33%"><input type="radio" name="zdjkrw"  value="1">
    �ص���
      <input type="radio" name="zdjkrw"  value="2">
      ���ص��� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע����</td>
  <td colspan="3"><textarea name="gznr" cols="72" rows="5"></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">����ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="2"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="button" onClick="f_do1(insertform)"  value="�����߼���ϵ" name="ljgx" disabled>
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
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("������[�������]��");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwmc)=="") {
		alert("������[��������]��");
		FormName.rwmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.xgytg)) {
		alert("��ѡ��[�蹤��ͣ��]��");
		FormName.xgytg[0].focus();
		return false;
	}
	if(!(isNumber(FormName.gytgts, "����ͣ������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sjcpxx)) {
		alert("��ѡ��[�Ƿ��漰��Ʒ��Ϣ]��");
		FormName.sjcpxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjlb)) {
		alert("��ѡ��[�������]��");
		FormName.bjlb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjlb)) {
		alert("��ѡ��[�������]��");
		FormName.bjlb[0].focus();
		return false;
	}
	if(!(isNumber(FormName.sqtxts, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.shtxts, "�º���������"))) {
		return false;
	}
	if (FormName.bjlb[0].checked )
	{
		if(	javaTrim(FormName.sqtxts)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxts)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxts.select();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxnr.select();
			return false;
		}
	}
	else if (FormName.bjlb[1].checked )
	{
		if(	javaTrim(FormName.shtxts)=="") {
			alert("������[�º���������]��");
			FormName.shtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)=="") {
			alert("������[�º���������]��");
			FormName.shtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxts)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxts.select();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxnr.select();
			return false;
		}
	}
	else if ( FormName.bjlb[2].checked)
	{
		if(	javaTrim(FormName.sqtxts)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)=="") {
			alert("������[��ǰ��������]��");
			FormName.sqtxnr.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxts)=="") {
			alert("������[�º���������]��");
			FormName.shtxts.focus();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)=="") {
			alert("������[�º���������]��");
			FormName.shtxnr.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.sqtxts)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxts.select();
			return false;
		}
		if(	javaTrim(FormName.sqtxnr)!="") {
			alert("[��ǰ��������]ӦΪ�գ�");
			FormName.sqtxnr.select();
			return false;
		}
		if(	javaTrim(FormName.shtxts)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxts.select();
			return false;
		}
		if(	javaTrim(FormName.shtxnr)!="") {
			alert("[�º���������]ӦΪ�գ�");
			FormName.shtxnr.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfwlcb)) {
		alert("��ѡ��[�Ƿ�Ϊ��̱�]��");
		FormName.sfwlcb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("������[�������]��");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isFloat(FormName.rwxh, "�������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyxhxgq)) {
		alert("��ѡ��[�Ƿ�Ӱ���������]��");
		FormName.sfyxhxgq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxfc)) {
		alert("��ѡ��[�Ƿ�Ӱ�츴��]��");
		FormName.sfyxfc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxys)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxys[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdjkrw)) {
		alert("��ѡ��[�ص�������]��");
		FormName.zdjkrw[0].focus();
		return false;
	}

	FormName.action="SaveInsertDm_bzrwbm.jsp";
	FormName.submit();
	FormName.ljgx.disabled=false;
	return true;
}

function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rwbm)=="") {
		alert("������[�������]��");
		FormName.rwbm.focus();
		return false;
	}

	FormName.action="InsertDm_bzrwljgx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
