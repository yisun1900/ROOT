<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String jtjgbm=null;
String jtjgmc=null;
String wherejtjgbm=cf.GB2Uni(request.getParameter("jtjgbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jtjgbm,jtjgmc ";
	ls_sql+=" from  dm_jtjgbm";
	ls_sql+=" where  (jtjgbm='"+wherejtjgbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jtjgbm=cf.fillNull(rs.getString("jtjgbm"));
		jtjgmc=cf.fillNull(rs.getString("jtjgmc"));
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
<form method="post" action="SaveEditDm_jtjgbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">家庭结构编码</td> 
  <td width="35%"> 
    <input type="text" name="jtjgbm" size="20" maxlength="2"  value="<%=jtjgbm%>" >
  </td>
  <td align="right" width="15%">家庭结构名称</td> 
  <td width="35%"> 
    <input type="text" name="jtjgmc" size="20" maxlength="50"  value="<%=jtjgmc%>" >
  </td>
</tr>
<input type="hidden" name="wherejtjgbm"  value="<%=wherejtjgbm%>" >
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
	if(	javaTrim(FormName.jtjgbm)=="") {
		alert("请输入[家庭结构编码]！");
		FormName.jtjgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jtjgmc)=="") {
		alert("请输入[家庭结构名称]！");
		FormName.jtjgmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
