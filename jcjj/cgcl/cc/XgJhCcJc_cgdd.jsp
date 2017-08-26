<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String ddbh=request.getParameter("ddbh");
String jhccsj=null;
String jhccxgsj=null;
String jhccxgyy=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select jhccsj,jhccxgsj,jhccxgyy";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jhccsj=cf.fillNull(rs.getDate("jhccsj"));
		jhccxgsj=cf.fillNull(rs.getDate("jhccxgsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
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
<title>橱柜初测</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">修改计划初测时间</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">计划初测时间</td>
              <td width="29%"> 
                <input type="text" name="jhccsj" size="20" maxlength="20"  value="<%=jhccsj%>" >
              </td>
              <td width="22%" align="right">　</td>
              <td width="28%"> 
                　
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">计划初测时间修改人</td>
              <td width="29%">
                <input type="text" name="jhccxgr" size="20" maxlength="20"  value="<%=yhdlm%>" readonly>
              </td>
              <td width="22%" align="right">修改时间</td>
              <td width="28%"> 
                <input type="text" name="jhccxgsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">修改原因</td>
              <td colspan="3"> 
                <textarea name="jhccxgyy" cols="71" rows="3"><%=jhccxgyy%></textarea>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jhccsj)=="") {
		alert("请输入[计划初测时间]！");
		FormName.jhccsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jhccxgr)=="") {
		alert("请输入[计划初测时间修改人]！");
		FormName.jhccxgr.focus();
		return false;
	}
	if(	javaTrim(FormName.jhccxgsj)=="") {
		alert("请输入[修改时间]！");
		FormName.jhccxgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhccxgsj, "修改时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jhccxgyy)=="") {
		alert("请输入[修改原因]！");
		FormName.jhccxgyy.focus();
		return false;
	}
/*
*/
	FormName.action="SaveXgJhCcJc_cgdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
