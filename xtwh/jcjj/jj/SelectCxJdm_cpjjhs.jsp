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
<form method="post" action="Jdm_cpjjhsCxList.jsp" name="selectform">
<div align="center">��Ʒ�Ҿ߻�ɫ������ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="20%">��Ʒ�Ҿ߻�ɫ����</td> 
      <td width="30%"> 
        <input type="text" name="jdm_cpjjhs_cpjjhsbm" size="20" maxlength="4" >
  </td>
      <td align="right" width="18%">��Ʒ�Ҿ߻�ɫ</td> 
      <td width="32%"> 
        <input type="text" name="jdm_cpjjhs_cpjjhs" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="20%">��Ʒ�Ҿ߲��ʱ���</td> 
      <td width="30%"> 
        <select name="jdm_cpjjhs_cpjjczbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select cpjjczbm,cpjjcz from jdm_cpjjcz order by cpjjczbm","");
%>
    </select>
  </td>
      <td align="right" width="18%">&nbsp; </td>
      <td width="32%">&nbsp; </td>
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