<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
int tssl=0;
String xtdxh=null;
String tsjlh=null;
String wheretsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tsjlh,xtdxh ";
	ls_sql+=" from  crm_tsbxxtd";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		xtdxh=rs.getString("xtdxh");
		out.print("<font color=red>�ͻ�["+khbh+"]�Ѿ�¼��������Э�������������Ȳ鿴�������ظ�¼��</font><br>");
		tsjlh=rs.getString(1);
		out.print("<a href=\"ViewCrm_tsbxxtd.jsp?tsjlh="+tsjlh+"&xtdxh="+xtdxh+"\" target=\"_back\">"+tsjlh+"</a><br>");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_tsbxxtd.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Ͷ�߱��޼�¼��</td> 
  <td width="35%"> 
    <input type="text" name="tsjlh" value="<%=wheretsjlh%>" size="20" maxlength="9" readonly>  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>Э��ԭ��</td> 
  <td colspan="3">
  <textarea name="xtyy" cols="72" rows="5"></textarea>
</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>Э������</td> 
  <td width="35%"> 
    <input type="text" name="xtrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%"><font color="#FF0033">*</font>Э������</td> 
  <td width="35%"><input type="text" name="xtfy" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>Э���ֹ�˾</td> 
  <td width="35%">
  <select name="xtfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform);" >
   <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','F0') ","");
%> 
</select> </td>
  <td align="right" width="15%"><font color="#FF0033">*</font>Э������</td> 
  <td width="35%">
  <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
<option value=""></option>
</select> </td>
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
<%
	//����Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.xtbm.length=1;

	if (FormName.xtfgs.value=="")
	{
		return;
	}

//	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F1','F2') and ssdw='"+FormName.xtfgs.value+"' order by dwbh";
	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.xtfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}
function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.xtbm,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("������[Ͷ�߱��޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xtyy)=="") {
		alert("������[Э��ԭ��]��");
		FormName.xtyy.focus();
		return false;
	}
	if(	javaTrim(FormName.xtrq)=="") {
		alert("������[Э������]��");
		FormName.xtrq.focus();
		return false;
	}
	if(	javaTrim(FormName.xtfgs)=="") {
		alert("������[Э���ֹ�˾]��");
		FormName.xtfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.xtbm)=="") {
		alert("������[Э������]��");
		FormName.xtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xtfy)=="") {
		alert("������[Э������]��");
		FormName.xtfy.focus();
		return false;
	}
	if(!(isDatetime(FormName.xtrq, "Э������"))) {
		return false;
	}
	if(!(isFloat(FormName.xtfy, "Э������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>