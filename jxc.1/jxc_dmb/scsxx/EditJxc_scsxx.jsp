<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String scsbm=null;
String scsmc=null;
String scslb=null;
String wherescsbm=cf.GB2Uni(request.getParameter("scsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select scsbm,scsmc,scslb ";
	ls_sql+=" from  jxc_scsxx";
	ls_sql+=" where  (scsbm='"+wherescsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		scsbm=cf.fillNull(rs.getString("scsbm"));
		scsmc=cf.fillNull(rs.getString("scsmc"));
		scslb=cf.fillNull(rs.getString("scslb"));
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
<form method="post" action="SaveEditJxc_scsxx.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ�����</td>
  <td><%
	cf.radioToken(out, "scslb","1+����&2+����",scslb);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>Ʒ������</td> 
  <td><input type="text" name="scsmc" size="50" maxlength="50"  value="<%=scsmc%>" ></td>
  </tr>
    <tr> 
      <td colspan="2" >
	<div align="center">
		<input type="hidden" name="wherescsbm"  value="<%=wherescsbm%>" >
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
	if(	!radioChecked(FormName.scslb)) {
		alert("��ѡ��[Ʒ�����]��");
		FormName.scslb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.scsmc)=="") {
		alert("������[Ʒ������]��");
		FormName.scsmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
