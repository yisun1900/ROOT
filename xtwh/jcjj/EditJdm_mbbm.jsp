<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mbbm=null;
String mbmc=null;
String wherembbm=cf.GB2Uni(request.getParameter("mbbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select mbbm,mbmc ";
	ls_sql+=" from  jdm_mbbm";
	ls_sql+=" where  (mbbm='"+wherembbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		mbbm=cf.fillNull(rs.getString("mbbm"));
		mbmc=cf.fillNull(rs.getString("mbmc"));
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

<form method="post" action="SaveEditJdm_mbbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�Ű����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mbbm" size="20" maxlength="2"  value="<%=mbbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">�Ű�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mbmc" size="20" maxlength="50"  value="<%=mbmc%>" >
  </td>
</tr>
<input type="hidden" name="wherembbm"  value="<%=wherembbm%>" >
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
	if(	javaTrim(FormName.mbbm)=="") {
		alert("������[�Ű����]��");
		FormName.mbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mbmc)=="") {
		alert("������[�Ű�����]��");
		FormName.mbmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
