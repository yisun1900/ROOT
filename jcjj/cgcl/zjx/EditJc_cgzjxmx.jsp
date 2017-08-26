<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String zjxxh=null;
String lx=null;
String zjxm=null;
String zjsl=null;
double zqdj=0;
double zqzjje=0;
double dj=0;
double zjje=0;

double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;

String bz=null;
String wherexh=request.getParameter("xh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ddbh,zjxxh,lx,zjxm,zjsl,zqdj,zqzjje,zjje,dj,zjje,bz ";
	ls_sql+=" from  jc_cgzjxmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		lx=cf.fillNull(rs.getString("lx"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		zjsl=cf.fillNull(rs.getString("zjsl"));
		zqdj=rs.getDouble("zqdj");
		zqzjje=rs.getDouble("zqzjje");
		dj=rs.getDouble("dj");
		zjje=rs.getDouble("zjje");
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();


	ls_sql="select jc_cgzjx.cgzkl,jc_cgzjx.tmzkl,jc_cgzjx.wjzkl,jc_cgzjx.dqzkl";
	ls_sql+=" from  jc_cgzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_cgzjxmx.jsp" name="editform">
<div align="center">���޸ĳ�����������ϸ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1"><span class="STYLE2">*</span>�������</span></td> 
  <td width="33%"> 
    <input type="text" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" readonly>  </td>
  <td width="17%" align="right" class="STYLE1"><span class="STYLE2">*</span>���������</td> 
  <td width="33%"> 
    <input type="text" name="zjxxh" size="20" maxlength="8"  value="<%=zjxxh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>����</td> 
  <td colspan="3"> 
<%
	cf.radioToken(out, "lx","1+����&2+̨��&3+���&4+����",lx);
%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">*</span>������Ŀ</td>
  <td colspan="3"><input type="text" name="zjxm" size="73" maxlength="100"  value="<%=zjxm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE2">*</span>��������</td> 
  <td width="33%"> 
    <input type="text" name="zjsl" size="20" maxlength="8"  value="<%=zjsl%>" onChange="f_jsjg(editform)">  </td>
  <td align="right" width="17%">&nbsp;</td> 
  <td width="33%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span></span>��ǰ������</td>
  <td><input type="text" name="zqdj" value="<%=zqdj%>" size="20" maxlength="17"  onChange="f_jsjg(editform)"></td>
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>�ۺ󣭵���</span></td>
  <td><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" onChange="f_jsjg(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>��ǰ���������</span></td>
  <td><input type="text" name="zqzjje" value="<%=zqzjje%>" size="20" maxlength="17" readonly onChange="f_jsjg(editform)"></td>
  <td align="right"><span class="STYLE1"><span class="STYLE2">*</span>�ۺ��������</span></td>
  <td><input type="text" name="zjje" size="20" maxlength="17"  value="<%=zjje%>" readonly onChange="f_jsjg(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" align="center"> 
	<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����"></td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//����FormName:Form������
{
	var dj;
	if (FormName.lx[0].checked)//1�����壻2��̨�棻3�����4������
	{
		dj=FormName.zqdj.value*<%=cgzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}
	else if (FormName.lx[1].checked)//1�����壻2��̨�棻3�����4������
	{
		dj=FormName.zqdj.value*<%=tmzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}
	else if (FormName.lx[2].checked)//1�����壻2��̨�棻3�����4������
	{
		dj=FormName.zqdj.value*<%=wjzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}
	else if (FormName.lx[3].checked)//1�����壻2��̨�棻3�����4������
	{
		dj=FormName.zqdj.value*<%=dqzkl%>/10;
		dj=round(dj,2);
		FormName.dj.value=dj;
	}


	var zqzjje=FormName.zjsl.value*FormName.zqdj.value;
	zqzjje=round(zqzjje,2);
	FormName.zqzjje.value=zqzjje;

	var zjje=FormName.zjsl.value*FormName.dj.value;
	zjje=round(zjje,2);
	FormName.zjje.value=zjje;
}
function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "���������"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("������[������Ŀ]��");
		FormName.zjxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zjsl)=="") {
		alert("������[��������]��");
		FormName.zjsl.focus();
		return false;
	}
	if(!(isInt(FormName.zjsl, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.zqdj)=="") {
		alert("������[��ǰ����]��");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "��ǰ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}

	if(	javaTrim(FormName.zqzjje)=="") {
		alert("������[��ǰ�������]��");
		FormName.zqzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqzjje, "��ǰ�������"))) {
		return false;
	}
	if (FormName.zqzjje.value=="0")
	{
		alert("������[��ǰ�������]��");
		FormName.zqzjje.focus();
		return false;
	}

	if(	javaTrim(FormName.zjje)=="") {
		alert("������[�������]��");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "�������"))) {
		return false;
	}
	if (FormName.zjje.value=="0")
	{
		alert("������[�������]��");
		FormName.zjje.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
