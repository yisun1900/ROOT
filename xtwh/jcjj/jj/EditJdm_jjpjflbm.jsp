<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jjpjflbm=null;
String jjpjflmc=null;
String wherejjpjflbm=cf.GB2Uni(request.getParameter("jjpjflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jjpjflbm,jjpjflmc ";
	ls_sql+=" from  jdm_jjpjflbm";
	ls_sql+=" where  (jjpjflbm='"+wherejjpjflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjpjflbm=cf.fillNull(rs.getString("jjpjflbm"));
		jjpjflmc=cf.fillNull(rs.getString("jjpjflmc"));
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
<form method="post" action="SaveEditJdm_jjpjflbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="19%">家具配件分类编码</td> 
      <td width="31%"> 
        <input type="text" name="jjpjflbm" size="20" maxlength="2"  value="<%=jjpjflbm%>" >
  </td>
      <td align="right" width="19%">家具配件分类名称</td> 
      <td width="31%"> 
        <input type="text" name="jjpjflmc" size="20" maxlength="50"  value="<%=jjpjflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherejjpjflbm"  value="<%=wherejjpjflbm%>" >
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
	if(	javaTrim(FormName.jjpjflbm)=="") {
		alert("请输入[家具配件分类编码]！");
		FormName.jjpjflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jjpjflmc)=="") {
		alert("请输入[家具配件分类名称]！");
		FormName.jjpjflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
