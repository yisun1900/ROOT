<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gqtzyybm=null;
String gqtzyymc=null;
String lx=null;
String wheregqtzyybm=cf.GB2Uni(request.getParameter("gqtzyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gqtzyybm,gqtzyymc,lx ";
	ls_sql+=" from  dm_gqtzyybm";
	ls_sql+=" where  (gqtzyybm='"+wheregqtzyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gqtzyybm=cf.fillNull(rs.getString("gqtzyybm"));
		gqtzyymc=cf.fillNull(rs.getString("gqtzyymc"));
		lx=cf.fillNull(rs.getString("lx"));
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
<form method="post" action="SaveEditDm_gqtzyybm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">工期调整原因编码</td> 
  <td> 
    <input type="text" name="gqtzyybm" size="20" maxlength="3"  value="<%=gqtzyybm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">工期调整原因名称</td>
  <td><input type="text" name="gqtzyymc" size="50" maxlength="50"  value="<%=gqtzyymc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">类型</td> 
  <td> 
<%
	cf.radioToken(out, "lx","1+延期&2+工期缩减&3+工期合理增加",lx);
%>      </td>
  </tr>
<input type="hidden" name="wheregqtzyybm"  value="<%=wheregqtzyybm%>" >
    <tr> 
      <td colspan="2" >
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
	if(	javaTrim(FormName.gqtzyybm)=="") {
		alert("请输入[工期调整原因编码]！");
		FormName.gqtzyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.gqtzyymc)=="") {
		alert("请输入[工期调整原因名称]！");
		FormName.gqtzyymc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
