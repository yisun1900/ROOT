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
<form method="post" action="Rs_zpjhjgList.jsp" name="selectform">
<div align="center">ά����Ƹ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ�ƻ����</td> 
  <td width="35%"> 
    <input type="text" name="zpjhbh" size="20" maxlength="8" >
  </td>
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
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">��Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>ʵ����Ƹ����</font></td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%"><font color=red>ʵ����Ƹ����</font></td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ�״̬</td> 
  <td width="35%"> 
    <select name="jhzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="3">��Ƹ���</option>
    </select>
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
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ���ʼʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">�ƻ���ʼʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>ʵ�ʿ�ʼʱ�� ��</font></td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"><font color=red>ʵ�ʿ�ʼʱ�� ��</font></td> 
  <td width="35%"> 
    <input type="text" name="sjkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ƻ�����ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
   <td align="right" width="15%">�ƻ�����ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>ʵ�ʽ���ʱ�� ��</font></td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
   <td align="right" width="15%"><font color=red>ʵ�ʽ���ʱ�� ��</font></td> 
  <td width="35%"> 
    <input type="text" name="sjjssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
  <td align="right" width="15%"><font color=red>���¼��ʱ�� ��</font></td> 
  <td width="35%"> 
    <input type="text" name="wclrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"><font color=red>���¼��ʱ�� ��</font></td> 
  <td width="35%"> 
    <input type="text" name="wclrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="wclrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%"><font color=red>���¼����</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
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
	if(!(isNumber(FormName.zprs, "��Ƹ����"))) {
		return false;
	}
	if(!(isFloat(FormName.zpfy, "��Ƹ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhkssj, "�ƻ���ʼʱ�� ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhkssj2, "�ƻ���ʼʱ�� ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "�ƻ�����ʱ�� ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj2, "�ƻ�����ʱ�� ��"))) {
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
