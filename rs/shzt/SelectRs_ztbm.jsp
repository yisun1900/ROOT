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
<form method="post" action="Rs_ztbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <input type="text" name="ztmc" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">״̬����</td> 
  <td width="35%"> 
    <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+��Ƹ&02+��ѵ&03+�䶯&04+��������&06+������ְ&07+��������&08+�Ӱ�����&09+���ڿ�������&10+��ٵ�&11+��������&12+�����λ����&13+��ְ����&14+�˻���Ա����","");
%>
    </select>
  </td>
  <td align="right" width="15%">���޸�����״̬</td> 
  <td width="35%"> 
     <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"02+��������&03+����ͨ��&04+����ȡ��","");
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
