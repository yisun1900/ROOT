<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmflbm=null;
String xmfl=null;
String xskd=null;
String wherexmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmflbm,xmfl,xskd";
	ls_sql+=" from  crm_xmflbm";
	ls_sql+=" where  (xmflbm='"+wherexmflbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmfl=cf.fillNull(rs.getString("xmfl"));
		xskd=cf.fillNull(rs.getString("xskd"));
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
<form method="post" action="SaveEditCrm_xmflbm.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">项目分类编码(2位)</td>
      <td width="30%"> 
        <input type="text" name="xmflbm" size="20" maxlength="2"  value="<%=xmflbm%>" >
      </td>
      <td align="right" width="19%">项目分类</td>
      <td width="31%"> 
        <input type="text" name="xmfl" size="20" maxlength="20"  value="<%=xmfl%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">显示宽度</td>
      <td width="30%"> 
        <input type="text" name="xskd" size="20" maxlength="8"  value="<%=xskd%>" >
      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <input type="hidden" name="wherexmflbm"  value="<%=wherexmflbm%>" >
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
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("请输入[项目分类编码]！");
		FormName.xmflbm.focus();
		return false;
	}
	if (FormName.xmflbm.value.length!=2)
	{
		alert("[项目分类编码]应为2位！");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmfl)=="") {
		alert("请输入[项目分类]！");
		FormName.xmfl.focus();
		return false;
	}
	if(	javaTrim(FormName.xskd)=="") {
		alert("请输入[显示宽度]！");
		FormName.xskd.focus();
		return false;
	}
	if(!(isNumber(FormName.xskd, "显示宽度"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
