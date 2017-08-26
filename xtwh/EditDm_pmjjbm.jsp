<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String pmjjbm=null;
String pmjjmc=null;
String qd=null;
String zd=null;
String wherepmjjbm=cf.GB2Uni(request.getParameter("pmjjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pmjjbm,pmjjmc,qd,zd ";
	ls_sql+=" from  dm_pmjjbm";
	ls_sql+=" where  (pmjjbm='"+wherepmjjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pmjjbm=cf.fillNull(rs.getString("pmjjbm"));
		pmjjmc=cf.fillNull(rs.getString("pmjjmc"));
		qd=cf.fillNull(rs.getString("qd"));
		zd=cf.fillNull(rs.getString("zd"));
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
<form method="post" action="SaveEditDm_pmjjbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">平米均价编码</td> 
  <td width="35%"> 
    <input type="text" name="pmjjbm" size="20" maxlength="2"  value="<%=pmjjbm%>" >
  </td>
  <td align="right" width="15%">平米均价名称</td> 
  <td width="35%"> 
    <input type="text" name="pmjjmc" size="20" maxlength="50"  value="<%=pmjjmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起点（>）</td> 
  <td width="35%"> 
    <input type="text" name="qd" size="20" maxlength="17"  value="<%=qd%>" >
  </td>
  <td align="right" width="15%">终点（<＝）</td> 
  <td width="35%"> 
    <input type="text" name="zd" size="20" maxlength="17"  value="<%=zd%>" >
  </td>
</tr>
<input type="hidden" name="wherepmjjbm"  value="<%=wherepmjjbm%>" >
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
	if(	javaTrim(FormName.pmjjbm)=="") {
		alert("请输入[平米均价编码]！");
		FormName.pmjjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pmjjmc)=="") {
		alert("请输入[平米均价名称]！");
		FormName.pmjjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("请输入[起点（>）]！");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "起点（>）"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("请输入[终点（<＝）]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点（<＝）"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
