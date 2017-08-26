<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xjwtflbm=null;
String xjwtflmc=null;
String wherexjwtflbm=cf.GB2Uni(request.getParameter("xjwtflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xjwtflbm,xjwtflmc ";
	ls_sql+=" from  dm_xjwtflbm";
	ls_sql+=" where  (xjwtflbm='"+wherexjwtflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xjwtflbm=cf.fillNull(rs.getString("xjwtflbm"));
		xjwtflmc=cf.fillNull(rs.getString("xjwtflmc"));
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
<form method="post" action="SaveEditDm_xjwtflbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">检查问题分类编码</td> 
  <td width="32%"> 
    <input type="text" name="xjwtflbm" size="20" maxlength="2"  value="<%=xjwtflbm%>" >
  </td>
  <td align="right" width="18%">检查问题分类名称</td> 
  <td width="32%"> 
    <input type="text" name="xjwtflmc" size="20" maxlength="100"  value="<%=xjwtflmc%>" >
  </td>
</tr>
<input type="hidden" name="wherexjwtflbm"  value="<%=wherexjwtflbm%>" >
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
	if(	javaTrim(FormName.xjwtflbm)=="") {
		alert("请输入[检查问题分类编码]！");
		FormName.xjwtflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xjwtflmc)=="") {
		alert("请输入[检查问题分类名称]！");
		FormName.xjwtflmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
