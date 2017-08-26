<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String fdmc=null;
String qd=null;
String zd=null;
String tcbfb=null;
String qdlx=null;
String fgsbh=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,fdmc,qd,zd,tcbfb,qdlx,fgsbh ";
	ls_sql+=" from  cw_sjstcbl";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		fdmc=cf.fillNull(rs.getString("fdmc"));
		qd=cf.fillNull(rs.getString("qd"));
		zd=cf.fillNull(rs.getString("zd"));
		tcbfb=cf.fillNull(rs.getString("tcbfb"));
		qdlx=cf.fillNull(rs.getString("qdlx"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
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
<form method="post" action="SaveEditCw_sjstcbl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xh" size="20" maxlength="8"  value="<%=xh%>" >
  </td>
  <td align="right" width="15%">分段名称</td> 
  <td width="35%"> 
    <input type="text" name="fdmc" size="20" maxlength="50"  value="<%=fdmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起点（>）</td> 
  <td width="35%"> 
    <input type="text" name="qd" size="20" maxlength="17"  value="<%=qd%>" >
  </td>
  <td align="right" width="15%">终点（<=）</td> 
  <td width="35%"> 
    <input type="text" name="zd" size="20" maxlength="17"  value="<%=zd%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">提成百分比</td> 
  <td width="35%"> 
    <input type="text" name="tcbfb" size="20" maxlength="9"  value="<%=tcbfb%>" >
  </td>
  <td align="right" width="15%">签单类型</td> 
  <td width="35%"> 
    <select name="qdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+非市场部家装&2+市场部家装&3+工装",qdlx);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",fgsbh);
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
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("请输入[序号]！");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.fdmc)=="") {
		alert("请输入[分段名称]！");
		FormName.fdmc.focus();
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
		alert("请输入[终点（<=）]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点（<=）"))) {
		return false;
	}
	if(	javaTrim(FormName.tcbfb)=="") {
		alert("请输入[提成百分比]！");
		FormName.tcbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.tcbfb, "提成百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.qdlx)=="") {
		alert("请选择[签单类型]！");
		FormName.qdlx.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
