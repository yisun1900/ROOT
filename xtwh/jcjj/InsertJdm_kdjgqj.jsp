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

<form method="post" action="SaveInsertJdm_kdjgqj.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ȼ۸��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kdjgqjbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">��ȼ۸�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kdjgqj" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��ʼ��ȣ�>��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qskd" value="" size="20" maxlength="8" > mm
  </td>
  <td width="15%"> 
    <div align="right">��ֹ��ȣ�<=��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zzkd" value="" size="20" maxlength="8" > mm
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm","");
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
	if(	javaTrim(FormName.kdjgqjbm)=="") {
		alert("������[��ȼ۸��������]��");
		FormName.kdjgqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kdjgqj)=="") {
		alert("������[��ȼ۸�����]��");
		FormName.kdjgqj.focus();
		return false;
	}
	if(	javaTrim(FormName.qskd)=="") {
		alert("������[��ʼ���]��");
		FormName.qskd.focus();
		return false;
	}
	if(!(isNumber(FormName.qskd, "��ʼ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zzkd)=="") {
		alert("������[��ֹ���]��");
		FormName.zzkd.focus();
		return false;
	}
	if(!(isNumber(FormName.zzkd, "��ֹ���"))) {
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.mmdglxbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
