<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mbbm=null;
String rwbm=null;
String rwsfsj=null;
String rwts=null;
String rwxh=null;
String wherembbm=cf.GB2Uni(request.getParameter("mbbm"));
String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mbbm,rwbm,rwsfsj,rwts,rwxh ";
	ls_sql+=" from  gdm_mbsjjd";
	ls_sql+=" where  (mbbm='"+wherembbm+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mbbm=cf.fillNull(rs.getString("mbbm"));
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwsfsj=cf.fillNull(rs.getString("rwsfsj"));
		rwts=cf.fillNull(rs.getString("rwts"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
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
<form method="post" action="SaveEditGdm_mbsjjd.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">ģ�����</td> 
  <td width="37%"> 
    <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:252PX">
<%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb where mbbm='"+mbbm+"'",mbbm);
%>
    </select>  </td>
  <td align="right" width="13%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><select name="rwbm" style="FONT-SIZE:12PX;WIDTH:252PX">
    <%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm where rwbm='"+rwbm+"'",rwbm);
%>
  </select></td>
  <td align="right">�������</td>
  <td><input type="text" name="rwxh" size="20" maxlength="8"  value="<%=rwxh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������ʱ��</td>
  <td><input type="text" name="rwsfsj" size="20" maxlength="8"  value="<%=rwsfsj%>" ></td>
  <td align="right">��������</td>
  <td><input type="text" name="rwts" size="20" maxlength="8"  value="<%=rwts%>" ></td>
</tr>

<input type="hidden" name="wherembbm"  value="<%=wherembbm%>" >
<input type="hidden" name="whererwbm"  value="<%=whererwbm%>" >
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
	if(	javaTrim(FormName.mbbm)=="") {
		alert("��ѡ��[ģ�����]��");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.rwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwsfsj)=="") {
		alert("������[������ʱ��]��");
		FormName.rwsfsj.focus();
		return false;
	}
	if(!(isNumber(FormName.rwsfsj, "������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.rwts)=="") {
		alert("������[��������]��");
		FormName.rwts.focus();
		return false;
	}
	if(!(isNumber(FormName.rwts, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.rwxh)=="") {
		alert("������[�������]��");
		FormName.rwxh.focus();
		return false;
	}
	if(!(isNumber(FormName.rwxh, "�������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
