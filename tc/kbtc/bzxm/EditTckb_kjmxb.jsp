<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hxbm=null;
String jgwzbm=null;
String mj=null;
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String wherejgwzbm=cf.getParameter(request,"jgwzbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hxbm,jgwzbm,mj ";
	ls_sql+=" from  tckb_kjmxb";
	ls_sql+=" where  (hxbm='"+wherehxbm+"') and  (jgwzbm='"+wherejgwzbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		mj=cf.fillNull(rs.getString("mj"));
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
<form method="post" action="SaveEditTckb_kjmxb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">户型</td> 
  <td width="35%"> 
    <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm where hxbm='"+hxbm+"'",hxbm);
%>
    </select>
  </td>
  <td align="right" width="15%">功能空间</td> 
  <td width="35%"> 
    <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc",jgwzbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">空间面积</td> 
  <td width="35%"> 
    <input type="text" name="mj" size="20" maxlength="8"  value="<%=mj%>" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
	<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("请选择[功能空间]！");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mj)=="") {
		alert("请输入[空间面积]！");
		FormName.mj.focus();
		return false;
	}
	if(!(isNumber(FormName.mj, "空间面积"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
