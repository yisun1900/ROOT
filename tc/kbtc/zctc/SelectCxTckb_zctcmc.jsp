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
<form method="post" action="Tckb_zctcmcCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="tckb_zctcmc_tcbm" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="tckb_zctcmc_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
  </select></td>
  <td align="right">���ۼ���</td>
  <td><select name="select" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2'   order by bjjbbm","");
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="tckb_zctcmc_tcmc" size="20" maxlength="100" >  </td>
  <td align="right" width="18%">ԭ��</td> 
  <td width="32%"> 
    <input type="text" name="tckb_zctcmc_yj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ʵ����</td> 
  <td width="32%"> 
    <input type="text" name="tckb_zctcmc_tcj" size="20" maxlength="17" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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
	if(!(isNumber(FormName.tckb_zctcmc_tcbm, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.tckb_zctcmc_yj, "ԭ��"))) {
		return false;
	}
	if(!(isFloat(FormName.tckb_zctcmc_tcj, "ʵ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
