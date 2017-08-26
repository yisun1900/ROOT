<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String damxbm=null;
String damxmc=null;
String gdbz=null;
String wheredamxbm=cf.GB2Uni(request.getParameter("damxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select damxbm,damxmc,gdbz ";
	ls_sql+=" from  dm_damxbm";
	ls_sql+=" where  (damxbm='"+wheredamxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		damxbm=cf.fillNull(rs.getString("damxbm"));
		damxmc=cf.fillNull(rs.getString("damxmc"));
		gdbz=cf.fillNull(rs.getString("gdbz"));
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
<form method="post" action="SaveEditDm_damxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">档案明细编码</td> 
  <td width="32%"> 
    <input type="text" name="damxbm" size="20" maxlength="2"  value="<%=damxbm%>" >  </td>
  <td align="right" width="18%">归档标志</td> 
  <td width="32%"><%
	cf.radioToken(out, "gdbz","Y+必须归档&N+可不归档",gdbz);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">档案明细名称</td> 
  <td colspan="3"><input type="text" name="damxmc" size="72" maxlength="50"  value="<%=damxmc%>" >    </td>
  </tr>
<input type="hidden" name="wheredamxbm"  value="<%=wheredamxbm%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.damxbm)=="") {
		alert("请输入[档案明细编码]！");
		FormName.damxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.damxmc)=="") {
		alert("请输入[档案明细名称]！");
		FormName.damxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.gdbz)) {
		alert("请选择[归档标志]！");
		FormName.gdbz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
