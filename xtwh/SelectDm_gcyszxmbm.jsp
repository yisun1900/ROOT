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

<form method="post" action="Dm_gcyszxmbmList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="19%" align="right"> 
                ������������Ŀ����  </td>
              <td width="31%"> 
                <input type="text" name="gcyszxmbm" size="20" maxlength="2" >  </td>
              <td width="19%" align="right"> 
                ������������Ŀ����  </td>
              <td width="31%"> 
                <input type="text" name="gcyszxmmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�ط�</td>
  <td><%
		cf.radioToken(out, "sfhf","Y+��&N+��","");
%></td>
  <td align="right">��Ӧ���̽���</td>
  <td><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:151PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="19%" align="right">���շ���</td>
              <td width="31%"> 
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="2">���Ͻ�������</option>
    <option value="3">���ι�������</option>
    <option value="4">��������</option>
    <option value="5">�깤����</option>
    </select>  </td>
              <td width="19%">&nbsp;  </td>
              <td width="31%">&nbsp; </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
</tr>
</table>
</form>

	  
	  
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
