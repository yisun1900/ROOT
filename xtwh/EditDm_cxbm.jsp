<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cxbm=null;
String cxmc=null;
String wherecxbm=cf.GB2Uni(request.getParameter("cxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cxbm,cxmc ";
	ls_sql+=" from  dm_cxbm";
	ls_sql+=" where  (cxbm='"+wherecxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cxbm=cf.fillNull(rs.getString("cxbm"));
		cxmc=cf.fillNull(rs.getString("cxmc"));
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
<form method="post" action="SaveEditDm_cxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">朝向编码</td> 
  <td width="35%"> 
    <input type="text" name="cxbm" size="20" maxlength="2"  value="<%=cxbm%>" >
  </td>
  <td align="right" width="15%">朝向名称</td> 
  <td width="35%"> 
    <input type="text" name="cxmc" size="20" maxlength="50"  value="<%=cxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherecxbm"  value="<%=wherecxbm%>" >
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
	if(	javaTrim(FormName.cxbm)=="") {
		alert("请输入[朝向编码]！");
		FormName.cxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cxmc)=="") {
		alert("请输入[朝向名称]！");
		FormName.cxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
