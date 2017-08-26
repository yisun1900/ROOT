<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bh=null;
String shyj=null;
String wherebh=cf.GB2Uni(request.getParameter("bh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bh,shyj ";
	ls_sql+=" from  bj_cyshyj";
	ls_sql+=" where  (bh="+wherebh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bh=cf.fillNull(rs.getString("bh"));
		shyj=cf.fillNull(rs.getString("shyj"));
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
<form method="post" action="SaveEditBj_cyshyj.jsp" name="editform">
<div align="center">请修改信息（编号：<%=wherebh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">审核意见</td> 
  <td width="80%"><textarea name="shyj" cols="73" rows="10"><%=shyj%></textarea></td>
  </tr>
    <tr> 
      <td colspan="2" >
	<div align="center">
<input type="hidden" name="wherebh"  value="<%=wherebh%>" >
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
	if(	javaTrim(FormName.shyj)=="") {
		alert("请输入[审核意见]！");
		FormName.shyj.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
