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
<form method="post" action="Cw_dejsglflList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">���</td>
      <td width="29%"> 
        <input type="text" name="cw_dejsglfl_xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="20%">����</td>
      <td width="30%"> 
        <select name="cw_dejsglfl_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�ɱ������ʼֵ��>=��</td>
      <td width="29%"> 
        <input type="text" name="cw_dejsglfl_qsz" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">�ɱ�����ֵֹ��<��</td>
      <td width="30%"> 
        <input type="text" name="cw_dejsglfl_jzz" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">�������(0-100)</td>
      <td width="29%"> 
        <input type="text" name="cw_dejsglfl_jsbl" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
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
	if(!(isNumber(FormName.cw_dejsglfl_xh, "���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_dejsglfl_qsz, "�ɱ������ʼֵ��>=��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_dejsglfl_jzz, "�ɱ�����ֵֹ��<��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_dejsglfl_jsbl, "�������(0-100)"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
