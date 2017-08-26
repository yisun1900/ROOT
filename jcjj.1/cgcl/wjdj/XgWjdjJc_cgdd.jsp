<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String wjlrr=null;
String wjsj=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select wjlrr,wjsj,rksm";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		wjlrr=cf.fillNull(rs.getString("wjlrr"));
		wjsj=cf.fillNull(rs.getDate("wjsj"));
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
<title>完结</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">修改完结（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><font color="#0000CC">完结录入人</font></td>
              <td width="29%"> 
                <input type="text" name="wjlrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="21%" align="right"><font color="#FF0000">*</font>完结时间</td>
              <td width="29%"> 
                <input type="text" name="wjsj" size="20" maxlength="20"  value="<%=wjsj%>" ondblclick="JSCalendar(this)">
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
	if(	javaTrim(FormName.wjlrr)=="") {
		alert("请输入[完结录入人]！");
		FormName.wjlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.wjsj)=="") {
		alert("请输入[完结时间]！");
		FormName.wjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wjsj, "完结时间"))) {
		return false;
	}

	FormName.action="SaveXgWjdjJc_cgdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
