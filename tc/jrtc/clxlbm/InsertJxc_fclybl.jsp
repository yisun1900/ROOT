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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">�������ñ�����¼��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����С�����</td> 
  <td width="32%"> 
    <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by cldlmc,clxlmc","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��׼�����ñ���</td> 
  <td width="32%"> 
    <input type="text" name="bzlybl" value="" size="14" maxlength="9" >
    �ٷֱ�</td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���ñ���������</td> 
  <td width="32%"><input type="text" name="lyblxx" value="" size="14" maxlength="9" >
�ٷֱ�</td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���ñ��������� </td>
  <td width="32%"><input type="text" name="lyblsx" value="" size="14" maxlength="9" >
�ٷֱ�</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="button" type="button" onClick="f_dr(insertform)"  value="����">
	<input type="reset"  value="����" name="reset"> 
	
	<BR><BR> 
	<A HREF="�������ñ���.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>
	
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("��ѡ��[����С�����]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.clxlbm, "����С�����"))) {
		return false;
	}
	if(	javaTrim(FormName.bzlybl)=="") {
		alert("������[��׼���ñ���]��");
		FormName.bzlybl.focus();
		return false;
	}
	if(!(isFloat(FormName.bzlybl, "��׼���ñ���"))) {
		return false;
	}
	if(	javaTrim(FormName.lyblxx)=="") {
		alert("������[���ñ�������]��");
		FormName.lyblxx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblxx, "���ñ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.lyblsx)=="") {
		alert("������[���ñ�������]��");
		FormName.lyblsx.focus();
		return false;
	}
	if(!(isFloat(FormName.lyblsx, "���ñ�������"))) {
		return false;
	}

	FormName.action="SaveInsertJxc_fclybl.jsp";
	FormName.submit();
	return true;
}


function f_dr(FormName)//����FormName:Form������
{
	FormName.action="LoadData.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
