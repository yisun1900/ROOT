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
<form method="post" action="Tc_jjjgbCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <select name="tc_jjjgb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">���ۼ���</td> 
  <td width="35%"> 
    <select name="tc_jjjgb_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ƷС��</td> 
  <td width="35%"> 
    <select name="tc_jjjgb_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
    </select>
  </td>
  <td align="right" width="15%">��Ʒ����</td> 
  <td width="35%"> 
    <select name="tc_jjjgb_tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ�Ҫ����ͬƷ��</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "tc_jjjgb_sfyqxtpp","Y+��&N+��","");
%>
  </td>
  <td align="right" width="15%">������λ</td> 
  <td width="35%"> 
    <input type="text" name="tc_jjjgb_jldw" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ�ɼ���</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "tc_jjjgb_sfkjm","1+���ɼ���&2+�ɼ���","");
%>
  </td>
  <td align="right" width="15%">���ⵥ��</td> 
  <td width="35%"> 
    <input type="text" name="tc_jjjgb_jmdj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ۼ�</td> 
  <td width="35%"> 
    <input type="text" name="tc_jjjgb_sjzj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="tc_jjjgb_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="tc_jjjgb_lrsj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.tc_jjjgb_tccplbbm, "��ƷС��"))) {
		return false;
	}
	if(!(isNumber(FormName.tc_jjjgb_tccpdlbm, "��Ʒ����"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_jjjgb_jmdj, "���ⵥ��"))) {
		return false;
	}
	if(!(isFloat(FormName.tc_jjjgb_sjzj, "�����ۼ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_jjjgb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
