<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpztbm=null;
String cpztmc=null;
String cplx=null;
String ghf=null;
String ztxh=null;
String wherecpztbm=cf.GB2Uni(request.getParameter("cpztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpztbm,cpztmc,cplx,ghf,ztxh ";
	ls_sql+=" from  dm_cpztbm";
	ls_sql+=" where  (cpztbm='"+wherecpztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpztbm=cf.fillNull(rs.getString("cpztbm"));
		cpztmc=cf.fillNull(rs.getString("cpztmc"));
		cplx=cf.fillNull(rs.getString("cplx"));
		ghf=cf.fillNull(rs.getString("ghf"));
		ztxh=cf.fillNull(rs.getString("ztxh"));
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
<form method="post" action="SaveEditDm_cpztbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ʒ״̬����</td> 
  <td width="32%"> 
    <input type="text" name="cpztbm" size="20" maxlength="2"  value="<%=cpztbm%>" >  </td>
  <td align="right" width="18%">��Ʒ״̬����</td> 
  <td width="32%"> 
    <input type="text" name="cpztmc" size="20" maxlength="50"  value="<%=cpztmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ����</td>
  <td><%
	cf.radioToken(out, "cplx","0+ȫ��&1+����Ʒ&2+��Ʒ",cplx);
%></td>
  <td align="right">������</td>
  <td><%
	cf.radioToken(out, "ghf","�׹�+�׹�&��˾��+��˾��",ghf);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">״̬���</td> 
  <td width="32%"><input type="text" name="ztxh" value="<%=ztxh%>" size="20" maxlength="8" ></td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<input type="hidden" name="wherecpztbm"  value="<%=wherecpztbm%>" >
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
	if(	javaTrim(FormName.cpztbm)=="") {
		alert("������[��Ʒ״̬����]��");
		FormName.cpztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpztmc)=="") {
		alert("������[��Ʒ״̬����]��");
		FormName.cpztmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.cplx)) {
		alert("��ѡ��[��Ʒ����]��");
		FormName.cplx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ghf)) {
		alert("��ѡ��[������]��");
		FormName.ghf[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ztxh)=="") {
		alert("������[״̬���]��");
		FormName.ztxh.focus();
		return false;
	}
	if(!(isNumber(FormName.ztxh, "״̬���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
