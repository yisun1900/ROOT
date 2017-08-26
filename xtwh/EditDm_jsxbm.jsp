<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jsxbm=null;
String jsxmc=null;
String wherejsxbm=cf.GB2Uni(request.getParameter("jsxbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select jsxbm,jsxmc ";
	ls_sql+=" from  dm_jsxbm";
	ls_sql+=" where  (jsxbm='"+wherejsxbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jsxbm=cf.fillNull(rs.getString("jsxbm"));
		jsxmc=cf.fillNull(rs.getString("jsxmc"));
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

<form method="post" action="SaveEditDm_jsxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="20%"> 
                <div align="right">������⼰ʱ�Ա���</div>
  </td>
              <td width="30%"> 
                <input type="text" name="jsxbm" size="20" maxlength="2"  value="<%=jsxbm%>" >
  </td>
              <td width="20%"> 
                <div align="right">������⼰ʱ������</div>
  </td>
              <td width="30%"> 
                <input type="text" name="jsxmc" size="20" maxlength="50"  value="<%=jsxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherejsxbm"  value="<%=wherejsxbm%>" >
	    <tr> 
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="20%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%" height="2"> 
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
	if(	javaTrim(FormName.jsxbm)=="") {
		alert("������[������⼰ʱ�Ա���]��");
		FormName.jsxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jsxmc)=="") {
		alert("������[������⼰ʱ������]��");
		FormName.jsxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
