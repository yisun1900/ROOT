<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfdxbm=null;
String hfdxmc=null;
String hfdxflbm=null;
String xh=null;
String wherehfdxbm=cf.GB2Uni(request.getParameter("hfdxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hfdxbm,hfdxmc,hfdxflbm,xh ";
	ls_sql+=" from  hdm_hfdxbm";
	ls_sql+=" where  (hfdxbm='"+wherehfdxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdxbm=cf.fillNull(rs.getString("hfdxbm"));
		hfdxmc=cf.fillNull(rs.getString("hfdxmc"));
		hfdxflbm=cf.fillNull(rs.getString("hfdxflbm"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditHdm_hfdxbm.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">�طö������</td>
  <td><select name="hfdxflbm" style="FONT-SIZE:12PX;WIDTH:362PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hfdxflbm,hfdxflmc from hdm_hfdxflbm order by hfdxflbm",hfdxflbm);
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">�طö������</td> 
  <td width="70%"> 
    <input type="text" name="hfdxbm" size="20" maxlength="4"  value="<%=hfdxbm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�طö�������</td>
  <td><input type="text" name="hfdxmc" size="50" maxlength="50"  value="<%=hfdxmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">���</td> 
  <td width="70%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >  </td>
  </tr>
<input type="hidden" name="wherehfdxbm"  value="<%=wherehfdxbm%>" >
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
	if(	javaTrim(FormName.hfdxbm)=="") {
		alert("������[�طö������]��");
		FormName.hfdxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxmc)=="") {
		alert("������[�طö�������]��");
		FormName.hfdxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxflbm)=="") {
		alert("��ѡ��[�طö������]��");
		FormName.hfdxflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
