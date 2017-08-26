<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");

String zcmc=null;
String jldwbm=null;
String dj=null;
String sl=null;
String je=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcmc,jldwbm,dj,sl,je,bz ";
	ls_sql+=" from  bj_zcbjmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcmc=cf.fillNull(rs.getString("zcmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
		je=cf.fillNull(rs.getString("je"));
		bz=cf.fillNull(rs.getString("bz"));
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
<form method="post" action="SaveEditBj_zcbjmx.jsp" name="editform">
  <div align="center">主材报价明细</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">主材名称</td>
      <td colspan="3"> 
        <input type="text" name="zcmc" size="71" maxlength="50"  value="<%=zcmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">计量单位</td>
      <td width="35%"> 
        <input type="text" name="jldwbm" size="20" maxlength="20"  value="<%=jldwbm%>" >
      </td>
      <td align="right" width="15%">单价</td>
      <td width="35%"> 
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" onchange="calValue(editform)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">数量</td>
      <td width="35%"> 
        <input type="text" name="sl" size="20" maxlength="9"  value="<%=sl%>" onchange="calValue(editform)">
      </td>
      <td align="right" width="15%">金额</td>
      <td width="35%"> 
        <input type="text" name="je" size="20" maxlength="17"  value="<%=je%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="70" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
		<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>">
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
function calValue(FormName)
{  
	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);

	FormName.je.value=je;
}    
function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.zcmc)=="") {
		alert("请输入[主材名称]！");
		FormName.zcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请输入[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[金额]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "金额"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
