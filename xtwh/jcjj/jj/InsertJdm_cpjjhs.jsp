<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJdm_cpjjhs.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">��Ʒ�Ҿ߲���</td>
      <td width="27%"> 
        <select name="cpjjczbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="getItemValue(cpjjczbm,cpjjhsbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjczbm,cpjjcz from jdm_cpjjcz order by cpjjczbm","");
%> 
        </select>
      </td>
      <td align="right" width="22%">&nbsp; </td>
      <td width="28%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">��Ʒ�Ҿ߻�ɫ���루<font color="#CC0000"><b>4λ</b></font>��</td>
      <td width="27%"> 
        <input type="text" name="cpjjhsbm" value="" size="20" maxlength="4" >
      </td>
      <td align="right" width="22%">��Ʒ�Ҿ߻�ɫ</td>
      <td width="28%"> 
        <input type="text" name="cpjjhs" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.cpjjczbm)=="") {
		alert("��ѡ��[��Ʒ�Ҿ߲���]��");
		FormName.cpjjczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhsbm)=="") {
		alert("������[��Ʒ�Ҿ߻�ɫ����]��");
		FormName.cpjjhsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhs)=="") {
		alert("������[��Ʒ�Ҿ߻�ɫ]��");
		FormName.cpjjhs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
