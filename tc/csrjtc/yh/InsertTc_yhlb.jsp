<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_yhlb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">���ۼ���</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td colspan="3"> 
    <input type="text" name="lbmc" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ��ѡ</td>
  <td><input type="radio" name="sfbx"  value="1">
    ��ѡ
      <input type="radio" name="sfbx"  value="2">
      �Ǳ�ѡ </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����ǰ��</td> 
  <td width="32%"> 
    <input type="text" name="lbzqj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">����Żݼ�</td> 
  <td width="32%"> 
    <input type="text" name="lbyhj" value="" size="20" maxlength="17" >  </td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lbmc)=="") {
		alert("������[�������]��");
		FormName.lbmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbx)) {
		alert("��ѡ��[�Ƿ��ѡ]��");
		FormName.sfbx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lbzqj)=="") {
		alert("������[�����ǰ��]��");
		FormName.lbzqj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbzqj, "�����ǰ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lbyhj)=="") {
		alert("������[����Żݼ�]��");
		FormName.lbyhj.focus();
		return false;
	}
	if(!(isFloat(FormName.lbyhj, "����Żݼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
