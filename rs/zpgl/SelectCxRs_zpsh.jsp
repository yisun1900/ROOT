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
<form method="post" action="Rs_zpshCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ƹ�ƻ����</td> 
  <td width="35%"> 
    <input type="text" name="zpsqbh" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">��˱��</td> 
  <td width="35%"> 
    <input type="text" name="shbh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���״̬</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='01' order by ztbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">��˽���</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">���ͨ��</option>
    <option value="0">ȡ������</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��˺�����</td> 
  <td width="35%"> 
    <input type="text" name="shhrs" value="" size="20" maxlength="8">
  </td>
  <td align="right" width="15%"><font color="#0000FF">�����</font></td> 
  <td width="35%"> 
    <input type="text" name="shr" size="20" maxlength="20" value="" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ʱ�� ��</td> 
  <td width="35%"> 
  <input type="text" name="shsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"> 
   ���ʱ�� ��
  </td>
  <td width="35%"> 
  <input type="text" name="shsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
	if(!(isNumber(FormName.shbh, "��˱��"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj2, "���ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
