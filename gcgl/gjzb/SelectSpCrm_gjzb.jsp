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
<form method="post" action="Crm_gjzbSpList.jsp" name="selectform">
<div align="center">�ܼ��ܱ���������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ǼǱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_gjzb_djbh" size="20" maxlength="10" >  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="crm_gjzb_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ�����</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">���ݵ�ַ</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">���ʦ</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="crm_gjzb_bgr" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������ʼʱ�� ��</td>
  <td><input type="text" name="crm_gjzb_bgqssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_gjzb_bgqssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������ʱ�� ��</td>
  <td><input type="text" name="crm_gjzb_bgjzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_gjzb_bgjzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ı�־</td> 
  <td width="35%"><%
	cf.radioToken(out, "crm_gjzb_sybz","N+δ��&Y+������","");
%></td>
  <td align="right" width="15%">������</td> 
  <td width="35%"><input type="text" name="crm_gjzb_syr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ�� ��</td> 
  <td width="35%"><input type="text" name="crm_gjzb_sysj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="crm_gjzb_sysj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="crm_gjzb_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_gjzb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="crm_gjzb_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;  </td>
  <td width="35%">&nbsp;  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_gjzb_bgqssj, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gjzb_bgqssj2, "������ʼʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gjzb_bgjzsj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gjzb_bgjzsj2, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gjzb_sysj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gjzb_sysj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_gjzb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
