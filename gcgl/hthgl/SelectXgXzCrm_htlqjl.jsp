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
<form method="post" action="Crm_htlqjlXgXzList.jsp" name="selectform">
<div align="center">��ͬ���ˣ�ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">��ȡ�ֹ�˾</td>
  <td><select name="crm_htlqjl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
  </select></td>
  <td align="right">��ȡ����</td>
  <td><select name="crm_htlqjl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ȡ��¼��</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_lqjlh" size="20" maxlength="11" >  </td>
  <td align="right" width="15%">��ȡ����</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_lqsl" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʹ������</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_sysl" size="20" maxlength="8" >  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_zfsl" size="20" maxlength="8" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ʼ��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_qshth" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">��ֹ��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_zzhth" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��ȡʱ�� ��</td>
  <td><input type="text" name="crm_htlqjl_lqsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_htlqjl_lqsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ȡ��</td>
  <td><input type="text" name="crm_htlqjl_lqr" size="20" maxlength="20" ></td>
  <td align="right">¼����</td>
  <td><input type="text" name="crm_htlqjl_lrr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="crm_htlqjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">�� </td>
  <td><input type="text" name="crm_htlqjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���˱�־</td> 
  <td width="35%"> 
   <INPUT type="radio" name="crm_htlqjl_xzbz" value="N" checked>δ����
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="crm_htlqjl_xzr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ�� ��</td> 
  <td width="35%"><input type="text" name="crm_htlqjl_xzsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="crm_htlqjl_xzsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isNumber(FormName.crm_htlqjl_lqsl, "��ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_htlqjl_sysl, "ʹ������"))) {
		return false;
	}
	if(!(isNumber(FormName.crm_htlqjl_zfsl, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lqsj, "��ȡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lqsj2, "��ȡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_xzsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_xzsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_htlqjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
