<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zqysxmbm=null;
String zqysxmmc=null;
String wherezqysxmbm=cf.GB2Uni(request.getParameter("zqysxmbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zqysxmbm,zqysxmmc ";
	ls_sql+=" from  dm_zqysxmbm";
	ls_sql+=" where  (zqysxmbm='"+wherezqysxmbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		zqysxmmc=cf.fillNull(rs.getString("zqysxmmc"));
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

<form method="post" action="SaveEditDm_zqysxmbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="19%"> 
                <div align="right">����������Ŀ����</div>
  </td>
              <td width="31%"> 
                <input type="text" name="zqysxmbm" size="20" maxlength="2"  value="<%=zqysxmbm%>" >
  </td>
              <td width="20%"> 
                <div align="right">����������Ŀ����</div>
  </td>
              <td width="30%"> 
                <input type="text" name="zqysxmmc" size="20" maxlength="50"  value="<%=zqysxmmc%>" >
  </td>
</tr>
<input type="hidden" name="wherezqysxmbm"  value="<%=wherezqysxmbm%>" >
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
	if(	javaTrim(FormName.zqysxmbm)=="") {
		alert("������[����������Ŀ����]��");
		FormName.zqysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zqysxmmc)=="") {
		alert("������[����������Ŀ����]��");
		FormName.zqysxmmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
