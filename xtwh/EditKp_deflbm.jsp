<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String deflbm=null;
String deflmc=null;
String dedy=null;
String dexy=null;
String depjz=null;
String wheredeflbm=cf.GB2Uni(request.getParameter("deflbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select deflbm,deflmc,dedy,dexy,depjz ";
	ls_sql+=" from  kp_deflbm";
	ls_sql+=" where  (deflbm='"+wheredeflbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		deflbm=cf.fillNull(rs.getString("deflbm"));
		deflmc=cf.fillNull(rs.getString("deflmc"));
		dedy=cf.fillNull(rs.getString("dedy"));
		dexy=cf.fillNull(rs.getString("dexy"));
		depjz=cf.fillNull(rs.getString("depjz"));
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

<form method="post" action="SaveEditKp_deflbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="deflbm" size="20" maxlength="1"  value="<%=deflbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">�����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="deflmc" size="20" maxlength="50"  value="<%=deflmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dedy" size="20" maxlength="8"  value="<%=dedy%>" >
  </td>
  <td width="15%"> 
    <div align="right">����С��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="dexy" size="20" maxlength="8"  value="<%=dexy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����ƽ��ֵ</div>
  </td>
  <td width="35%"> 
    <input type="text" name="depjz" size="20" maxlength="8"  value="<%=depjz%>" >
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wheredeflbm"  value="<%=wheredeflbm%>" >
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
	if(	javaTrim(FormName.deflbm)=="") {
		alert("������[����������]��");
		FormName.deflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.deflmc)=="") {
		alert("������[�����������]��");
		FormName.deflmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dedy)=="") {
		alert("������[�������]��");
		FormName.dedy.focus();
		return false;
	}
	if(!(isNumber(FormName.dedy, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.dexy)=="") {
		alert("������[����С��]��");
		FormName.dexy.focus();
		return false;
	}
	if(!(isNumber(FormName.dexy, "����С��"))) {
		return false;
	}
	if(	javaTrim(FormName.depjz)=="") {
		alert("������[����ƽ��ֵ]��");
		FormName.depjz.focus();
		return false;
	}
	if(!(isNumber(FormName.depjz, "����ƽ��ֵ"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
