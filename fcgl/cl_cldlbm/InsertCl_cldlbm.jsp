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
<form method="post" action="SaveInsertCl_cldlbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">���ϴ������</td>
      <td width="32%"> 
        <input type="text" name="cldlbm" value="" size="10" maxlength="2" >
        <font color="red">��2λ���ֻ���ĸ��</font> </td>
      <td align="right" width="16%">���ϴ�������</td>
      <td width="34%"> 
        <input type="text" name="cldlmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">ǩԼ�ٷֱ�</td>
      <td width="32%"> 
        <input type="text" name="qybfb" value="" size="10" maxlength="15" >
        %</td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp;</td>
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
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("������[���ϴ������]��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	FormName.cldlbm.value.length!=2) {
		alert("[���ϴ������]Ӧ��Ϊ2λ��");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("������[���ϴ�������]��");
		FormName.cldlmc.focus();
		return false;
	}

	if(	javaTrim(FormName.qybfb)=="") {
		alert("������[ǩԼ�ٷֱ�]��");
		FormName.qybfb.focus();
		return false;
	}

	if(!(isFloat(FormName.qybfb, "ǩԼ�ٷֱ�"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
