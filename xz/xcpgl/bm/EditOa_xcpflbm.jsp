<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xcpflbm=null;
String xcpflmc=null;
String wherexcpflbm=cf.GB2Uni(request.getParameter("xcpflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xcpflbm,xcpflmc ";
	ls_sql+=" from  oa_xcpflbm";
	ls_sql+=" where  (xcpflbm='"+wherexcpflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xcpflbm=cf.fillNull(rs.getString("xcpflbm"));
		xcpflmc=cf.fillNull(rs.getString("xcpflmc"));
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
<form method="post" action="SaveEditOa_xcpflbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">印刷品分类编码</td> 
  <td width="35%"> 
    <input type="text" name="xcpflbm" size="20" maxlength="2"  value="<%=xcpflbm%>" >
  </td>
  <td align="right" width="15%">印刷品分类名称</td> 
  <td width="35%"> 
    <input type="text" name="xcpflmc" size="20" maxlength="50"  value="<%=xcpflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherexcpflbm"  value="<%=wherexcpflbm%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.xcpflbm)=="") {
		alert("请输入[印刷品分类编码]！");
		FormName.xcpflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xcpflmc)=="") {
		alert("请输入[印刷品分类名称]！");
		FormName.xcpflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
