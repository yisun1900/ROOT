<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fkcs=null;
String fkcsmc=null;
String wherefkcs=cf.GB2Uni(request.getParameter("fkcs"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fkcs,fkcsmc ";
	ls_sql+=" from  cw_fkcs";
	ls_sql+=" where  (fkcs="+wherefkcs+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fkcs=cf.fillNull(rs.getString("fkcs"));
		fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
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
<form method="post" action="SaveEditCw_fkcs.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">收款期数编码</td>
      <td width="31%"> 
        <input type="text" name="fkcs" size="20" maxlength="8"  value="<%=fkcs%>" >
      </td>
      <td align="right" width="18%">收款期数名称</td>
      <td width="32%"> 
        <input type="text" name="fkcsmc" size="20" maxlength="50"  value="<%=fkcsmc%>" >
      </td>
    </tr>
    <input type="hidden" name="wherefkcs"  value="<%=wherefkcs%>" >
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
	if(	javaTrim(FormName.fkcs)=="") {
		alert("请输入[收款期数编码]！");
		FormName.fkcs.focus();
		return false;
	}
	if(!(isNumber(FormName.fkcs, "收款期数编码"))) {
		return false;
	}
	if(	javaTrim(FormName.fkcsmc)=="") {
		alert("请输入[收款期数名称]！");
		FormName.fkcsmc.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
