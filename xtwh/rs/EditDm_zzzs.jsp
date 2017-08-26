<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zzzsbm=null;
String zzzs=null;
String zsfl=null;
String zsjb=null;
String fzdw=null;
String wherezzzsbm=cf.GB2Uni(request.getParameter("zzzsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zzzsbm,zzzs,zsfl,zsjb,fzdw ";
	ls_sql+=" from  dm_zzzs";
	ls_sql+=" where  (zzzsbm='"+wherezzzsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zzzsbm=cf.fillNull(rs.getString("zzzsbm"));
		zzzs=cf.fillNull(rs.getString("zzzs"));
		zsfl=cf.fillNull(rs.getString("zsfl"));
		zsjb=cf.fillNull(rs.getString("zsjb"));
		fzdw=cf.fillNull(rs.getString("fzdw"));
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
<form method="post" action="SaveEditDm_zzzs.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="40%" align="right"><span class="STYLE1">*</span>����֤����루2λ��</td>
  <td width="60%"><input type="text" name="zzzsbm" size="20" maxlength="2"  value="<%=zzzsbm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����֤������</td>
  <td><input type="text" name="zzzs" size="50" maxlength="50"  value="<%=zzzs%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">֤�����</td>
  <td><input type="text" name="zsfl"  size="50" maxlength="50" value="<%=zsfl%>"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">֤�鼶��</td>
  <td><input type="text" name="zsjb" size="50" maxlength="50" value="<%=zsjb%>"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��֤��λ</td>
  <td><input type="text" name="fzdw" size="50" maxlength="50" value="<%=fzdw%>"></td>
</tr>
<input type="hidden" name="wherezzzsbm"  value="<%=wherezzzsbm%>" >
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
	if(	javaTrim(FormName.zzzsbm)=="") {
		alert("������[����֤�����]��");
		FormName.zzzsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zzzs)=="") {
		alert("������[����֤��]��");
		FormName.zzzs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
