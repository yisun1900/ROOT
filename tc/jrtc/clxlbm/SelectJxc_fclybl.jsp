<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�������ñ�����ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ֹ�˾</td> 
  <td width="32%"> 
    <select name="jxc_fclybl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����С��</td> 
  <td width="32%"><select name="jxc_fclybl_clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by cldlmc,clxlmc","");
%>
  </select></td>
  <td align="right" width="18%">����С��</td> 
  <td width="32%"><input type="text" name="jxc_fclybl_clxlmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��׼���ñ��� ��</td>
  <td><input type="text" name="jxc_fclybl_bzlybl" size="14" maxlength="9" >
    �ٷֱ�</td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_fclybl_bzlybl2" size="14" maxlength="9" >
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ñ������� ��</td>
  <td><input type="text" name="jxc_fclybl_lyblxx" size="14" maxlength="9" >
    �ٷֱ�</td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_fclybl_lyblxx2" size="14" maxlength="9" >
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ñ������� ��</td> 
  <td width="32%"><input type="text" name="jxc_fclybl_lyblsx" size="14" maxlength="9" >
    �ٷֱ�</td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jxc_fclybl_lyblsx2" size="14" maxlength="9" >
    �ٷֱ� </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input name="button" type="button" onClick="f_dc(selectform)"  value="����">
    <input type="reset"  value="����">  </td>
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
	if(!(isNumber(FormName.jxc_fclybl_clxlbm, "����С�����"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_bzlybl, "��׼���ñ���"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_bzlybl2, "��׼���ñ���"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblxx, "���ñ�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblxx2, "���ñ�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblsx, "���ñ�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblsx2, "���ñ�������"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jxc_fclyblList.jsp";
	FormName.submit();
	return true;
}
function f_dc(FormName)//����FormName:Form������
{

	FormName.target="_blank";
	FormName.action="Jxc_fclyblExpList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
