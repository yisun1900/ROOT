<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>���ڸ�ʽ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<!-- ʱ��ؼ� -->
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<LINK HREF='/js/JSCalendar.css' REL='stylesheet' TYPE='text/css'>
</head>

<body bgcolor="#FFFFFF">
<center>���ܷ���(��װǩԼʱ��)<br></center>
<table width="82%" align="center">
  <tr>
 
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>



<td>
<form method="post"  name="selectform">


          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td align="right" width="17%" height="24">�ֹ�˾</td>
            <td width="32%" height="24"> 
              <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
              </select> </td>
            <td width="13%" height="24">ǩԼ����</td>
            <td width="38%" height="24"> 
              <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td><div align="right">��ʼ����</div></td>
            <td><input name="sjfw" id="time12" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            <td>��������</td>
            <td><input name="sjfw2" id="time23" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="4"> <div align="left">
                &nbsp; &nbsp; &nbsp; &nbsp;��ʾ���:  <input type="radio" name="xsfg" value="1" checked>
        ��ҳ 
        <input type="radio" name="xsfg" value="2">
        EXCEL</div></td>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="4" align="center"> <input name="button" type="button"  value="���ܷ���" onClick="f_do(selectform)"> 
              <input name="button" type="button"  value="�Ҿӱ���" onClick="f_do1(selectform)"> 
              <!-- <input name="button" type="button"  value="ľ�ű���" onClick="f_do2(selectform)"> 
              <input name="button" type="button"  value="���񱨱�" onClick="f_do3(selectform)"> 
              <input name="button" type="button"  value="�Ҿ߱���" onClick="f_do4(selectform)"> 
              <input name="button" type="button"  value="���ı���" onClick="f_do5(selectform)">  -->
              <input name="reset" type="reset"  value=" �� �� "> </td>
          </tr>
        </table>
		  </form>  
	  </div>
    </td>
  </tr>
</table>
</p>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)
{
	if(	javaTrim(FormName.sjfw)=="") {
			alert("������[��ʼ����]��");
			FormName.sjfw.focus();
			return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��������]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��������"))) {
		return false;
	}
	
	FormName.action="Jzfzbb.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_do1(FormName)
{
	if(	javaTrim(FormName.sjfw)=="") {
			alert("������[��ʼ����]��");
			FormName.sjfw.focus();
			return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��������]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��������"))) {
		return false;
	}
	
	FormName.action="Jzfzbb.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_do2(FormName)
{
	if(	javaTrim(FormName.sjfw)=="") {
			alert("������[��ʼ����]��");
			FormName.sjfw.focus();
			return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��������]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��������"))) {
		return false;
	}
	if(FormName.lxbb[0].checked)
	{
		FormName.action="Jjmmbblist.jsp";
		
	}
	else
	{
		FormName.action="Jjmmptbblist.jsp";
	}
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_do3(FormName)
{
	if(	javaTrim(FormName.sjfw)=="") {
			alert("������[��ʼ����]��");
			FormName.sjfw.focus();
			return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��������]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��������"))) {
		return false;
	}
	if(FormName.lxbb[0].checked)
	{
		FormName.action="Jjcgbblist.jsp";
		
	}
	else
	{
		FormName.action="Jjcgptbblist.jsp";
	}
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_do4(FormName)
{
	if(	javaTrim(FormName.sjfw)=="") {
			alert("������[��ʼ����]��");
			FormName.sjfw.focus();
			return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��������]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��������"))) {
		return false;
	}
	if(FormName.lxbb[0].checked)
	{
		FormName.action="Jjjjtbblist.jsp";
		
	}
	else
	{
		FormName.action="Jjjjptbblist.jsp";
	}
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_do5(FormName)
{
	if(	javaTrim(FormName.sjfw)=="") {
			alert("������[��ʼ����]��");
			FormName.sjfw.focus();
			return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[��������]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "��ʼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "��������"))) {
		return false;
	}
	if(FormName.lxbb[0].checked)
	{
		FormName.action="Jjzctbblist.jsp";
		
	}
	else
	{
		FormName.action="Jjzcptbblist.jsp";
	}
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>