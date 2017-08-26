<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wgjbbm=null;
String xzzwbm=null;
String wherewgjbbm=cf.GB2Uni(request.getParameter("wgjbbm"));
String wherexzzwbm=cf.getParameter(request,"xzzwbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wgjbbm,xzzwbm ";
	ls_sql+=" from  gdm_cfry";
	ls_sql+=" where  (wgjbbm='"+wherewgjbbm+"') and  (xzzwbm='"+wherexzzwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wgjbbm=cf.fillNull(rs.getString("wgjbbm"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
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
<form method="post" action="SaveEditGdm_cfry.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">违规级别编码</td> 
  <td width="35%"> 
	<select name="wgjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <option value=""></option>
	  <%
cf.selectItem(out,"select wgjbbm,wgjbmc from gdm_wgjbbm order by wgjbbm",wgjbbm);
%> 
	</select>
  </td>
  <td align="right" width="15%">处罚人员职务</td> 
  <td width="35%"> 
	<select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <option value=""></option>
	  <%
cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc",xzzwbm);
%> 
	</select>
  </td>
</tr>
<input type="hidden" name="wherewgjbbm"  value="<%=wherewgjbbm%>" >
<input type="hidden" name="wherexzzwbm"  value="<%=wherexzzwbm%>" >
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
	if(	javaTrim(FormName.wgjbbm)=="") {
		alert("请输入[违规级别编码]！");
		FormName.wgjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xzzwbm)=="") {
		alert("请输入[处罚人员职务]！");
		FormName.xzzwbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
