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
<form method="post" action="Crm_dmsjsxgjlCxList.jsp" name="selectform">
<div align="center">��ѯ���޸����ʦ�����¼ </div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�޸ļ�¼��</td> 
  <td width="30%"> 
    <input type="text" name="crm_dmsjsxgjl_xgjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="21%">�ͻ����</td> 
  <td width="29%"> 
    <input type="text" name="crm_dmsjsxgjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�ͻ�����</td> 
  <td width="30%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="21%">���ݵ�ַ</td> 
  <td width="29%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��ͬ��</td> 
  <td width="30%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">&nbsp;</td> 
  <td width="29%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�޸�ǰ�ֹ�˾</td>
  <td><select name="crm_dmsjsxgjl_xgqfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
  </select></td>
  <td align="right">�޸ĺ�ֹ�˾</td>
  <td><select name="crm_dmsjsxgjl_xghfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�޸�ǰǩԼ����</td> 
  <td width="30%"> 
    <select name="crm_dmsjsxgjl_xgqdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="21%">�޸ĺ�ǩԼ����</td> 
  <td width="29%"><select name="crm_dmsjsxgjl_xghdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�޸�ǰ���ʦ����</td> 
  <td width="30%"> 
    <input type="text" name="crm_dmsjsxgjl_xgqsjsgh" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">�޸ĺ����ʦ����</td> 
  <td width="29%"><input type="text" name="crm_dmsjsxgjl_xghsjsgh" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�޸�ǰ���ʦ</td>
  <td><input type="text" name="crm_dmsjsxgjl_xgqsjs" size="20" maxlength="20" ></td>
  <td align="right">�޸ĺ����ʦ</td>
  <td><input type="text" name="crm_dmsjsxgjl_xghsjs" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�޸�ǰ�ͻ�����</td>
  <td><input type="text" name="xgqkhjl" size="20" maxlength="20" ></td>
  <td align="right">�޸ĺ�ͻ�����</td>
  <td><input type="text" name="xghkhjl" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">¼��ʱ�� ��</td> 
  <td width="30%"><input type="text" name="crm_dmsjsxgjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="21%">��</td> 
  <td width="29%"><input type="text" name="crm_dmsjsxgjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">¼����</td> 
  <td width="30%"><input type="text" name="crm_dmsjsxgjl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="21%">¼�벿��</td> 
  <td width="29%"><select name="crm_dmsjsxgjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where cxbz='N' order by ssfgs,dwbh","");
%>
  </select></td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_dmsjsxgjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dmsjsxgjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
