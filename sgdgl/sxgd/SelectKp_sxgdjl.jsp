<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
%>

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

<form method="post" action="Kp_sxgdjlList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ɸѡ��¼��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_sxgdjl_sxjlh" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">ɸѡ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_sxgdjl_yhdlm" size="20" maxlength="16" value="<%=yhdlm%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">ɸѡʱ�� ��</div>
  </td>
              <td width="35%"> 
                <input type="text" name="kp_sxgdjl_sxsj" size="20" maxlength="10" >
              </td>
  <td width="15%"> 
                <div align="right">��</div>
  </td>
  <td width="35%">
                <input type="text" name="kp_sxgdjl_sxsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.kp_sxgdjl_sxjlh, "ɸѡ��¼��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_sxgdjl_sxsj, "ɸѡʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.kp_sxgdjl_sxsj2, "ɸѡʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
