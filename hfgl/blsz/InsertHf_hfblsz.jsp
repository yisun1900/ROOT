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
<form method="post" action="SaveInsertHf_hfblsz.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֹ�˾</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ط�����</td>
  <td colspan="3"><input type="radio" name="hflx"  value="1">
    �ɵ��ط�
      <input type="radio" name="hflx"  value="2">
      ��ʩ���ط�
      <input type="radio" name="hflx"  value="3">
      �깤�ط� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����ʼ��</td> 
  <td width="32%"> 
    <input type="text" name="khsksd" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">�ͻ���������</td> 
  <td width="32%"> 
    <input type="text" name="khsjzd" value="" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�طñ���</td> 
  <td width="32%"> 
    <input type="text" name="hfbl" value="" size="10" maxlength="9" >
    %  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	!radioChecked(FormName.hflx)) {
		alert("��ѡ��[�ط�����]��");
		FormName.hflx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.khsksd)=="") {
		alert("������[�ͻ�����ʼ��]��");
		FormName.khsksd.focus();
		return false;
	}
	if(!(isInt(FormName.khsksd, "�ͻ�����ʼ��"))) {
		return false;
	}
	if(	javaTrim(FormName.khsjzd)=="") {
		alert("������[�ͻ���������]��");
		FormName.khsjzd.focus();
		return false;
	}
	if(!(isInt(FormName.khsjzd, "�ͻ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.hfbl)=="") {
		alert("������[�طñ���]��");
		FormName.hfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.hfbl, "�طñ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
