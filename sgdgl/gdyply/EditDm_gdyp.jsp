<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gdypbm=null;
String gdyp=null;
String dj=null;
String wheregdypbm=cf.GB2Uni(request.getParameter("gdypbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gdypbm,gdyp,dj ";
	ls_sql+=" from  dm_gdyp";
	ls_sql+=" where  (gdypbm='"+wheregdypbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gdypbm=cf.fillNull(rs.getString("gdypbm"));
		gdyp=cf.fillNull(rs.getString("gdyp"));
		dj=cf.fillNull(rs.getString("dj"));
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
<form method="post" action="SaveEditDm_gdyp.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������Ʒ����</td> 
  <td width="32%"> 
    <input type="text" name="gdypbm" size="20" maxlength="4"  value="<%=gdypbm%>" >  </td>
  <td align="right" width="18%">����</td> 
  <td width="32%"><input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������Ʒ</td> 
  <td colspan="3"><input type="text" name="gdyp" size="73" maxlength="50"  value="<%=gdyp%>" >    </td>
  </tr>
<input type="hidden" name="wheregdypbm"  value="<%=wheregdypbm%>" >
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
	if(	javaTrim(FormName.gdypbm)=="") {
		alert("������[������Ʒ����]��");
		FormName.gdypbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gdyp)=="") {
		alert("������[������Ʒ]��");
		FormName.gdyp.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
