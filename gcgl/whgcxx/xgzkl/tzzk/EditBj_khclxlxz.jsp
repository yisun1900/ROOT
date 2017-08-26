<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String clxlmc=null;
String cldlmc=null;
String sfxzsl=null;
double tcslxz=0;
double ccbfjj=0;
String sfkjm=null;
double yxjmzdsl=0;
String clxlbm=cf.GB2Uni(request.getParameter("clxlbm"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl ";
	ls_sql+=" from  bj_khclxlxz";
	ls_sql+=" where  (khbh='"+khbh+"' and clxlbm='"+clxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clxlmc=cf.fillNull(rs.getString("clxlmc"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcslxz=rs.getDouble("tcslxz");
		ccbfjj=rs.getDouble("ccbfjj");
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBj_khclxlxz.jsp" name="editform">
<div align="center">���޸ģ��ͻ�����С����������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>����С�����</td> 
  <td width="32%"> 
    <input type="text" name="clxlbm" size="10" maxlength="4"  value="<%=clxlbm%>" readonly>�������޸ģ�  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����С������</td>
  <td colspan="3"><input type="text" name="clxlmc" size="73" maxlength="50"  value="<%=clxlmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td><%
	cf.radioToken(out, "sfxzsl","1+������&2+���ܳ���&3+�ɳ�����Ӽ�",sfxzsl);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������</td>
  <td><input name="tcslxz" type="text" value="<%=tcslxz%>" size="20" maxlength="16"></td>
  <td align="right">�������ּӼ�</td>
  <td><input name="ccbfjj" type="text" value="<%=ccbfjj%>" size="20" maxlength="16"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ����Ƽ�������</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkjm","1+������&2+����",sfkjm);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������������</td>
  <td><input name="yxjmzdsl" type="text" value="<%=yxjmzdsl%>" size="20" maxlength="16"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("������[����С�����]��");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlmc)=="") {
		alert("������[����С������]��");
		FormName.clxlmc.focus();
		return false;
	}
 

	if(	!radioChecked(FormName.sfxzsl)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfxzsl[0].focus();
		return false;
	}

	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.tcslxz)!="" && parseFloat(FormName.tcslxz.value)!=0 ) {
			alert("�������������ƣ�����Ҫ[��������]��");
			FormName.tcslxz.select();
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && parseFloat(FormName.ccbfjj.value)!=0 ) {
			alert("�������������ƣ�����Ҫ[�������ּӼ�]��");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else if (FormName.sfxzsl[1].checked)
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("�����������ܳ�������������[��������]��");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)!="" && parseFloat(FormName.ccbfjj.value)!=0 ) {
			alert("�����������ܳ���������Ҫ[�������ּӼ�]��");
			FormName.ccbfjj.select();
			return false;
		}
	}
	else
	{
		if(	javaTrim(FormName.tcslxz)=="") {
			alert("���������ɳ�����Ӽۣ���������[��������]��");
			FormName.tcslxz.focus();
			return false;
		}
		if(!(isFloat(FormName.tcslxz, "��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ccbfjj)=="") {
			alert("���������ɳ�����Ӽۣ���������[�������ּӼ�]��");
			FormName.ccbfjj.focus();
			return false;
		}
		if(!(isFloat(FormName.ccbfjj, "�������ּӼ�"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ����Ƽ�������]��");
		FormName.sfkjm[0].focus();
		return false;
	}

	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("��������[��������������]��");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "��������������"))) {
			return false;
		}
	}
	else{
		FormName.yxjmzdsl.value="";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
