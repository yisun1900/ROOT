<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jklxbm=null;
String jklxmc=null;
String wherejklxbm=cf.GB2Uni(request.getParameter("jklxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jklxbm,jklxmc ";
	ls_sql+=" from  dm_jklxbm";
	ls_sql+=" where  (jklxbm='"+wherejklxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jklxbm=cf.fillNull(rs.getString("jklxbm"));
		jklxmc=cf.fillNull(rs.getString("jklxmc"));
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
<form method="post" action="SaveEditDm_jklxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">施工队拨款项目编码</td> 
      <td width="32%"> 
        <input type="text" name="jklxbm" size="20" maxlength="1"  value="<%=jklxbm%>" >
  </td>
      <td align="right" width="19%">施工队拨款项目名称</td> 
      <td width="31%"> 
        <input type="text" name="jklxmc" size="20" maxlength="50"  value="<%=jklxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherejklxbm"  value="<%=wherejklxbm%>" >
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
	if(	javaTrim(FormName.jklxbm)=="") {
		alert("请输入[施工队拨款项目编码]！");
		FormName.jklxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jklxmc)=="") {
		alert("请输入[施工队拨款项目名称]！");
		FormName.jklxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
