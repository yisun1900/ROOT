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
<form method="post" action="Crm_ycglList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�쳣�����</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_ycdbh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_khbh" size="20" maxlength="20" >
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
  <td align="right" width="15%">�쳣����</td> 
  <td width="35%"> 
    <select name="crm_ycgl_ycflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ycflbm,ycflmc from dm_ycflbm order by ycflbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">�쳣����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_ycfssj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_zrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">�쳣���˵��</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_ycqksm" cols="29" rows="6"></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ƶ���</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_fazdr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">�����ƶ�ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_fazdsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_jhjjsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_jjfa" cols="29" rows="6"></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ�ʴ�����</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_sjclr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">ʵ�ʴ���ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_sjclsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ�ʴ������</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_sjclqk" cols="29" rows="6"></textarea>
  </td>
  <td align="right" width="15%">���ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_wcsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ���</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "crm_ycgl_sfjj","1+¼���쳣&2+�ƶ�����&3+���","");
%>
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="crm_ycgl_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="crm_ycgl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%"> 
    <textarea name="crm_ycgl_bz" cols="29" rows="2"></textarea>
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
	if(!(isDatetime(FormName.crm_ycgl_ycfssj, "�쳣����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_fazdsj, "�����ƶ�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_jhjjsj, "�ƻ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_sjclsj, "ʵ�ʴ���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_wcsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_ycgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
