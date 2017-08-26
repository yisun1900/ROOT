<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpjjczbm=null;
String cpjjcz=null;
String wherecpjjczbm=cf.GB2Uni(request.getParameter("cpjjczbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpjjczbm,cpjjcz ";
	ls_sql+=" from  jdm_cpjjcz";
	ls_sql+=" where  (cpjjczbm='"+wherecpjjczbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjczbm=cf.fillNull(rs.getString("cpjjczbm"));
		cpjjcz=cf.fillNull(rs.getString("cpjjcz"));
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
<form method="post" action="SaveEditJdm_cpjjcz.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">成品家具材质编码</td> 
  <td width="35%"> 
    <input type="text" name="cpjjczbm" size="20" maxlength="2"  value="<%=cpjjczbm%>" >
  </td>
  <td align="right" width="15%">成品家具材质</td> 
  <td width="35%"> 
    <input type="text" name="cpjjcz" size="20" maxlength="50"  value="<%=cpjjcz%>" >
  </td>
</tr>
<input type="hidden" name="wherecpjjczbm"  value="<%=wherecpjjczbm%>" >
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
	if(	javaTrim(FormName.cpjjczbm)=="") {
		alert("请输入[成品家具材质编码]！");
		FormName.cpjjczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("请输入[成品家具材质]！");
		FormName.cpjjcz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
