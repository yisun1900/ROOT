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
<form method="post" action="Tc_csrjbzxmCxList.jsp" name="selectform">
<div align="center">�ײͱ�׼��Ŀ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
<!--  <td align="right" width="15%">���۰汾��</td> 
  <td width="35%"> 
    <select name="tc_csrjbzxm_bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjbbh c1,bjbbh c2 from bj_dzbjbb","");
%>
    </select>
  </td>-->
  <td align="right" width="15%">����</td> 
  <td colspan="3"> 
    <select name="tc_csrjbzxm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ۼ���</td> 
  <td width="35%"> 
    <select name="tc_csrjbzxm_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">��Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="tc_csrjbzxm_xmmc" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Ʒ��</td> 
  <td width="35%"> 
    <input type="text" name="tc_csrjbzxm_ppmc" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">�ͺ�</td> 
  <td width="35%"> 
    <input type="text" name="tc_csrjbzxm_xh" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������λ</td> 
  <td width="35%"> 
    <select name="tc_csrjbzxm_jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="tc_csrjbzxm_bhsl" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="tc_csrjbzxm_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="tc_csrjbzxm_lrsj" size="20" maxlength="10" >
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
	if(!(isFloat(FormName.tc_csrjbzxm_bhsl, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_csrjbzxm_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>