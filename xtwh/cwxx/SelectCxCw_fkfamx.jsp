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
<form method="post" action="Cw_fkfamxCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">�����</td>
      <td width="28%"> 
        <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm","");
%> 
      </select>      </td>
      <td align="right" width="23%">�տ�����</td>
      <td width="27%"> 
        <select name="cw_fkfamx_fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">�տʽ</td>
      <td colspan="3"> 
		<INPUT type="radio" name="cw_fkfamx_lx" value="1">����ǰ�տ�(����������)<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="2">����ǰ�տ��������һ����ȡ��<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="3">����ǰ�տ��������ִ���ȡ��<BR><BR>

		<INPUT type="radio" name="cw_fkfamx_lx" value="6">���ۺ��տ�(����������)<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="7">���ۺ��տ��������һ����ȡ��<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="8">���ۺ��տ��������ִ���ȡ��<BR><BR>

		<INPUT type="radio" name="cw_fkfamx_lx" value="A">��ǰ������<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="B">�ۺ�������<BR>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�տ��Ƿ���������</td>
      <td>
		<INPUT type="radio" name="sfbhglf" value="N">������
		<INPUT type="radio" name="sfbhglf" value="Y">����
	 </td>
      <td align="right">�տ��Ƿ����˰��</td>
      <td>
		<INPUT type="radio" name="sfbhsj" value="N">������
		<INPUT type="radio" name="sfbhsj" value="Y">����
	</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">      </td>
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
	if(!(isNumber(FormName.cw_fkfamx_fkcs, "�տ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
