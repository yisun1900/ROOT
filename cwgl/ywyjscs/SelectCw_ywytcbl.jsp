<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_ywytcblList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="cw_ywytcbl_xh" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">�ֶ�����</td> 
  <td width="35%"> 
    <input type="text" name="cw_ywytcbl_fdmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��㣨>��</td> 
  <td width="35%"> 
    <input type="text" name="cw_ywytcbl_qd" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�յ㣨<=��</td> 
  <td width="35%"> 
    <input type="text" name="cw_ywytcbl_zd" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ɰٷֱ�</td> 
  <td width="35%"> 
    <input type="text" name="cw_ywytcbl_tcbfb" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">ǩ������</td> 
  <td width="35%"> 
    <select name="cw_ywytcbl_qdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+��װ&3+��װ","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
    <select name="cw_ywytcbl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>
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
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
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
	if(!(isNumber(FormName.cw_ywytcbl_xh, "���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_ywytcbl_qd, "��㣨>��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_ywytcbl_zd, "�յ㣨<=��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_ywytcbl_tcbfb, "��ɰٷֱ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
