<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfdxbm=null;
String hfdxmc=null;
String hfdxflbm=null;
String xh=null;
String wherehfdxbm=cf.GB2Uni(request.getParameter("hfdxbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hfdxbm,hfdxmc,hfdxflbm,xh ";
	ls_sql+=" from  hdm_hfdxbm";
	ls_sql+=" where  (hfdxbm='"+wherehfdxbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hfdxbm=cf.fillNull(rs.getString("hfdxbm"));
		hfdxmc=cf.fillNull(rs.getString("hfdxmc"));
		hfdxflbm=cf.fillNull(rs.getString("hfdxflbm"));
		xh=cf.fillNull(rs.getString("xh"));
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
<form method="post" action="SaveEditHdm_hfdxbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">回访对象分类</td>
  <td><select name="hfdxflbm" style="FONT-SIZE:12PX;WIDTH:362PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hfdxflbm,hfdxflmc from hdm_hfdxflbm order by hfdxflbm",hfdxflbm);
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">回访对象编码</td> 
  <td width="70%"> 
    <input type="text" name="hfdxbm" size="20" maxlength="4"  value="<%=hfdxbm%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">回访对象名称</td>
  <td><input type="text" name="hfdxmc" size="50" maxlength="50"  value="<%=hfdxmc%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="30%">序号</td> 
  <td width="70%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >  </td>
  </tr>
<input type="hidden" name="wherehfdxbm"  value="<%=wherehfdxbm%>" >
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
	if(	javaTrim(FormName.hfdxbm)=="") {
		alert("请输入[回访对象编码]！");
		FormName.hfdxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxmc)=="") {
		alert("请输入[回访对象名称]！");
		FormName.hfdxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdxflbm)=="") {
		alert("请选择[回访对象分类]！");
		FormName.hfdxflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
