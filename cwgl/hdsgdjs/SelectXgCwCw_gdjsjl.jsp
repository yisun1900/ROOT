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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ʩ���ӽ���--�޸Ĳ������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_gdjsjlXgCwList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ͻ����</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_khbh" size="20" maxlength="20" >  </td>
  <td width="15%"> 
    <div align="right">ʩ����</div>  </td>
  <td width="35%"> 
    <select name="cw_gdjsjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgd","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">�ͻ�����</div></td>
  <td><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td><div align="right">���ݵ�ַ</div></td>
  <td><input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">��ϵ��ʽ</div></td>
  <td><input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >  </td>
  <td><div align="right">���ʦ</div></td>
  <td><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td><div align="right">��ͬ��</div></td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td><div align="right">�ʼ�</div></td>
  <td><input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��װ��־</div>  </td>
  <td width="35%"> 
    <select name="cw_gdjsjl_jzbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+��װ&2+��װ","");
%>
    </select>  </td>
  <td width="15%"> 
    <div align="right">�ۿ���</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_zkl" size="20" maxlength="9" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������</div>  </td>
  <td width="35%"> 
    <select name="cw_gdjsjl_tdjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+�ͻ�������&2+ʵ�տ�&3+ǩԼ��&4+ʵ�ʳɱ�&5+������&9+����","");
%>
    </select>  </td>
  <td width="15%"> 
    <div align="right">��������</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_glftd" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���㲿������</div>  </td>
  <td width="35%"> 
    <input type="text" name="cw_gdjsjl_jsr" size="20" maxlength="20" >  </td>
  <td width="15%"> 
    <div align="right">���㵥λ</div>  </td>
  <td width="35%"><select name="cw_gdjsjl_jsdw" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%>
    </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���㲿����ʱ�� ��</td>
  <td><input type="text" name="cw_gdjsjl_jssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_gdjsjl_jssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������ʱ�� ��</td>
  <td><input type="text" name="cw_gdjsjl_cwjssj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_gdjsjl_cwjssj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>  </td>
  <td width="35%"><select name="cw_gdjsjl_jsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="3">�������</option>
  </select></td>
  <td width="15%"> 
    <div align="right">�����¼��</div>  </td>
  <td width="35%"><input type="text" name="cw_gdjsjl_gdjsjlh" size="20" maxlength="9" ></td>
</tr>

<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isFloat(FormName.cw_gdjsjl_zkl, "�ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_gdjsjl_glftd, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_jssj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_cwjssj, "�������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gdjsjl_cwjssj2, "�������ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
