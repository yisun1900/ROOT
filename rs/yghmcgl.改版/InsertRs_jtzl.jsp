<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_jtzl.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">Ա�����</font></td> 
  <td width="35%"> 
    <input type="text" name="ygbh" value="<%=whereygbh%>" size="20" maxlength="8" readonly>
  </td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="xm" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�뱾�˹�ϵ</td> 
  <td width="35%"> 
    <input type="text" name="gx" value="" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="csnf" value="" size="10" maxlength="4" ><font color=red>XXXX��λ��ʾ���</font>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������λ</td> 
  <td width="35%"> 
    <input type="text" name="gzdw" value="" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">ְ��</td> 
  <td width="35%"> 
    <input type="text" name="zw" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ϵ�绰</td> 
  <td width="35%"> 
    <input type="text" name="lxdh" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
    <input type="button" value="�޸ļ�ͥ����" onClick="window.open('Rs_jtzlList.jsp?ygbh=<%=whereygbh%>')">
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.xm)=="") {
		alert("������[����]��");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("������[��ϵ]��");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.csnf)=="") {
		alert("������[�������]��");
		FormName.csnf.focus();
		return false;
	}
	if(!(isNumber(FormName.csnf, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.gzdw)=="") {
		alert("������[������λ]��");
		FormName.gzdw.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.lxdh)=="") {
		alert("������[��ϵ�绰]��");
		FormName.lxdh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
