<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhccsj=null;
String sccsj=null;
String ccr=null;
String ccbz=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jhccsj,sccsj,ccr,ccbz";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		sccsj=cf.fillNull(rs.getDate("sccsj"));
		ccr=cf.fillNull(rs.getString("ccr"));
		ccbz=cf.fillNull(rs.getString("ccbz"));
	}
	rs.close();
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
<title>�Ҿ߳���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform">
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">�Ҿ߶�������--�޸ĳ��⣨������ţ�<%=ddbh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">����¼����</td>
              <td width="29%"> 
                <input type="text" name="ccr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="22%" align="right">��</td>
              <td width="28%"> 
                ��
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">�ƻ�����ʱ��</td>
              <td width="29%"> 
                <input type="text" name="jhccsj" size="20" maxlength="20"  value="<%=jhccsj%>" readonly>
              </td>
              <td width="22%" align="right">ʵ����ʱ��</td>
              <td width="28%"> 
                <input type="text" name="sccsj" size="20" maxlength="20"  value="<%=sccsj%>" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">���ⱸע</td>
              <td colspan="3"> 
                <textarea name="ccbz" cols="71" rows="3"><%=ccbz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="����">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                </div>
              </td>
            </tr>
          </table>

	  
	  </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ccr)=="") {
		alert("������[����¼����]��");
		FormName.ccr.focus();
		return false;
	}
	if(	javaTrim(FormName.sccsj)=="") {
		alert("������[ʵ����ʱ��]��");
		FormName.sccsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sccsj, "ʵ����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "�ƻ�����ʱ��"))) {
		return false;
	}

/*
	if(	javaTrim(FormName.ccbz)=="") {
		alert("������[���ⱸע]��");
		FormName.ccbz.focus();
		return false;
	}
*/
	FormName.action="SaveXgCcJc_jjdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
