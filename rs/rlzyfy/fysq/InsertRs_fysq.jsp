<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_fysq.jsp" name="insertform" target="_blank">
<div align="center">���·���Ԥ������</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">����ֹ�˾</td>
    <td width="35%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','F0') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('A0','F0') and cxbz='N' order by dwlx,dwbh","");
	}
%>
    </select>
    </td>
    <td align="right" width="15%">����ʱ��</td>
    <td width="35%"><input type="text" name="sqsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">��������</td>
    <td width="35%"><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="01">��Ƹ��</option>
      <option value="02">��ѵ��</option>
      <option value="03">������</option>
      <option value="04">������</option>
      <option value="05">��ᱣ�շ�</option>
      <option value="06">������</option>
      <option value="07">��������</option>
    </select>
    </td>
    <td align="right" width="15%">��;��ʽ</td>
    <td width="35%"><input type="text" name="ytxs" value="" size="20" maxlength="100" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">����</td>
    <td width="35%"><input type="text" name="fy" value="" size="20" maxlength="9" >
    </td>
	<td>&nbsp;</td><td>&nbsp;</td>
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
  <td colspan="3"> 
	<textarea name="bz" cols="69" rows="3"></textarea>  </td>
  </tr>

  <tr align="center">
    <td colspan="4"><input name="button" type="button" onClick="f_do(insertform)"  value="����">
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
	if(	javaTrim(FormName.fgs)=="") {
		alert("������[����ֹ�˾]��");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("������[����ʱ��]��");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.xqlx)=="") {
		alert("��ѡ��[��������]��");
		FormName.xqlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ytxs)=="") {
		alert("������[��;��ʽ]��");
		FormName.ytxs.focus();
		return false;
	}
	if(	javaTrim(FormName.fy)=="") {
		alert("������[����]��");
		FormName.fy.focus();
		return false;
	}
	if(!(isFloat(FormName.fy, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.button.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
