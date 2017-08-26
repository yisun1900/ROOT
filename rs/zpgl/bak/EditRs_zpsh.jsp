<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zpjhbh=null;
String shjl=null;
String shyj=null;
String shr=null;
String shsj=null;
String whereshbh=cf.GB2Uni(request.getParameter("shbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zpjhbh,shjl,shyj,shr,shsj ";
	ls_sql+=" from  rs_zpsh";
	ls_sql+=" where  (shbh="+whereshbh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpjhbh=cf.fillNull(rs.getString("zpjhbh"));
		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
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
<form method="post" action="SaveEditRs_zpsh.jsp" name="editform">
<div align="center">修改审核（审核编号：<%=whereshbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">招聘计划编号</font></td> 
  <td width="35%"> 
    <input type="text" name="zpjhbh" size="20" maxlength="8"  value="<%=zpjhbh%>" readonly>
  </td>
  <td align="right" width="15%">审核结论</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">审核通过</option>
    <option value="0">驳回</option>
    <option value="9">修改审核</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">审核人</font></td> 
  <td width="35%"> 
    <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">审核时间</font></td> 
  <td width="35%"> 
    <input type="text" name="shsj" size="20" maxlength="10"  value="<%=shsj%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核意见</td> 
  <td width="35%" colspan="3"> 
    <textarea name="shyj" cols="71" rows=""><%=shyj%></textarea>
  </td>
</tr>
<input type="hidden" name="whereshbh"  value="<%=whereshbh%>" >
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
	if(	javaTrim(FormName.zpjhbh)=="") {
		alert("请输入[招聘计划编号]！");
		FormName.zpjhbh.focus();
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("请选择[审核结论]！");
		FormName.shjl.focus();
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
