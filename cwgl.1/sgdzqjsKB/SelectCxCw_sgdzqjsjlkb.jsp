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
<form method="post" action="Cw_sgdzqjsjlkbCxList.jsp" name="selectform">
<div align="center">���̲�����ܱ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����¼��</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsjlh" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ�����</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">���ݵ�ַ</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">���ʦ</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʩ����</td> 
  <td width="35%"> 
    <select name="cw_sgdzqjsjlkb_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd","");
%>
    </select>
  </td>
  <td align="right" width="15%">�ֳ�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_sgbz" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">����ʵ�տ�</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jskjs" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsbl" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_jsje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_sgdzqjsjlkb_lrsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="cw_sgdzqjsjlkb_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
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
	if(!(isDatetime(FormName.cw_sgdzqjsjlkb_jsrq, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjsjlkb_jskjs, "����ʵ�տ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjsjlkb_jsbl, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sgdzqjsjlkb_jsje, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sgdzqjsjlkb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>