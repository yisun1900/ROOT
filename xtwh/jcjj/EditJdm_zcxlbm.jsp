<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcxlbm=null;
String zcxlmc=null;
String zcdlmc=null;
String wherezcxlbm=cf.GB2Uni(request.getParameter("zcxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcxlbm,zcxlmc,zcdlmc ";
	ls_sql+=" from  jdm_zcxlbm";
	ls_sql+=" where  (zcxlbm='"+wherezcxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		zcxlmc=cf.fillNull(rs.getString("zcxlmc"));
		zcdlmc=cf.fillNull(rs.getString("zcdlmc"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJdm_zcxlbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">主材小类编码</td> 
  <td width="35%"> 
    <input type="text" name="zcxlbm" size="20" maxlength="4"  value="<%=zcxlbm%>" >
  </td>
  <td align="right" width="15%">主材小类名称</td> 
  <td width="35%"> 
    <input type="text" name="zcxlmc" size="20" maxlength="50"  value="<%=zcxlmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">主材大类</td> 
  <td width="35%"> 
    <select name="zcdlmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm order by zcdlbm",zcdlmc);
%>
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="wherezcxlbm"  value="<%=wherezcxlbm%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请输入[主材小类编码]！");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlmc)=="") {
		alert("请输入[主材小类名称]！");
		FormName.zcxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlmc)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
