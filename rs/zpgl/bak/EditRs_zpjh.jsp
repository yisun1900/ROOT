<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");

String zprs=null;
String zpfy=null;
String fgs=null;
String jhkssj=null;
String jhjssj=null;
String bz=null;
String wherezpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zprs,zpfy,fgs,jhkssj,jhjssj,bz ";
	ls_sql+=" from  rs_zpjh";
	ls_sql+=" where  (zpjhbh='"+wherezpjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zprs=cf.fillNull(rs.getString("zprs"));
		zpfy=cf.fillNull(rs.getString("zpfy"));
		fgs=cf.fillNull(rs.getString("fgs"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
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
<form method="post" action="" name="editform">
<div align="center"><b>修改招聘计划（编号：<%=wherezpjhbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8"  value="<%=zprs%>" >
  </td>
  <td align="right" width="15%">招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9"  value="<%=zpfy%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划申请公司</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh",fgs);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fgs);
	}
%> 
      </select>
  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划开始时间</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj" size="20" maxlength="10"  value="<%=jhkssj%>" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">计划结束时间</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj" size="20" maxlength="10"  value="<%=jhjssj%>" ondblclick="JSCalendar(this)">
  </td>
 </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherezpjhbh"  value="<%=wherezpjhbh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
   	  <input type="button"  value="录入明细" onClick="f_lrmx(editform)">
  	  <input type="button"  value="修改明细" onClick="f_mx(editform)">
	  <input type="button"  value="完成" onClick="f_wc(editform)">
	</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zprs)=="") {
		alert("请输入[招聘人数]！");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "招聘人数"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("请输入[招聘费用]！");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "招聘费用"))) {
		return false;
	}
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.jhkssj)=="") {
		alert("请输入[计划开始时间]！");
		FormName.jhkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhkssj, "计划开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jhjssj)=="") {
		alert("请输入[计划结束时间]！");
		FormName.jhjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "计划结束时间"))) {
		return false;
	}
	FormName.action="SaveEditRs_zpjh.jsp";
	FormName.submit();
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	FormName.action="EditRs_zpjhwc.jsp";
	FormName.submit();
	return true;
}
function f_mx(FormName)//参数FormName:Form的名称
{
	FormName.action="Rs_zpjhmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrmx(FormName)//参数FormName:Form的名称
{
	FormName.action="EditInsertRs_zpjhmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
