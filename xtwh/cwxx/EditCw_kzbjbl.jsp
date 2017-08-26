<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xuhao=null;
String mc=null;
String qd=null;
String zd=null;
String bfb=null;
String fgsbh=null;
String wherexuhao=cf.GB2Uni(request.getParameter("xuhao"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xuhao,mc,qd,zd,bfb,fgsbh ";
	ls_sql+=" from  cw_kzbjbl";
	ls_sql+=" where  (xuhao="+wherexuhao+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xuhao=cf.fillNull(rs.getString("xuhao"));
		mc=cf.fillNull(rs.getString("mc"));
		qd=cf.fillNull(rs.getString("qd"));
		zd=cf.fillNull(rs.getString("zd"));
		bfb=cf.fillNull(rs.getString("bfb"));
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
<form method="post" action="SaveEditCw_kzbjbl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="xuhao" size="20" maxlength="8"  value="<%=xuhao%>" >
  </td>
  <td align="right" width="15%">名称</td> 
  <td width="35%"> 
    <input type="text" name="mc" size="20" maxlength="50"  value="<%=mc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起点金额（>=）</td> 
  <td width="35%"> 
    <input type="text" name="qd" size="20" maxlength="17"  value="<%=qd%>" >
  </td>
  <td align="right" width="15%">终点金额（<）</td> 
  <td width="35%"> 
    <input type="text" name="zd" size="20" maxlength="17"  value="<%=zd%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">扣除百分比</td> 
  <td width="35%"> 
    <input type="text" name="bfb" size="10" maxlength="17"  value="<%=bfb%>" >%
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="wherexuhao"  value="<%=wherexuhao%>" >
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
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "序号"))) {
		return false;
	}
	if(	javaTrim(FormName.mc)=="") {
		alert("请输入[名称]！");
		FormName.mc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("请输入[起点金额（>=）]！");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "起点金额（>=）"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("请输入[终点金额（<）]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点金额（<）"))) {
		return false;
	}
	if(	javaTrim(FormName.bfb)=="") {
		alert("请输入[扣除百分比]！");
		FormName.bfb.focus();
		return false;
	}
	if(!(isFloat(FormName.bfb, "扣除百分比"))) {
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
