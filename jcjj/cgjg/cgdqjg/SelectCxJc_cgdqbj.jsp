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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Jc_cgdqbjCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_dqbm" size="20" maxlength="5" >
  </td>
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_dqmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <select name="jc_cgdqbj_dqlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqlbbm,dqlbmc from jdm_dqlbbm order by dqlbbm","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�ͺ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_xh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_gg" size="20" maxlength="20" >
  </td>
  <td width="15%"> 
    <div align="right">������λ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_jldw" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ʒ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_cptz" size="20" maxlength="200" >
  </td>
  <td width="15%"> 
    <div align="right">����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_cd" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���ۼ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_lsj" size="20" maxlength="9" >
  </td>
  <td width="15%"> 
    <div align="right">�Żݼ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_cgdqbj_yhj" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <select name="jc_cgdqbj_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(!(isFloat(FormName.jc_cgdqbj_lsj, "���ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_cgdqbj_yhj, "�Żݼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
