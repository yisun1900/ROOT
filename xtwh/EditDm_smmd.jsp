<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String smmdbm=null;
String smmd=null;
String wheresmmdbm=cf.GB2Uni(request.getParameter("smmdbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select smmdbm,smmd ";
	ls_sql+=" from  dm_smmd";
	ls_sql+=" where  (smmdbm='"+wheresmmdbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		smmdbm=cf.fillNull(rs.getString("smmdbm"));
		smmd=cf.fillNull(rs.getString("smmd"));
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
<form method="post" action="SaveEditDm_smmd.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户上门目的编码</td> 
  <td width="35%"> 
    <input type="text" name="smmdbm" size="20" maxlength="1"  value="<%=smmdbm%>" >
  </td>
  <td align="right" width="15%">客户上门目的</td> 
  <td width="35%"> 
    <input type="text" name="smmd" size="20" maxlength="30"  value="<%=smmd%>" >
  </td>
</tr>
<input type="hidden" name="wheresmmdbm"  value="<%=wheresmmdbm%>" >
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
	if(	javaTrim(FormName.smmdbm)=="") {
		alert("请输入[客户上门目的编码]！");
		FormName.smmdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.smmd)=="") {
		alert("请输入[客户上门目的]！");
		FormName.smmd.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
