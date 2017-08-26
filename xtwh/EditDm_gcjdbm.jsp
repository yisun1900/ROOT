<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gcjdbm=null;
String gcjdmc=null;
String ysgcjdmc=null;
String wheregcjdbm=cf.GB2Uni(request.getParameter("gcjdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gcjdbm,gcjdmc,ysgcjdmc ";
	ls_sql+=" from  dm_gcjdbm";
	ls_sql+=" where  (gcjdbm='"+wheregcjdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		ysgcjdmc=cf.fillNull(rs.getString("ysgcjdmc"));
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

<form method="post" action="SaveEditDm_gcjdbm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���̽��ȱ���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gcjdbm" size="20" maxlength="1"  value="<%=gcjdbm%>" >
              </td>
              <td width="17%"> 
                <div align="right">���̽�������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="gcjdmc" size="20" maxlength="50"  value="<%=gcjdmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ɫ���̽�������</td>
              <td colspan="3"> 
                <input type="text" name="ysgcjdmc" size="71" maxlength="50"  value='<%=ysgcjdmc%>' >
              </td>
            </tr>
            <input type="hidden" name="wheregcjdbm"  value="<%=wheregcjdbm%>" >
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
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("������[���̽��ȱ���]��");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdmc)=="") {
		alert("������[���̽�������]��");
		FormName.gcjdmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
