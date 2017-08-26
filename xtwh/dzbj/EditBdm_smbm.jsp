<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String smbm=null;
String smmc=null;
String wheresmbm=cf.GB2Uni(request.getParameter("smbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select smbm,smmc ";
	ls_sql+=" from  bdm_smbm";
	ls_sql+=" where  (smbm='"+wheresmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		smbm=cf.fillNull(rs.getString("smbm"));
		smmc=cf.fillNull(rs.getString("smmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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

<form method="post" action="SaveEditBdm_smbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="smbm" size="20" maxlength="2"  value="<%=smbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="smmc" size="20" maxlength="50"  value="<%=smmc%>" >
  </td>
</tr>
<input type="hidden" name="wheresmbm"  value="<%=wheresmbm%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
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
	if(	javaTrim(FormName.smbm)=="") {
		alert("������[�������]��");
		FormName.smbm.focus();
		return false;
	}
	if(	javaTrim(FormName.smmc)=="") {
		alert("������[��������]��");
		FormName.smmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
