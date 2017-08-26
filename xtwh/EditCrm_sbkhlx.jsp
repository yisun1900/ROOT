<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String ssfgs=null;
String sbkhlx=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,ssfgs,sbkhlx ";
	ls_sql+=" from  crm_sbkhlx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sbkhlx=cf.fillNull(rs.getString("sbkhlx"));
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
<form method="post" action="SaveEditCrm_sbkhlx.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>序号</td> 
  <td width="32%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>失败客户流向</td> 
  <td colspan="3"> 
    <input type="text" name="sbkhlx" size="50" maxlength="50"  value="<%=sbkhlx%>" >      </td>
  </tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sbkhlx)=="") {
		alert("请输入[失败客户流向]！");
		FormName.sbkhlx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
