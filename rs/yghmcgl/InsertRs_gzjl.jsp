<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������¼��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_gzjl.jsp" name="insertform" target="_blank">
<div align="center">��������¼��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000FF">Ա�����</font></td>
      <td width="33%"> 
        <input type="text" name="ygbh" value="<%=whereygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">ʱ���</td>
      <td colspan="3"> 
        <input type="text" name="sjd" value="" size="50" maxlength="50" >
        <font color="#FF0000">�������κη�ʽ��ʾʱ��Σ�</font> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������λ�β���</td>
      <td colspan="3">
        <input type="text" name="gzdwbm" value="" size="73" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">����ְ��</td>
      <td width="33%">
        <input type="text" name="drzw" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="16%">֤����</td>
      <td width="34%">
        <input type="text" name="zmr" value="" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">��λ�绰</td>
      <td width="33%"> 
        <input type="text" name="dwdh" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
        <input type="button" value="�޸Ĺ�������" onClick="window.open('Rs_gzjlList.jsp?ygbh=<%=whereygbh%>')">
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
	if(	javaTrim(FormName.sjd)=="") {
		alert("������[ʱ���]��");
		FormName.sjd.focus();
		return false;
	}
	if(	javaTrim(FormName.gzdwbm)=="") {
		alert("������[������λ�β���]��");
		FormName.gzdwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.drzw)=="") {
		alert("������[����ְ��]��");
		FormName.drzw.focus();
		return false;
	}
	if(	javaTrim(FormName.dwdh)=="") {
		alert("������[��λ�绰]��");
		FormName.dwdh.focus();
		return false;
	}
	if(	javaTrim(FormName.zmr)=="") {
		alert("������[֤����]��");
		FormName.zmr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
