<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">�Ҿ�������۱�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������</td> 
  <td width="35%"> 
    <input type="text" name="jc_jjpjbj_gtpjbh" size="20" maxlength="4" >
  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="jc_jjpjbj_gtpjmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͺ�</td> 
  <td width="35%"> 
    <input type="text" name="jc_jjpjbj_xinghao" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">���</td> 
  <td width="35%"> 
    <input type="text" name="jc_jjpjbj_guige" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="jc_jjpjbj_dj" size="20" maxlength="17" >
  </td>
      <td align="right" width="15%">&nbsp;</td>    <td width="35%">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <select name="jc_jjpjbj_jjpjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jjpjflbm,jjpjflmc from jdm_jjpjflbm order by jjpjflbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">������λ</td> 
  <td width="35%"> 
    <select name="jc_jjpjbj_jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc","");
%>
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="button" onClick="f_dc(selectform)"  value="��������">
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
	if(!(isFloat(FormName.jc_jjpjbj_dj, "����"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jc_jjpjbjList.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.jc_jjpjbj_dj, "����"))) {
		return false;
	}

	FormName.target="_blank";
	FormName.action="Jc_jjpjbjDcList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>