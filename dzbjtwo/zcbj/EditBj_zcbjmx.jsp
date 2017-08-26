<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

String zcmc=null;
String jldwbm=null;
String dj=null;
String sl=null;
String je=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcmc,jldwbm,dj,sl,je,bz ";
	ls_sql+=" from  bj_zcbjmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
		je=cf.fillNull(rs.getString("je"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBj_zcbjmx.jsp" name="editform">
  <div align="center">���ı�����ϸ</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��������</td>
      <td colspan="3"> 
        <input type="text" name="zcmc" size="71" maxlength="50"  value="<%=zcmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������λ</td>
      <td width="35%"> 
        <input type="text" name="jldwbm" size="20" maxlength="20"  value="<%=jldwbm%>" >
      </td>
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" onchange="calValue(editform)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="sl" size="20" maxlength="9"  value="<%=sl%>" onchange="calValue(editform)">
      </td>
      <td align="right" width="15%">���</td>
      <td width="35%"> 
        <input type="text" name="je" size="20" maxlength="17"  value="<%=je%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="70" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
		<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>">
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
function calValue(FormName)
{  
	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);

	FormName.je.value=je;
}    
function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.zcmc)=="") {
		alert("������[��������]��");
		FormName.zcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("������[������λ]��");
		FormName.jldwbm.focus();
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
	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("������[���]��");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
