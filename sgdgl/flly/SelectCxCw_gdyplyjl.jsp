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
<form method="post" action="cw_fllyjlCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��¼��</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_jlh" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">ʩ����</td> 
  <td width="35%"> 
    <select name="cw_fllyjl_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' order by sgd","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʩ����</td> 
  <td width="35%"> 
    <input type="text" name="sq_sgd_sgdmc" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <select name="cw_fllyjl_gdyp" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gdyp c1,gdyp c2 from cw_flbm order by gdyp","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_dj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_sl" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_je" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_jkblr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_jkblsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼�벿��</td> 
  <td width="35%"> 
    <select name="cw_fllyjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����־</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_fllyjl_jsbz","0+δ����&1+�ѽ���","");
%>
  </td>
  <td align="right" width="15%">�����¼��</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_jsjlh" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ɾ����־</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_fllyjl_scbz","N+δɾ��&Y+ɾ��","");
%>
  </td>
  <td align="right" width="15%">ɾ����</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_scr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ɾ��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="cw_fllyjl_scsj" size="20" maxlength="10" >
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
	if(!(isFloat(FormName.cw_fllyjl_dj, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_fllyjl_sl, "����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_fllyjl_je, "���"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_fllyjl_jkblsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_fllyjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_fllyjl_scsj, "ɾ��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
