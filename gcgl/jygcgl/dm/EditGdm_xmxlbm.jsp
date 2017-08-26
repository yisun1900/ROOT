<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmxlbm=null;
String xmxlmc=null;
String xmdlbm=null;
String wherexmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmxlbm,xmxlmc,xmdlbm ";
	ls_sql+=" from  gdm_xmxlbm";
	ls_sql+=" where  (xmxlbm='"+wherexmxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		xmxlmc=cf.fillNull(rs.getString("xmxlmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
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
<form method="post" action="SaveEditGdm_xmxlbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ĿС�����</td> 
  <td width="35%"> 
    <input type="text" name="xmxlbm" size="20" maxlength="4"  value="<%=xmxlbm%>" >
  </td>
  <td align="right" width="15%">��ĿС������</td> 
  <td width="35%"> 
    <input type="text" name="xmxlmc" size="20" maxlength="50"  value="<%=xmxlmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ŀ�������</td> 
  <td width="35%"> 
    <select name="xmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xmdlbm,xmdlmc from gdm_xmdlbm order by xmdlbm",xmdlbm);
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherexmxlbm"  value="<%=wherexmxlbm%>" >
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
	if(	javaTrim(FormName.xmxlbm)=="") {
		alert("������[��ĿС�����]��");
		FormName.xmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmxlmc)=="") {
		alert("������[��ĿС������]��");
		FormName.xmxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xmdlbm)=="") {
		alert("��ѡ��[��Ŀ�������]��");
		FormName.xmdlbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
