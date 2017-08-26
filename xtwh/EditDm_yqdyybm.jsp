<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yqdyybm=null;
String yqdyymc=null;
String whereyqdyybm=cf.GB2Uni(request.getParameter("yqdyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yqdyybm,yqdyymc ";
	ls_sql+=" from  dm_yqdyybm";
	ls_sql+=" where  (yqdyybm='"+whereyqdyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yqdyybm=cf.fillNull(rs.getString("yqdyybm"));
		yqdyymc=cf.fillNull(rs.getString("yqdyymc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditDm_yqdyybm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">延期单原因编码</td>
  <td><input type="text" name="yqdyybm" size="20" maxlength="2"  value="<%=yqdyybm%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">延期单原因名称</td> 
  <td><input type="text" name="yqdyymc" size="50" maxlength="50"  value="<%=yqdyymc%>" ></td>
  </tr>
<input type="hidden" name="whereyqdyybm"  value="<%=whereyqdyybm%>" >
    <tr> 
      <td colspan="2" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
	</div>      </td>
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
	if(	javaTrim(FormName.yqdyybm)=="") {
		alert("请输入[延期单原因编码]！");
		FormName.yqdyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.yqdyymc)=="") {
		alert("请输入[延期单原因名称]！");
		FormName.yqdyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
