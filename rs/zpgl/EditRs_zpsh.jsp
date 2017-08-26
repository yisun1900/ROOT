<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zpsqbh=null;
String shjl=null;
String ztbm=null;
String shyj=null;
String shr=null;
String shsj=null;
long shhrs=0;

String whereshbh=cf.GB2Uni(request.getParameter("shbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select rs_zpsh.zpsqbh zpsqbh,rs_zpsh.shjl shjl,rs_zpsh.shyj shyj,rs_zpsh.shr shr,rs_zpsh.shsj shsj,rs_zpsh.ztbm ztbm,shhrs ";
	ls_sql+=" from  rs_zpsh,rs_zpsq";
	ls_sql+=" where  (rs_zpsh.shbh="+whereshbh+") and rs_zpsq.shbh=rs_zpsh.shbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zpsqbh=cf.fillNull(rs.getString("zpsqbh"));
		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		ztbm=cf.fillNull(rs.getString("ztbm"));
		shhrs=rs.getLong("shhrs");
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
<form method="post" action="SaveEditRs_zpsh.jsp" name="editform">
<div align="center">修改审核（审核编号：<%=whereshbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">招聘计划编号</font></td> 
  <td width="35%"> 
    <input type="text" name="zpsqbh" size="20" maxlength="8"  value="<%=zpsqbh%>" readonly>
  </td>
  <td align="right" width="15%">审核结论</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"0+取消申请&1+审核通过",shjl);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">下一审核状态</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='01' order by ztbm",ztbm);
%>
    </select>
  </td>
  <td align="right" width="15%">审核后人数</td> 
  <td width="35%"> 
    <input type="text" name="shhrs" value="<%=shhrs%>" size="20" maxlength="8">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">审核人</font></td> 
  <td width="35%"> 
    <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">审核时间</font></td> 
  <td width="35%"> 
    <input type="text" name="shsj" size="20" maxlength="10"  value="<%=shsj%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核意见</td> 
  <td width="35%" colspan="3"> 
    <textarea name="shyj" cols="71" rows=""><%=shyj%></textarea>
  </td>
</tr>
<input type="hidden" name="whereshbh"  value="<%=whereshbh%>" >
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
	if(	javaTrim(FormName.zpsqbh)=="") {
		alert("请输入[招聘计划编号]！");
		FormName.zpsqbh.focus();
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("请选择[审核结论]！");
		FormName.shjl.focus();
		return false;
	}
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[下一审核状态]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shhrs)=="") {
		alert("请输入[审核后人数]！");
		FormName.shhrs.focus();
		return false;
	}
	if(	javaTrim(FormName.shjl)=="0" && javaTrim(FormName.ztbm)!="0199") {
		alert("检查[审核结论]和[审核状态]逻辑关系是否正确！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shjl)!="0" && javaTrim(FormName.ztbm)=="0199") {
		alert("检查[审核结论]和[审核状态]逻辑关系是否正确！");
		FormName.shjl.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
