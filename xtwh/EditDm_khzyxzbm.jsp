<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khzyxzbm=null;
String khzyxz=null;
String wherekhzyxzbm=cf.GB2Uni(request.getParameter("khzyxzbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khzyxzbm,khzyxz ";
	ls_sql+=" from  dm_khzyxzbm";
	ls_sql+=" where  (khzyxzbm='"+wherekhzyxzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khzyxzbm=cf.fillNull(rs.getString("khzyxzbm"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
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
<form method="post" action="SaveEditDm_khzyxzbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�ͻ���Դ���ʱ��루2λ��</td> 
  <td width="29%"> 
    <input type="text" name="khzyxzbm" size="20" maxlength="4"  value="<%=khzyxzbm%>" >
  </td>
  <td align="right" width="18%">�ͻ���Դ����</td> 
  <td width="32%"> 
    <input type="text" name="khzyxz" size="20" maxlength="20"  value="<%=khzyxz%>" >
  </td>
</tr>
<input type="hidden" name="wherekhzyxzbm"  value="<%=wherekhzyxzbm%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>
      </td>
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
	if(	javaTrim(FormName.khzyxzbm)=="") {
		alert("������[�ͻ���Դ���ʱ���]��");
		FormName.khzyxzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.khzyxz)=="") {
		alert("������[�ͻ���Դ����]��");
		FormName.khzyxz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
