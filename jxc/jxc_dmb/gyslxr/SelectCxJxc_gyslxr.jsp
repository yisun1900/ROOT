<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_gyslxrCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���</td> 
  <td colspan="3"><input type="text" name="xh" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ӧ�̱���</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:352PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx  order by gysmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ϵ������</td> 
  <td width="35%"> 
    <input type="text" name="lxrxm" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">ְ��</td> 
  <td width="35%"> 
    <input type="text" name="zw" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֻ�</td> 
  <td width="35%"> 
    <input type="text" name="sj" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">�칫�绰</td> 
  <td width="35%"> 
    <input type="text" name="bgdh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="cz" size="20" maxlength="50" >  </td>
  <td align="right" width="15%">�Ƿ���ְ</td> 
  <td width="35%"> 
    <select name="sflz" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
  <option value="Y">��ְ</option>
  <option value="N">��ְ</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td colspan="3"> 
    <input type="text" name="bz" size="60" maxlength="100" >    </td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
