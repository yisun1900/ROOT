<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hxbm=null;
String hxmc=null;
String tctybz=null;
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hxbm,hxmc,tctybz ";
	ls_sql+=" from  dm_hxbm";
	ls_sql+=" where  (hxbm='"+wherehxbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hxbm=cf.fillNull(rs.getString("hxbm"));
		hxmc=cf.fillNull(rs.getString("hxmc"));
		tctybz=cf.fillNull(rs.getString("tctybz"));
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

<form method="post" action="SaveEditDm_hxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right"> 
    ���ͱ��� </td>
  <td width="32%"> 
    <input type="text" name="hxbm" size="20" maxlength="2"  value="<%=hxbm%>" >  </td>
  <td width="18%" align="right"> 
     �������� </td>
  <td width="32%"> 
    <input type="text" name="hxmc" size="20" maxlength="50"  value="<%=hxmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ײ�ͣ�ñ�־</td>
  <td><%
	cf.radioToken(out, "tctybz","N+δͣ��&Y+ͣ��",tctybz);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
	    <tr> 
              <td height="2" colspan="4" align="center">
                <input name="button" type="button" onClick="f_do(editform)"  value="����">
                <input name="reset" type="reset"  value="����"></td>
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[���ͱ���]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmc)=="") {
		alert("������[��������]��");
		FormName.hxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
