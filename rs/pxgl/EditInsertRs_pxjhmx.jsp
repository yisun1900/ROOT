<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String pxjhbh=cf.GB2Uni(request.getParameter("wherepxjhbh"));
String pxjhmc=cf.GB2Uni(request.getParameter("pxjhmc"));
String yhmc=(String)session.getAttribute("yhmc");
//String dwbh=cf.executeQuery("select dwbh from cl_clsgd where sgph='"+sgph+"'");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String pxmxbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(pxmxbh,9,3)),0)";
	ls_sql+=" from  rs_pxjhmx";
	ls_sql+=" where pxjhbh='"+pxjhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	pxmxbh=pxjhbh+cf.addZero(count,3);
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
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
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><b>��ѵ�ƻ���ϸ��<%=pxjhmc%>��<%=pxmxbh%>��</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxrs" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxfy" value="" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>��ѵ����</td> 
  <td width="35%"> 
   ��ѵ<INPUT TYPE="radio" NAME="pxlx" value="0">
   ��ѵ<INPUT TYPE="radio" NAME="pxlx" value="1">
  </td>
  <td align="right" width="15%">��ѵ��ʦ</td> 
  <td width="35%"> 
    <input type="text" name="pxjs" value="" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>�ڿ���ʽ</td> 
  <td width="35%"> 
    <select name="skxs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select skxs,skxsmc from rs_pxskxsbm order by skxs","");
	%> 
    </select>
  </td>
  <td align="right" width="15%"><font color=red>*</font>�γ�����</td> 
  <td width="35%"> 
    <select name="kclx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<%
	cf.selectItem(out,"select kclx,lxmc  from rs_pxkclxbm order by kclx","");
	%> 
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ����</td> 
  <td width="35%"> 
    <input type="text" name="pxcd" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>�߲�����</td> 
  <td width="35%"> 
    <input type="text" name="gcrs" value="0" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>�в�����</td> 
  <td width="35%"> 
    <input type="text" name="zcrs" value="0" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>��������</td> 
  <td width="35%"> 
    <input type="text" name="jcrs" value="0" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>��ѵ��ʼʱ��</td> 
  <td width="35%"> 
    <input type="text" name="pxkssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"><font color=red>*</font>��ѵ����ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="pxjssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=blue>¼����</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color=blue>¼��ʱ��</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�γ�����</td> 
  <td width="35%" colspan="3"> 
    <textarea name="kcnr" cols="71" rows=""></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ѵ�γ�</td> 
  <td width="35%" colspan="3"> 
    <textarea name="pxkc" cols="71" rows=""></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4">
	<input name="pxjhbh" type="hidden" value="<%=pxjhbh%>">
    <input name="pxmxbh" type="hidden" value="<%=pxmxbh%>">
	<input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
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
	if(	javaTrim(FormName.pxrs)=="") {
		alert("������[��ѵ����]��");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.pxrs, "��ѵ����"))) {
		return false;
	}
	if(	javaTrim(FormName.pxfy)=="") {
		alert("������[��ѵ����]��");
		FormName.pxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.pxfy, "��ѵ����"))) {
		return false;
	}
	if(	!radioChecked(FormName.pxlx)) {
		alert("��ѡ��[��ѵ����]��");
		FormName.pxlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.skxs)=="") {
		alert("��ѡ��[�ڿ���ʽ]��");
		FormName.skxs.focus();
		return false;
	}
	if(	javaTrim(FormName.kclx)=="") {
		alert("��ѡ��[�γ�����]��");
		FormName.kclx.focus();
		return false;
	}
	if(	javaTrim(FormName.gcrs)=="") {
		alert("������[�߲�����]��");
		FormName.gcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gcrs, "�߲�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zcrs)=="") {
		alert("������[�в�����]��");
		FormName.zcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.zcrs, "�в�����"))) {
		return false;
	}
	if(	javaTrim(FormName.jcrs)=="") {
		alert("������[��������]��");
		FormName.jcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.jcrs, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.pxkssj)=="") {
		alert("������[��ѵ��ʼʱ��]��");
		FormName.pxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxkssj, "��ѵ��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.pxjssj)=="") {
		alert("������[��ѵ����ʱ��]��");
		FormName.pxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxjssj, "��ѵ����ʱ��"))) {
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
	FormName.action="SaveInsertRs_pxjhmx.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
