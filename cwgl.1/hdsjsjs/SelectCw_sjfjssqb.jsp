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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Cw_sjfjssqbList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="sqr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
  ��<input type="text" name="sqsj" size="20" maxlength="10" >
  <BR>��<input type="text" name="sqsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="spr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ��</td> 
  <td width="35%"> 
  ��<input type="text" name="spsj" size="20" maxlength="10" >
  <BR>��<input type="text" name="spsj2" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">����״̬</td> 
  <td width="35%"> 
    <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+����&2+����ͬ��&3+������ͬ��&4+����","");
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
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.spsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
