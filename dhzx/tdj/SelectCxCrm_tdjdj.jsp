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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_tdjdjCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˶������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_tdjxh" size="20" maxlength="9" >
  </td>
  <td width="15%"> 
    <div align="right">�ͻ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ͻ�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_khxm" size="20" maxlength="20" >
  </td>
  <td width="15%"> 
    <div align="right">���ݵ�ַ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_fwdz" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�绰</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_dh" size="20" maxlength="100" >
  </td>
  <td width="15%"> 
    <div align="right">���ʦ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_sjs" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�˶���ԭ��</div>
  </td>
  <td width="35%"> 
    <select name="crm_tdjdj_tdjyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select tdjyybm,tdjyymc from dm_tdjyybm order by tdjyybm","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�˶���ԭ��˵��</div>
  </td>
  <td width="35%"> 
    <textarea name="crm_tdjdj_tdjyysm" cols="29" rows="3"></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">Ӧ�˽��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_ytje" size="20" maxlength="17" >
  </td>
  <td width="15%"> 
    <div align="right">ʵ�˽��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_stje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">¼�뵥λ</div>
  </td>
  <td width="35%"> 
    <select name="crm_tdjdj_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','1','2') order by dwbh","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">¼����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="crm_tdjdj_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">¼��ʱ��</div>
  </td>
  <td width="35%"> 
  ��<input type="text" name="crm_tdjdj_lrsj" size="20" maxlength="10" >
  <BR>��<input type="text" name="crm_tdjdj_lrsj2" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.crm_tdjdj_ytje, "Ӧ�˽��"))) {
		return false;
	}
	if(!(isFloat(FormName.crm_tdjdj_stje, "ʵ�˽��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tdjdj_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_tdjdj_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
