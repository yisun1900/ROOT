<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_chsgdjsShList.jsp" name="selectform">
<div align="center">ʩ�����깤���㣭���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����¼��</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsjlh" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_khbh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʩ����</td> 
  <td width="35%"> 
    <select name="cw_chsgdjs_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>
  </td>
  <td align="right" width="15%">ʩ����</td> 
  <td width="35%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֳ�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_sgbz" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">��ͬ���̻�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_htjcbj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������̻�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_zjxjcbj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�������˷�</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_ljqyf" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƾ߰�װ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_djazf" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsjs" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsbl" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">�����������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_tzjsbl" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ˮ��·���</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_sdlje" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">ˮ��·�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_sdljsbl" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ܶ�</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsje" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">���Ϸ�</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_clf" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����˷�</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_clyf" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">������Ʒ</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_gdyp" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ѹ����̿�</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_yfgck" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">Ӧ���ʱ������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_kzbjjbl" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ʱ���</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_kzbj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">���Ϸ���</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_clfk" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jfje" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">Ӧ�����</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_yfje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_jsrq" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">����״̬</td> 
  <td width="35%"> 
    <select name="cw_chsgdjs_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+δ����&2+����","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_chsgdjs_lrsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="cw_chsgdjs_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
	if(!(isFloat(FormName.cw_chsgdjs_htjcbj, "��ͬ���̻�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_zjxjcbj, "������̻�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_ljqyf, "�������˷�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_djazf, "�ƾ߰�װ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jsjs, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jsbl, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_tzjsbl, "�����������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_sdlje, "ˮ��·���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_sdljsbl, "ˮ��·�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jsje, "�����ܶ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_clf, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_clyf, "�����˷�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_gdyp, "������Ʒ"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_yfgck, "�Ѹ����̿�"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_kzbjjbl, "Ӧ���ʱ������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_kzbj, "���ʱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_clfk, "���Ϸ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_jfje, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_chsgdjs_yfje, "Ӧ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_chsgdjs_jsrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_chsgdjs_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
