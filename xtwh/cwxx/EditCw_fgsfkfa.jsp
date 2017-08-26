<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fgsbh=null;
String fkfabm=null;
String wherefgsbh=cf.GB2Uni(request.getParameter("fgsbh"));
String wherefkfabm=cf.GB2Uni(request.getParameter("fkfabm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select fgsbh,fkfabm ";
	ls_sql+=" from  cw_fgsfkfa";
	ls_sql+=" where  (fgsbh='"+wherefgsbh+"') and  (fkfabm='"+wherefkfabm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		fkfabm=cf.fillNull(rs.getString("fkfabm"));
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
<form method="post" action="SaveEditCw_fgsfkfa.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司编号</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx='F0' order by dwbh",fgsbh);
%>
    </select>
  </td>
  <td align="right" width="15%">付款方案</td> 
  <td width="35%"> 
    <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm",fkfabm);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="wherefgsbh"  value="<%=wherefgsbh%>" >
<input type="hidden" name="wherefkfabm"  value="<%=wherefkfabm%>" >
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司编号]！");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("请选择[付款方案]！");
		FormName.fkfabm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
