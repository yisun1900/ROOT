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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_pfxmbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������Ŀ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pfxmbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">������Ŀ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="pfxmmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ֵ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fz" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">��Ӧ��������</div>
  </td>
  <td width="35%"> 
    <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm","");
%>
    </select>
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
	if(	javaTrim(FormName.pfxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.pfxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pfxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.pfxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.fz)=="") {
		alert("������[��ֵ]��");
		FormName.fz.focus();
		return false;
	}
	if(!(isNumber(FormName.fz, "��ֵ"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
