<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");


Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String lqjlh=null;
try {
	conn=cf.getConnection();

	stmt = conn.createStatement();
	int count=0;
	ls_sql="select NVL(max(substr(lqjlh,6,6)),0)";
	ls_sql+=" from  crm_htlqjl";
	ls_sql+=" where fgsbh='"+ssfgs+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	lqjlh=ssfgs+cf.addZero(count+1,6);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_htlqjl.jsp" name="insertform" target="_blank">
<div align="center">��ͬ��ȡ��¼</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">��ȡ�ֹ�˾</span></td>
  <td><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>��ȡ����</td>
  <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">��ȡ��¼��</span></td> 
  <td width="35%"> 
    <input type="text" name="lqjlh" value="<%=lqjlh%>" size="20" maxlength="11" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>��ȡ����</td> 
  <td width="35%"> 
    <input type="text" name="lqsl" value="" size="20" maxlength="8" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>��ȡ��</td> 
  <td width="35%"> 
    <input type="text" name="lqr" value="" size="20" maxlength="20" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>��ȡʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lqsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>��ʼ��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="qshth" value="" size="20" maxlength="20" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>��ֹ��ͬ��</td> 
  <td width="35%"> 
    <input type="text" name="zzhth" value="" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ�� </span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.lqjlh)=="") {
		alert("������[��ȡ��¼��]��");
		FormName.lqjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.lqsl)=="") {
		alert("������[��ȡ����]��");
		FormName.lqsl.focus();
		return false;
	}
	if(!(isNumber(FormName.lqsl, "��ȡ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��ȡ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[��ȡ�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.lqr)=="") {
		alert("������[��ȡ��]��");
		FormName.lqr.focus();
		return false;
	}
	if(	javaTrim(FormName.lqsj)=="") {
		alert("������[��ȡʱ��]��");
		FormName.lqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lqsj, "��ȡʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.qshth)=="") {
		alert("������[��ʼ��ͬ��]��");
		FormName.qshth.focus();
		return false;
	}
	if(	javaTrim(FormName.zzhth)=="") {
		alert("������[��ֹ��ͬ��]��");
		FormName.zzhth.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
