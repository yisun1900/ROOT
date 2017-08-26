<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ybjbh=null;
String mj=null;
String fgms=null;
String zxzj=null;
String lx=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String whereybjbh=cf.GB2Uni(request.getParameter("ybjbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ybjbh,mj,fgms,zxzj,lx,clzt,lrr,lrsj,lrbm,ssfgs,bz ";
	ls_sql+=" from  ybj_stybjgl";
	ls_sql+=" where  (ybjbh='"+whereybjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		mj=cf.fillNull(rs.getString("mj"));
		fgms=cf.fillNull(rs.getString("fgms"));
		zxzj=cf.fillNull(rs.getString("zxzj"));
		lx=cf.fillNull(rs.getString("lx"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditYbj_stybjgl.jsp" name="editform">
<div align="center">实体样板间修改</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>样板间编号</td> 
  <td width="35%"> 
    <input type="text" name="ybjbh" size="20" maxlength="20"  value="<%=ybjbh%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>所属分公司</td> 
  <td width="35%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh",ssfgs);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>面积</td>
  <td><input type="text" name="mj" size="20" maxlength="17"  value="<%=mj%>" ></td>
  <td align="right"><span class="STYLE1">*</span>装修造价</td>
  <td><input type="text" name="zxzj" size="20" maxlength="17"  value="<%=zxzj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>风格描述</td> 
  <td colspan="3"> 
    <textarea name="fgms" cols="72" rows="6"><%=fgms%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>类型</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "lx","1+样板间&2+独立隔间",lx);
%>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>状态</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "clzt","1+在使用&2+作废",clzt);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"' ","");
%>
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>      </td>
  </tr>
<input type="hidden" name="whereybjbh"  value="<%=whereybjbh%>" >
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
	if(	javaTrim(FormName.ybjbh)=="") {
		alert("请输入[样板间编号]！");
		FormName.ybjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mj)=="") {
		alert("请输入[面积]！");
		FormName.mj.focus();
		return false;
	}
	if(!(isFloat(FormName.mj, "面积"))) {
		return false;
	}
	if(	javaTrim(FormName.fgms)=="") {
		alert("请输入[风格描述]！");
		FormName.fgms.focus();
		return false;
	}
	if(	javaTrim(FormName.zxzj)=="") {
		alert("请输入[装修造价]！");
		FormName.zxzj.focus();
		return false;
	}
	if(!(isFloat(FormName.zxzj, "装修造价"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.clzt)) {
		alert("请选择[状态]！");
		FormName.clzt[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
