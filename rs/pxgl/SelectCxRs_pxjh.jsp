<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_pxjhCxList.jsp" name="selectform">
<div align="center">��ѯ��Ƹ�ƻ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ�ƻ�����</td> 
  <td width="35%"> 
    <input type="text" name="pxjhmc" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">��ѵ�ƻ����</td> 
  <td width="35%"> 
    <input type="text" name="pxjhbh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxrs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ֹ�˾</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
	<td align="right" width="15%">�Ƿ�ƻ���</td> 
	<td width="31%"> 
	<input type="radio" name="sfjhn"  value="0" >
	�ƻ��� 
	<input type="radio" name="sfjhn"  value="1" >
	�ƻ��� </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ�״̬</td> 
  <td width="35%"> 
    <select name="jhzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<option value="0">¼��δ���</option>
	<option value="1">¼�����</option>
	<option value="2">���������</option>
	<option value="3">��ѵ���</option>
	<option value="4">���δͨ��</option>
	<option value="5">�޸ļƻ�</option>
	<option value="6">������</option>
    </select>
  </td>
    <td align="right" width="15%">��˽���</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select shjl,shjlmc from rs_pxshbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">¼���˷ֹ�˾</td> 
  <td width="35%"> 
     <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.pxrs, "��ѵ����"))) {
		return false;
	}
	if(!(isFloat(FormName.pxfy, "��ѵ����"))) {
		return false;
	}

	if(!(isDatetime(FormName.lrsj, "¼��ʱ�� ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ�� ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
