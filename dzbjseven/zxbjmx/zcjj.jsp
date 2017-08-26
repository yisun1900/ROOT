<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbjjbbm=null;
String bjjbbm=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bjjbbm,khbjjbbm";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
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
<title>主材项目升级</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveZcjj.jsp" name="editform">
<div align="center">主材项目升级</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td height="40" align="right"><font color="#FF0000">*</font><font color="#0000CC">原级别</font></td>
  <td><select name="khbjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+khbjjbbm+"'",khbjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="45%" height="43" align="right"><font color="#FF0000">*</font>升级后级别</td>
  <td width="55%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and bjjbbm<'"+khbjjbbm+"' order by bjjbbm",bjjbbm);
%>
  </select></td>
</tr>

    <tr> 
      <td colspan="2" align="center" >
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
		<input type="hidden" name="jgwzbm"  value="<%=jgwzbm%>" >
		<input type="hidden" name="tcsjflbm"  value="<%=tcsjflbm%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">	</td>
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
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
