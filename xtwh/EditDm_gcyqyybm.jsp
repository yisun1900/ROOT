<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcyqyybm=null;
String gcyqyymc=null;
String lx=null;
String wheregcyqyybm=cf.GB2Uni(request.getParameter("gcyqyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gcyqyybm,gcyqyymc,lx ";
	ls_sql+=" from  dm_gcyqyybm";
	ls_sql+=" where  (gcyqyybm='"+wheregcyqyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcyqyybm=cf.fillNull(rs.getString("gcyqyybm"));
		gcyqyymc=cf.fillNull(rs.getString("gcyqyymc"));
		lx=cf.fillNull(rs.getString("lx"));
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

<form method="post" action="SaveEditDm_gcyqyybm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="17%" align="right">����</td>
              <td width="33%"><%
	cf.radioToken(out, "lx","1+��������ԭ��&2+���ں���ԭ��",lx);
%></td>
              <td width="17%">&nbsp;</td>
              <td width="33%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">��������ԭ�����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="gcyqyybm" size="20" maxlength="2"  value="<%=gcyqyybm%>" >
              </td>
              <td width="17%"> 
                <div align="right">��������ԭ������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="gcyqyymc" size="20" maxlength="50"  value="<%=gcyqyymc%>" >
              </td>
            </tr>
            <input type="hidden" name="wheregcyqyybm"  value="<%=wheregcyqyybm%>" >
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
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.gcyqyybm)=="") {
		alert("������[��������ԭ�����]��");
		FormName.gcyqyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcyqyymc)=="") {
		alert("������[��������ԭ������]��");
		FormName.gcyqyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
