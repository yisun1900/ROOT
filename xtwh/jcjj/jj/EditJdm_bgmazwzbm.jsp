<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bgmazwzbm=null;
String bgmazwzmc=null;
String wherebgmazwzbm=cf.GB2Uni(request.getParameter("bgmazwzbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bgmazwzbm,bgmazwzmc ";
	ls_sql+=" from  jdm_bgmazwzbm";
	ls_sql+=" where  (bgmazwzbm='"+wherebgmazwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bgmazwzbm=cf.fillNull(rs.getString("bgmazwzbm"));
		bgmazwzmc=cf.fillNull(rs.getString("bgmazwzmc"));
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

<form method="post" action="SaveEditJdm_bgmazwzbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ڹ��Ű�װλ�ñ���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgmazwzbm" size="20" maxlength="2"  value="<%=bgmazwzbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">�ڹ��Ű�װλ������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="bgmazwzmc" size="20" maxlength="50"  value="<%=bgmazwzmc%>" >
  </td>
</tr>
<input type="hidden" name="wherebgmazwzbm"  value="<%=wherebgmazwzbm%>" >
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
	if(	javaTrim(FormName.bgmazwzbm)=="") {
		alert("������[�ڹ��Ű�װλ�ñ���]��");
		FormName.bgmazwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bgmazwzmc)=="") {
		alert("������[�ڹ��Ű�װλ������]��");
		FormName.bgmazwzmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
