<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gqtzyybm=null;
String gqtzyymc=null;
String lx=null;
String wheregqtzyybm=cf.GB2Uni(request.getParameter("gqtzyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gqtzyybm,gqtzyymc,lx ";
	ls_sql+=" from  dm_gqtzyybm";
	ls_sql+=" where  (gqtzyybm='"+wheregqtzyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gqtzyybm=cf.fillNull(rs.getString("gqtzyybm"));
		gqtzyymc=cf.fillNull(rs.getString("gqtzyymc"));
		lx=cf.fillNull(rs.getString("lx"));
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
<form method="post" action="SaveEditDm_gqtzyybm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ڵ���ԭ�����</td> 
  <td> 
    <input type="text" name="gqtzyybm" size="20" maxlength="3"  value="<%=gqtzyybm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���ڵ���ԭ������</td>
  <td><input type="text" name="gqtzyymc" size="50" maxlength="50"  value="<%=gqtzyymc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td> 
<%
	cf.radioToken(out, "lx","1+����&2+��������&3+���ں�������",lx);
%>      </td>
  </tr>
<input type="hidden" name="wheregqtzyybm"  value="<%=wheregqtzyybm%>" >
    <tr> 
      <td colspan="2" >
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
	if(	javaTrim(FormName.gqtzyybm)=="") {
		alert("������[���ڵ���ԭ�����]��");
		FormName.gqtzyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.gqtzyymc)=="") {
		alert("������[���ڵ���ԭ������]��");
		FormName.gqtzyymc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
