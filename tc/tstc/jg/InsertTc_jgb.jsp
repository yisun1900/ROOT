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
<form method="post" action="SaveInsertTc_jgb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">����</td> 
  <td width="33%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="17%">���ۼ���</td> 
  <td width="33%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�ײ�����</td> 
  <td width="33%"> 
    <input type="text" name="tcmc" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="17%">ƽ�׵���</td> 
  <td width="33%"> 
    <input type="text" name="mjdj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��С���</td>
  <td><input type="text" name="zxmj" value="" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����޶���ɫ����</td>
  <td><input type="text" name="yssl" value="" size="20" maxlength="17" ></td>
  <td align="right">��ɫ��</td>
  <td><input type="text" name="tsf" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">ÿ����ԡ�۸�</td> 
  <td width="33%"><input type="text" name="wyjg" value="" size="20" maxlength="17" ></td>
  <td align="right" width="17%">ÿ�״�ש�۸� </td>
  <td width="33%"><input type="text" name="czjg" value="" size="20" maxlength="17" ></td>
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
	if(	javaTrim(FormName.tcmc)=="") {
		alert("������[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.mjdj)=="") {
		alert("������[ƽ�׵���]��");
		FormName.mjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.mjdj, "ƽ�׵���"))) {
		return false;
	}
	if(	javaTrim(FormName.zxmj)=="") {
		alert("������[��С���]��");
		FormName.zxmj.focus();
		return false;
	}
	if(!(isFloat(FormName.zxmj, "��С���"))) {
		return false;
	}

	if(	javaTrim(FormName.yssl)=="") {
		alert("������[�����޶���ɫ����]��");
		FormName.yssl.focus();
		return false;
	}
	if(!(isNumber(FormName.yssl, "�����޶���ɫ����"))) {
		return false;
	}
	if(	javaTrim(FormName.tsf)=="") {
		alert("������[��ɫ��]��");
		FormName.tsf.focus();
		return false;
	}
	if(!(isFloat(FormName.tsf, "��ɫ��"))) {
		return false;
	}
	
	if(	javaTrim(FormName.wyjg)=="") {
		alert("������[ÿ����ԡ�۸�]��");
		FormName.wyjg.focus();
		return false;
	}
	if(!(isFloat(FormName.wyjg, "ÿ����ԡ�۸�"))) {
		return false;
	}
	
	if(	javaTrim(FormName.czjg)=="") {
		alert("������[ÿ�״�ש�۸�]��");
		FormName.czjg.focus();
		return false;
	}
	if(!(isFloat(FormName.czjg, "ÿ�״�ש�۸�"))) {
		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
