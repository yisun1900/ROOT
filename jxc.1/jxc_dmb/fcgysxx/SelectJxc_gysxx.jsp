<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_gysxxList.jsp" name="selectform">
<div align="center">��Ӧ����Ϣά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td ><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where  dqbm='"+dqbm+"'","");
	}
%>
  </select></td>
  <td align="right">�Ƿ����</td>
  <td ><input type="radio" name="sfhz" value="Y">
    ����
      <input type="radio" name="sfhz" value="N">
      ������ </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ�̱���</td>
  <td ><input type="text" name="gysbm" size="20" maxlength="8" ></td>
   <td align="right">��Ӧ������</td>
  <td width="32%"><input type="text" name="gysmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ������</td>
  <td colspan="3"><input type="radio" name="gyslx" value="0">
    ����Ʒ������
      <input type="radio" name="gyslx" value="1">
      ��湩����
      <input type="radio" name="gyslx" value="2">
      ���ù����� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ��������</td> 
  <td width="32%">
    <input type="radio" name="cllx" value="2" checked>����
  <td align="right" width="18%">��Ӧ�̵�ַ</td> 
  <td width="32%"><input type="text" name="gysdz" size="20" maxlength="100" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̸�����</td> 
  <td width="32%"> 
    <input type="text" name="gysfzr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">��Ӧ�̵绰</td> 
  <td width="32%"> 
    <input type="text" name="gysdh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̴���</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">E-Mail</td> 
  <td width="32%"> 
    <input type="text" name="email" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
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
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
