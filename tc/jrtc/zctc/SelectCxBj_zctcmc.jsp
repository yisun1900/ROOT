<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_zctcmcCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײͱ���</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_tcbm" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="bj_zctcmc_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײ�����</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_tcmc" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">ԭ��</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_yj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ײͼ�</td> 
  <td width="32%"> 
    <input type="text" name="bj_zctcmc_tcj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"><input type="radio" name="lx" value="1">
    �Ҿ��ײ�
      <input type="radio" name="lx" value="2">
      �����ƻ� </td>
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
	if(!(isNumber(FormName.bj_zctcmc_tcbm, "�ײͱ���"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_zctcmc_yj, "ԭ��"))) {
		return false;
	}
	if(!(isFloat(FormName.bj_zctcmc_tcj, "�ײͼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>