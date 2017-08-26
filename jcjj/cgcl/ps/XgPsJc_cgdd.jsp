<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String pslrr=null;
String pslrsj=null;
String pssm=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select pslrr,pslrsj,pssm";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		pslrr=cf.fillNull(rs.getString("pslrr"));
		pslrsj=cf.fillNull(rs.getDate("pslrsj"));
		pssm=cf.fillNull(rs.getString("pssm"));
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
<title>修改配送</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<table width="100%">
  <tr>
    <td width="100%"> 
        <div align="center">橱柜订单处理--修改配送 </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFFFFF">配送录入人</td>
              <td width="29%"> 
                <input type="text" name="pslrr" size="20" maxlength="20"  value="<%=pslrr%>" readonly>
              </td>
              <td width="21%" align="right">配送录入时间</td>
              <td width="29%"> 
                <input type="text" name="pslrsj" size="20" maxlength="20"  value="<%=pslrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">配送说明</td>
              <td colspan="3"> 
                <textarea name="pssm" cols="71" rows="3"><%=pssm%></textarea>
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
	if(	javaTrim(FormName.pslrr)=="") {
		alert("请输入[配送录入人]！");
		FormName.pslrr.focus();
		return false;
	}
	if(	javaTrim(FormName.pslrsj)=="") {
		alert("请输入[配送录入时间]！");
		FormName.pslrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pslrsj, "配送录入时间"))) {
		return false;
	}

	FormName.action="SaveXgPsJc_cgdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
