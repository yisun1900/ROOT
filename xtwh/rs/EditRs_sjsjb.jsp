<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sjsjb=null;
String sjsjbmc=null;
String wheresjsjb=cf.GB2Uni(request.getParameter("sjsjb"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sjsjb,sjsjbmc ";
	ls_sql+=" from  rs_sjsjb";
	ls_sql+=" where  (sjsjb='"+wheresjsjb+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsjb=cf.fillNull(rs.getString("sjsjb"));
		sjsjbmc=cf.fillNull(rs.getString("sjsjbmc"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_sjsjb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">设计师级别</td> 
  <td width="35%"> 
    <input type="text" name="sjsjb" size="20" maxlength="2"  value="<%=sjsjb%>" >
  </td>
  <td align="right" width="15%">设计师级别名称</td> 
  <td width="35%"> 
    <input type="text" name="sjsjbmc" size="20" maxlength="50"  value="<%=sjsjbmc%>" >
  </td>
</tr>
<input type="hidden" name="wheresjsjb"  value="<%=wheresjsjb%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.sjsjb)=="") {
		alert("请输入[设计师级别]！");
		FormName.sjsjb.focus();
		return false;
	}
	if(	javaTrim(FormName.sjsjbmc)=="") {
		alert("请输入[设计师级别名称]！");
		FormName.sjsjbmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
