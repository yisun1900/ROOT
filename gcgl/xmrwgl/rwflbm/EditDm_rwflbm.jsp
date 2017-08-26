<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String rwflbm=null;
String rwflmc=null;
String dl=null;
String whererwflbm=cf.GB2Uni(request.getParameter("rwflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rwflbm,rwflmc,dl ";
	ls_sql+=" from  dm_rwflbm";
	ls_sql+=" where  (rwflbm='"+whererwflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		rwflmc=cf.fillNull(rs.getString("rwflmc"));
		dl=cf.fillNull(rs.getString("dl"));
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
<form method="post" action="SaveEditDm_rwflbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">����</td>
    <td><select name="dl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="rwflbm.value=this.value">
        <option value=""></option>
        <%
	cf.selectToken(out,"1+һ��&2+����&3+����&4+����&5+����&6+�µ�&7+���&8+�ͻ�&9+��װ",dl);
%>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����������(2λ)</td> 
  <td width="32%"> 
    <input type="text" name="rwflbm" size="20" maxlength="2"  value="<%=rwflbm%>" >  </td>
  <td align="right" width="17%">�����������</td> 
  <td width="33%"> 
    <input type="text" name="rwflmc" size="20" maxlength="50"  value="<%=rwflmc%>" >  </td>
</tr>
<input type="hidden" name="whererwflbm"  value="<%=whererwflbm%>" >
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
	if(	javaTrim(FormName.rwflbm)=="") {
		alert("������[����������]��");
		FormName.rwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.rwflmc)=="") {
		alert("������[�����������]��");
		FormName.rwflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dl)=="") {
		alert("��ѡ��[����]��");
		FormName.dl.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
