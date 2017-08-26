<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wgjbbm=null;
String xzzwbm=null;
String wherewgjbbm=cf.GB2Uni(request.getParameter("wgjbbm"));
String wherexzzwbm=cf.getParameter(request,"xzzwbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wgjbbm,xzzwbm ";
	ls_sql+=" from  gdm_cfry";
	ls_sql+=" where  (wgjbbm='"+wherewgjbbm+"') and  (xzzwbm='"+wherexzzwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wgjbbm=cf.fillNull(rs.getString("wgjbbm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
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
<form method="post" action="SaveEditGdm_cfry.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Υ�漶�����</td> 
  <td width="35%"> 
	<select name="wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <option value=""></option>
	  <%
cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm",wgjbbm);
%> 
	</select>
  </td>
  <td align="right" width="15%">������Աְ��</td> 
  <td width="35%"> 
	<select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <option value=""></option>
	  <%
cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xzzwbm);
%> 
	</select>
  </td>
</tr>
<input type="hidden" name="wherewgjbbm"  value="<%=wherewgjbbm%>" >
<input type="hidden" name="wherexzzwbm"  value="<%=wherexzzwbm%>" >
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
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("������[Υ�漶�����]��");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("������[������Աְ��]��");
		FormName.xzzwbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
