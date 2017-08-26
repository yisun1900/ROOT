<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String jhfcsj=null;
String jhfcxgsj=null;
String jhfcxgyy=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jhfcsj,jhfcxgsj,jhfcxgyy";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jhfcsj=cf.fillNull(rs.getDate("jhfcsj"));
		jhfcxgsj=cf.fillNull(rs.getDate("jhfcxgsj"));
		jhfcxgyy=cf.fillNull(rs.getString("jhfcxgyy"));
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
<title>修改计划复测时间</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">修改计划复测时间</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">计划复测时间</td>
              <td width="29%"> 
                <input type="text" name="jhfcsj" size="20" maxlength="20"  value="<%=jhfcsj%>" ondblclick="JSCalendar(this)">
              </td>
              <td width="22%" align="right">　</td>
              <td width="28%"> 
                　
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">计划复测录入人</td>
              <td width="29%">
                <input type="text" name="jhfcxgr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="22%" align="right">计划复测录入时间</td>
              <td width="28%"> 
                <input type="text" name="jhfcxgsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">计划复测备注</td>
              <td colspan="3"> 
                <textarea name="jhfcxgyy" cols="71" rows="3"><%=jhfcxgyy%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jhfcsj)=="") {
		alert("请输入[计划复测时间]！");
		FormName.jhfcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhfcsj, "计划复测时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jhfcxgr)=="") {
		alert("请输入[计划复测录入人]！");
		FormName.jhfcxgr.focus();
		return false;
	}
	if(	javaTrim(FormName.jhfcxgsj)=="") {
		alert("请输入[计划复测录入时间]！");
		FormName.jhfcxgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhfcxgsj, "计划复测录入时间"))) {
		return false;
	}
/*
	if(	javaTrim(FormName.jhfcxgyy)=="") {
		alert("请输入[计划复测备注]！");
		FormName.jhfcxgyy.focus();
		return false;
	}
*/
	FormName.action="SaveFcTzJc_cgdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
