<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
	String yhmc=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_zpjhjg.jsp" name="insertform" target="_blank">
<div align="center"><b>��Ƹ�������ţ�<%=zpjhbh%>��</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ����Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">ʵ����Ƹ����</td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" value="" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ʵ����Ƹ��ʼʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">ʵ����Ƹ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">¼����</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">¼��ʱ��</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
     <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input name="zpjhbh" type="hidden" value="<%=zpjhbh%>">
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjzprs)=="") {
		alert("������[ʵ����Ƹ����]��");
		FormName.sjzprs.focus();
		return false;
	}
	if(!(isNumber(FormName.sjzprs, "ʵ����Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzpfy)=="") {
		alert("������[ʵ����Ƹ����]��");
		FormName.sjzpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzpfy, "ʵ����Ƹ����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("������[ʵ����Ƹ��ʼʱ��]��");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "ʵ����Ƹ��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("������[ʵ����Ƹ����ʱ��]��");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "ʵ����Ƹ����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("������[��ע��¼�뱻��Ƹ������ְλ]��");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
