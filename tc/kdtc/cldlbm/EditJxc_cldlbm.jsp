<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cldlbm=null;
String cldlmc=null;
String cldllb=null;
String wherecldlbm=cf.GB2Uni(request.getParameter("cldlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cldlbm,cldlmc,cldllb ";
	ls_sql+=" from  jxc_cldlbm";
	ls_sql+=" where  (cldlbm='"+wherecldlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		cldllb=cf.fillNull(rs.getString("cldllb"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_cldlbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>材料大类类别</td>
  <td width="82%"><%
	cf.radioToken(out, "cldllb","1+主材&2+辅材&3+通用",cldllb);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>材料大类名称</td> 
  <td><input type="text" name="cldlmc" size="50" maxlength="50"  value="<%=cldlmc%>" ></td>
  </tr>
<input type="hidden" name="wherecldlbm"  value="<%=wherecldlbm%>" >
    <tr> 
      <td colspan="2" >
	<div align="center">
	  <input type="hidden" name="cldlbm" size="10" maxlength="2"  value="<%=cldlbm%>" readonly>
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
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料大类编码]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.cldllb)) {
		alert("请选择[材料大类类别]！");
		FormName.cldllb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.cldlmc)=="") {
		alert("请输入[材料大类名称]！");
		FormName.cldlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
