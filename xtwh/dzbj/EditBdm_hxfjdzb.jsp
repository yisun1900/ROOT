<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hxbm=null;
String jgwzmc=null;
String fjmj=null;
String fjlx=null;
int xuhao=0;
String wherehxbm=cf.GB2Uni(request.getParameter("hxbm"));
String wherejgwzmc=cf.getParameter(request,"jgwzmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select hxbm,jgwzmc,fjmj,fjlx,xuhao ";
	ls_sql+=" from  bdm_hxfjdzb";
	ls_sql+=" where  (hxbm='"+wherehxbm+"') and  (jgwzmc='"+wherejgwzmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hxbm=cf.fillNull(rs.getString("hxbm"));
		jgwzmc=cf.fillNull(rs.getString("jgwzmc"));
		fjmj=cf.fillNull(rs.getString("fjmj"));
		fjlx=cf.fillNull(rs.getString("fjlx"));
		xuhao=rs.getInt("xuhao");
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBdm_hxfjdzb.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>户型</td> 
  <td width="32%"> 
    <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>序号</td> 
  <td width="32%"><input type="text" name="xuhao" size="20" maxlength="17"  value="<%=xuhao%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>房间名称</td>
  <td><input type="text" name="jgwzmc" size="20" maxlength="50"  value="<%=jgwzmc%>" ></td>
  <td align="right">房间面积</td>
  <td><input type="text" name="fjmj" size="20" maxlength="17"  value="<%=fjmj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>房间类型</td> 
  <td colspan="3"><%
	cf.radioToken(out, "fjlx","1+厨房&2+卫生间&3+卧室&4+客厅&5+餐厅&6+阳台",fjlx);
%></td>
  </tr>
<input type="hidden" name="wherehxbm"  value="<%=wherehxbm%>" >
<input type="hidden" name="wherejgwzmc"  value="<%=wherejgwzmc%>" >
    <tr> 
      <td colspan="4" >
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzmc)=="") {
		alert("请输入[房间名称]！");
		FormName.jgwzmc.focus();
		return false;
	}
	if(!(isFloat(FormName.fjmj, "房间面积"))) {
		return false;
	}
	if(	!radioChecked(FormName.fjlx)) {
		alert("请选择[房间类型]！");
		FormName.fjlx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xuhao)=="") {
		alert("请输入[序号]！");
		FormName.xuhao.focus();
		return false;
	}
	if(!(isNumber(FormName.xuhao, "序号"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
