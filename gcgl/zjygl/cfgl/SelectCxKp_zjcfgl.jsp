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
<form method="post" action="Kp_zjcfglCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������¼��</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_cfjlh" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">���̵���</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_zjxm" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ֹ�˾</td> 
  <td width="35%"> 
    <select name="kp_zjcfgl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_cfr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
  ��<input type="text" name="kp_zjcfgl_cfsj" size="20" maxlength="10" >
  <BR>��<input type="text" name="kp_zjcfgl_cfsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="kp_zjcfgl_cflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cflxbm,cflxmc from kp_cflxbm order by cflxbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ԭ��</td> 
  <td width="35%"> 
    <select name="kp_zjcfgl_cfyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cfyybm,cfyymc from kp_cfyybm order by cfyybm","");
%>
    </select>
  </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">¼�뵥λ</td> 
  <td width="35%"> 
    <select name="kp_zjcfgl_lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������־</td> 
  <td width="35%"> 
    <select name="kp_zjcfgl_cfspbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"2+δ����&3+����ͨ��&4+����δͨ��","");
%>
    </select>
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_spr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="kp_zjcfgl_spsj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.kp_zjcfgl_cfjlh, "������¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_zjcfgl_cfsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_zjcfgl_cfsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_zjcfgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_zjcfgl_spsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
