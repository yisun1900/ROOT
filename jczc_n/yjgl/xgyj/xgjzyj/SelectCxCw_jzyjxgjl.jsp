<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jzyjxgjlCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_khbh" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">���ʦ</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�޸�ʱ��</td> 
  <td width="35%"> 
  ��<input type="text" name="cw_jzyjxgjl_xgsj" size="20" maxlength="10" >
  <BR>��<input type="text" name="cw_jzyjxgjl_xgsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">�޸���</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xgr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ�����</td> 
  <td width="35%"> 
    <select name="cw_jzyjxgjl_zt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"2+��װ�ͻ�&3+�˵��ͻ�&4+���ɿͻ�&5+��ƿͻ�","");
%>
    </select>
  </td>
  <td align="right" width="15%">��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_hth" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ�����</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_khxm" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">�޸�����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_jzyjxgjl_xglx","1+�޸�&2+ɾ��&3+����","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ԭҵ����תʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_yjzrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">ԭ��ͬԭ����</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_ywdzgce" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ԭ����ǩԼ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_yqye" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�޸ĺ�ҵ����תʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xjzrq" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�޸ĺ��ͬԭ����</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xwdzgce" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�޸ĺ󹤳�ǩԼ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzyjxgjl_xqye" size="20" maxlength="17" >
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
	if(!(isDatetime(FormName.cw_jzyjxgjl_xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzyjxgjl_xgsj2, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzyjxgjl_yjzrq, "ԭҵ����תʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_ywdzgce, "ԭ��ͬԭ����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_yqye, "ԭ����ǩԼ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jzyjxgjl_xjzrq, "�޸ĺ�ҵ����תʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_xwdzgce, "�޸ĺ��ͬԭ����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_jzyjxgjl_xqye, "�޸ĺ󹤳�ǩԼ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
