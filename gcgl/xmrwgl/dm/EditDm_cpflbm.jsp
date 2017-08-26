<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpflbm=null;
String cpflmc=null;
String wherecpflbm=cf.GB2Uni(request.getParameter("cpflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpflbm,cpflmc ";
	ls_sql+=" from  dm_cpflbm";
	ls_sql+=" where  (cpflbm='"+wherecpflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpflbm=cf.fillNull(rs.getString("cpflbm"));
		cpflmc=cf.fillNull(rs.getString("cpflmc"));
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
<form method="post" action="SaveEditDm_cpflbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">产品分类编码</td> 
  <td width="35%"> 
    <input type="text" name="cpflbm" size="20" maxlength="4"  value="<%=cpflbm%>" >
  </td>
  <td align="right" width="15%">产品分类名称</td> 
  <td width="35%"> 
    <input type="text" name="cpflmc" size="20" maxlength="50"  value="<%=cpflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherecpflbm"  value="<%=wherecpflbm%>" >
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
	if(	javaTrim(FormName.cpflbm)=="") {
		alert("请输入[产品分类编码]！");
		FormName.cpflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpflmc)=="") {
		alert("请输入[产品分类名称]！");
		FormName.cpflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
