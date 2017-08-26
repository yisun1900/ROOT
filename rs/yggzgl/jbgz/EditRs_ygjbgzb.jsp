<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String bianhao=null;
String yhmc=null;

String gzlb="";
String khgz="";
String jbgz="";
String gwgz="";
String glgz="";
String jtbt="";
String dhbt="";
String cb="";
String buzhu="";
String bz="";
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ygbh,bianhao,yhmc ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select  gzlb,khgz,jbgz,gwgz,glgz,jtbt,dhbt,cb,buzhu,bz ";
	ls_sql+=" from  rs_ygjbgzb";
	ls_sql+=" where ygbh="+whereygbh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gzlb=cf.fillNull(rs.getString("gzlb"));
		khgz=cf.fillNull(rs.getString("khgz"));
		jbgz=cf.fillNull(rs.getString("jbgz"));
		gwgz=cf.fillNull(rs.getString("gwgz"));
		glgz=cf.fillNull(rs.getString("glgz"));
		jtbt=cf.fillNull(rs.getString("jtbt"));
		dhbt=cf.fillNull(rs.getString("dhbt"));
		cb=cf.fillNull(rs.getString("cb"));
		buzhu=cf.fillNull(rs.getString("buzhu"));
		bz=cf.fillNull(rs.getString("bz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_ygjbgzb.jsp" name="editform">
<div align="center">ά����������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ա�����</td> 
  <td width="32%"> 
    <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"> 
    <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ա������</td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�������</td>
  <td><%
	cf.radioToken(out, "gzlb","1+�̶�����&2+��������",gzlb);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ч���ʻ���</td> 
  <td width="32%"> 
    <input type="text" name="khgz" size="20" maxlength="17"  value="<%=khgz%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="jbgz" size="20" maxlength="17"  value="<%=jbgz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��λ����</td> 
  <td width="32%"> 
    <input type="text" name="gwgz" size="20" maxlength="17"  value="<%=gwgz%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���乤��</td> 
  <td width="32%"> 
    <input type="text" name="glgz" size="20" maxlength="17"  value="<%=glgz%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��ͨ����</td> 
  <td width="32%"> 
    <input type="text" name="jtbt" size="20" maxlength="17"  value="<%=jtbt%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>ͨѶ����</td> 
  <td width="32%"> 
    <input type="text" name="dhbt" size="20" maxlength="17"  value="<%=dhbt%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="cb" size="20" maxlength="17"  value="<%=cb%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="buzhu" size="20" maxlength="17"  value="<%=buzhu%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="2"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.gzlb)) {
		alert("��ѡ��[�������]��");
		FormName.gzlb[0].focus();
		return false;
	}

	if(	javaTrim(FormName.khgz)=="") {
		alert("������[��Ч���ʻ���]��");
		FormName.khgz.focus();
		return false;
	}
	if(!(isFloat(FormName.khgz, "��Ч���ʻ���"))) {
		return false;
	}
	if(	javaTrim(FormName.jbgz)=="") {
		alert("������[��������]��");
		FormName.jbgz.focus();
		return false;
	}
	if(!(isFloat(FormName.jbgz, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.gwgz)=="") {
		alert("������[��λ����]��");
		FormName.gwgz.focus();
		return false;
	}
	if(!(isFloat(FormName.gwgz, "��λ����"))) {
		return false;
	}
	if(	javaTrim(FormName.glgz)=="") {
		alert("������[���乤��]��");
		FormName.glgz.focus();
		return false;
	}
	if(!(isFloat(FormName.glgz, "���乤��"))) {
		return false;
	}
	if(	javaTrim(FormName.jtbt)=="") {
		alert("������[��ͨ����]��");
		FormName.jtbt.focus();
		return false;
	}
	if(!(isFloat(FormName.jtbt, "��ͨ����"))) {
		return false;
	}
	if(	javaTrim(FormName.dhbt)=="") {
		alert("������[ͨѶ����]��");
		FormName.dhbt.focus();
		return false;
	}
	if(!(isFloat(FormName.dhbt, "ͨѶ����"))) {
		return false;
	}
	if(	javaTrim(FormName.cb)=="") {
		alert("������[��������]��");
		FormName.cb.focus();
		return false;
	}
	if(!(isFloat(FormName.cb, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.buzhu)=="") {
		alert("������[��������]��");
		FormName.buzhu.focus();
		return false;
	}
	if(!(isFloat(FormName.buzhu, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
