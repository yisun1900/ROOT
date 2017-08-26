<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String gcjsr=null;
String gcjssj=null;
String gcjsbz=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select gcjsr,gcjssj,gcjsbz";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		gcjsr=cf.fillNull(rs.getString("gcjsr"));
		gcjssj=cf.fillNull(rs.getDate("gcjssj"));
		gcjsbz=cf.fillNull(rs.getString("gcjsbz"));
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
<title>工厂接收 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">修改工厂接收</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">工厂接收人</td>
              <td width="29%"> 
                <input type="text" name="gcjsr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
              <td width="21%" align="right">工厂接收时间</td>
              <td width="29%"> 
                <input type="text" name="gcjssj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">工厂接收说明</td>
              <td colspan="3"> 
                <textarea name="gcjsbz" cols="71" rows="3"><%=gcjsbz%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" height="51"> 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                </div>              </td>
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
	if(	javaTrim(FormName.gcjsr)=="") {
		alert("请输入[工厂接收人]！");
		FormName.gcjsr.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjssj)=="") {
		alert("请输入[工厂接收时间]！");
		FormName.gcjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.gcjssj, "工厂接收时间"))) {
		return false;
	}

	FormName.action="SaveXgGcjsJc_jjdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
