<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String yddbh=request.getParameter("yddbh");
String tzfcsj=null;
String ffctzsj=null;
String jhccxgyy=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select tzfcsj,ffctzsj,jhccxgyy";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where yddbh='"+yddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tzfcsj=cf.fillNull(rs.getDate("tzfcsj"));
		ffctzsj=cf.fillNull(rs.getDate("ffctzsj"));
		jhccxgyy=cf.fillNull(rs.getString("jhccxgyy"));
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
<title>木门初测</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">修改通知复测时间</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="24%" align="right" bgcolor="#FFFFFF">通知复测时间</td>
              <td width="26%"> 
                <input type="text" name="tzfcsj" size="20" maxlength="20"  value="<%=tzfcsj%>" ondblclick="JSCalendar(this)">
              </td>
              <td width="21%" align="right">　</td>
              <td width="29%"> 　 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="24%" align="right" bgcolor="#FFFFFF"><font color="#000099">发复测通知人</font></td>
              <td width="26%"> 
                <input type="text" name="ffctzr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="21%" align="right"><font color="#000099">发复测通知时间</font></td>
              <td width="29%"> 
                <input type="text" name="ffctzsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
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
	if(	javaTrim(FormName.tzfcsj)=="") {
		alert("请输入[通知复测时间]！");
		FormName.tzfcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzfcsj, "通知复测时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ffctzr)=="") {
		alert("请输入[发复测通知人]！");
		FormName.ffctzr.focus();
		return false;
	}
	if(	javaTrim(FormName.ffctzsj)=="") {
		alert("请输入[发复测通知时间]！");
		FormName.ffctzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ffctzsj, "发复测通知时间"))) {
		return false;
	}

	FormName.action="SaveXgFctzJc_mmydd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
