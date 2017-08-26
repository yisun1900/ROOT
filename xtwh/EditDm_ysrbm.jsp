<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ysrbm=null;
String ysrmc=null;
String ysrxx=null;
String ysrsx=null;
String whereysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ysrbm,ysrmc,ysrxx,ysrsx ";
	ls_sql+=" from  dm_ysrbm";
	ls_sql+=" where  (ysrbm='"+whereysrbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		ysrmc=cf.fillNull(rs.getString("ysrmc"));
		ysrxx=cf.fillNull(rs.getString("ysrxx"));
		ysrsx=cf.fillNull(rs.getString("ysrsx"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditDm_ysrbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrbm" size="20" maxlength="2"  value="<%=ysrbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrmc" size="20" maxlength="50"  value="<%=ysrmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrxx" size="20" maxlength="17"  value="<%=ysrxx%>" >
  </td>
  <td width="15%"> 
    <div align="right">����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrsx" size="20" maxlength="17"  value="<%=ysrsx%>" >
  </td>
</tr>
<input type="hidden" name="whereysrbm"  value="<%=whereysrbm%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ysrbm)=="") {
		alert("������[���������]��");
		FormName.ysrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysrmc)=="") {
		alert("������[����������]��");
		FormName.ysrmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysrxx)=="") {
		alert("������[����������]��");
		FormName.ysrxx.focus();
		return false;
	}
	if(!(isFloat(FormName.ysrxx, "����������"))) {
		return false;
	}
	if(	javaTrim(FormName.ysrsx)=="") {
		alert("������[����������]��");
		FormName.ysrsx.focus();
		return false;
	}
	if(!(isFloat(FormName.ysrsx, "����������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
