<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcysbbh=null;
String gcysbbmc=null;
String sfzybb=null;
String bz=null;
String wheregcysbbh=cf.GB2Uni(request.getParameter("gcysbbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gcysbbh,gcysbbmc,sfzybb,bz ";
	ls_sql+=" from  dm_hegcysbb";
	ls_sql+=" where  (gcysbbh='"+wheregcysbbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcysbbh=cf.fillNull(rs.getString("gcysbbh"));
		gcysbbmc=cf.fillNull(rs.getString("gcysbbmc"));
		sfzybb=cf.fillNull(rs.getString("sfzybb"));
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
<form method="post" action="SaveEditDm_hegcysbb.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���հ汾��</td> 
  <td width="32%"> 
    <input type="text" name="gcysbbh" size="20" maxlength="5"  value="<%=gcysbbh%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ����ð汾</td> 
  <td width="32%"><select name="sfzybb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"1+δ����&2+��ǰ��&3+���ð�&4+��ͣ��",sfzybb);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���հ汾����</td>
  <td colspan="3"><input type="text" name="gcysbbmc" size="73" maxlength="50"  value="<%=gcysbbmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheregcysbbh"  value="<%=wheregcysbbh%>" >
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("������[���հ汾��]��");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysbbmc)=="") {
		alert("������[���հ汾����]��");
		FormName.gcysbbmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sfzybb)=="") {
		alert("��ѡ��[�Ƿ����ð汾]��");
		FormName.sfzybb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
