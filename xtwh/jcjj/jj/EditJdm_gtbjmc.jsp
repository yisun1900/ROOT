<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String bjbm=null;
String bjmc=null;
String wherebjbm=cf.GB2Uni(request.getParameter("bjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select bjbm,bjmc ";
	ls_sql+=" from  jdm_gtbjmc";
	ls_sql+=" where  (bjbm='"+wherebjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbm=cf.fillNull(rs.getString("bjbm"));
		bjmc=cf.fillNull(rs.getString("bjmc"));
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
<form method="post" action="SaveEditJdm_gtbjmc.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">柜体板件编码</td> 
  <td width="35%"> 
    <input type="text" name="bjbm" size="20" maxlength="4"  value="<%=bjbm%>" >
  </td>
  <td align="right" width="15%">柜体板件名称</td> 
  <td width="35%"> 
    <input type="text" name="bjmc" size="20" maxlength="50"  value="<%=bjmc%>" >
  </td>
</tr>
<input type="hidden" name="wherebjbm"  value="<%=wherebjbm%>" >
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
	if(	javaTrim(FormName.bjbm)=="") {
		alert("请输入[柜体板件编码]！");
		FormName.bjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjmc)=="") {
		alert("请输入[柜体板件名称]！");
		FormName.bjmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
