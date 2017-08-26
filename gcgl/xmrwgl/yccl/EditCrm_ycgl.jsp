<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ycdbh=null;
String khbh=null;
String ycflbm=null;
String ycfssj=null;
String zrr=null;
String ycqksm=null;
String fazdr=null;
String fazdsj=null;
String jhjjsj=null;
String jjfa=null;
String sjclr=null;
String sjclsj=null;
String sjclqk=null;
String wcsj=null;
String sfjj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String whereycdbh=cf.GB2Uni(request.getParameter("ycdbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ycdbh,khbh,ycflbm,ycfssj,zrr,ycqksm,fazdr,fazdsj,jhjjsj,jjfa,sjclr,sjclsj,sjclqk,wcsj,sfjj,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  crm_ycgl";
	ls_sql+=" where  (ycdbh='"+whereycdbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ycdbh=cf.fillNull(rs.getString("ycdbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		ycflbm=cf.fillNull(rs.getString("ycflbm"));
		ycfssj=cf.fillNull(rs.getDate("ycfssj"));
		zrr=cf.fillNull(rs.getString("zrr"));
		ycqksm=cf.fillNull(rs.getString("ycqksm"));
		fazdr=cf.fillNull(rs.getString("fazdr"));
		fazdsj=cf.fillNull(rs.getDate("fazdsj"));
		jhjjsj=cf.fillNull(rs.getDate("jhjjsj"));
		jjfa=cf.fillNull(rs.getString("jjfa"));
		sjclr=cf.fillNull(rs.getString("sjclr"));
		sjclsj=cf.fillNull(rs.getDate("sjclsj"));
		sjclqk=cf.fillNull(rs.getString("sjclqk"));
		wcsj=cf.fillNull(rs.getDate("wcsj"));
		sfjj=cf.fillNull(rs.getString("sfjj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<form method="post" action="SaveEditCrm_ycgl.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">异常单编号</td> 
  <td width="35%"> 
    <input type="text" name="ycdbh" size="20" maxlength="10"  value="<%=ycdbh%>" >
  </td>
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">异常分类</td> 
  <td width="35%"> 
    <select name="ycflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ycflbm,ycflmc from dm_ycflbm order by ycflbm",ycflbm);
%>
    </select>
  </td>
  <td align="right" width="15%">异常发生时间</td> 
  <td width="35%"> 
    <input type="text" name="ycfssj" size="20" maxlength="10"  value="<%=ycfssj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">责任人</td> 
  <td width="35%"> 
    <input type="text" name="zrr" size="20" maxlength="20"  value="<%=zrr%>" >
  </td>
  <td align="right" width="15%">异常情况说明</td> 
  <td width="35%"> 
    <textarea name="ycqksm" cols="29" rows="6"><%=ycqksm%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">方案制订人</td> 
  <td width="35%"> 
    <input type="text" name="fazdr" size="20" maxlength="20"  value="<%=fazdr%>" >
  </td>
  <td align="right" width="15%">方案制订时间</td> 
  <td width="35%"> 
    <input type="text" name="fazdsj" size="20" maxlength="10"  value="<%=fazdsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划解决时间</td> 
  <td width="35%"> 
    <input type="text" name="jhjjsj" size="20" maxlength="10"  value="<%=jhjjsj%>" >
  </td>
  <td align="right" width="15%">解决方案</td> 
  <td width="35%"> 
    <textarea name="jjfa" cols="29" rows="6"><%=jjfa%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际处理人</td> 
  <td width="35%"> 
    <input type="text" name="sjclr" size="20" maxlength="20"  value="<%=sjclr%>" >
  </td>
  <td align="right" width="15%">实际处理时间</td> 
  <td width="35%"> 
    <input type="text" name="sjclsj" size="20" maxlength="10"  value="<%=sjclsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际处理情况</td> 
  <td width="35%"> 
    <textarea name="sjclqk" cols="29" rows="6"><%=sjclqk%></textarea>
  </td>
  <td align="right" width="15%">完成时间</td> 
  <td width="35%"> 
    <input type="text" name="wcsj" size="20" maxlength="10"  value="<%=wcsj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否解决</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sfjj","1+录入异常&2+制订方案&3+解决",sfjj);
%>
  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" >
  </td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"> 
    <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",lrbm);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%"> 
    <textarea name="bz" cols="29" rows="2"><%=bz%></textarea>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
<input type="hidden" name="whereycdbh"  value="<%=whereycdbh%>" >
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
	if(	javaTrim(FormName.ycdbh)=="") {
		alert("请输入[异常单编号]！");
		FormName.ycdbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ycflbm)=="") {
		alert("请选择[异常分类]！");
		FormName.ycflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ycfssj)=="") {
		alert("请输入[异常发生时间]！");
		FormName.ycfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ycfssj, "异常发生时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ycqksm)=="") {
		alert("请输入[异常情况说明]！");
		FormName.ycqksm.focus();
		return false;
	}
	if(!(isDatetime(FormName.fazdsj, "方案制订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "计划解决时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sjclsj, "实际处理时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "完成时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfjj)) {
		alert("请选择[是否解决]！");
		FormName.sfjj[0].focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
