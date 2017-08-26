<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");

String pxrs=null;
String pxfy=null;
String fgs=null;
//String jhkssj=null;
//String jhjssj=null;
String bz=null;
String pxjhmc=null;
String sfjhn=null;

String wherepxjhbh=cf.GB2Uni(request.getParameter("pxjhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select pxjhmc,pxrs,pxfy,fgs,bz,sfjhn ";
	ls_sql+=" from  rs_pxjh";
	ls_sql+=" where  (pxjhbh='"+wherepxjhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		pxrs=cf.fillNull(rs.getString("pxrs"));
		pxfy=cf.fillNull(rs.getString("pxfy"));
		fgs=cf.fillNull(rs.getString("fgs"));
//		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
//		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		bz=cf.fillNull(rs.getString("bz"));
		pxjhmc=cf.fillNull(rs.getString("pxjhmc"));
		sfjhn=cf.fillNull(rs.getString("sfjhn"));

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
<div align="center"><b>修改培训计划（编号：<%=wherepxjhbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训计划名称</td> 
  <td width="35%"> 
    <input type="text" name="pxjhmc" size="20" maxlength="25"  value="<%=pxjhmc%>" >
  </td>

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
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=blue>培训人数</font></td> 
  <td width="35%"> 
    <input type="text" name="pxrs" size="20" maxlength="8"  value="<%=pxrs%>" readonly>
  </td>
  <td align="right" width="15%"><font color=blue>培训费用</font></td> 
  <td width="35%"> 
    <input type="text" name="pxfy" size="20" maxlength="9"  value="<%=pxfy%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">是否计划内</td> 
  <td width="35%"> <%
	cf.radioToken(out, "sfjhn","0+计划内&1+计划外",sfjhn);
	%> 
  </td>
  <td>
  &nbsp;
  </td>
    <td>
  &nbsp;
  </td>

</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows=""><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherepxjhbh"  value="<%=wherepxjhbh%>" >
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
	if(	javaTrim(FormName.pxjhmc)=="") {
		alert("请输入[培训计划名称]！");
		FormName.pxjhmc.focus();
		return false;
	}

//	if(	javaTrim(FormName.pxrs)=="") {
//		alert("请输入[培训人数]！");
//		FormName.pxrs.focus();
//		return false;
//	}
//	if(!(isNumber(FormName.pxrs, "培训人数"))) {
//		return false;
//	}
//	if(	javaTrim(FormName.pxfy)=="") {
//		alert("请输入[培训费用]！");
//		FormName.pxfy.focus();
//		return false;
//	}
//	if(!(isFloat(FormName.pxfy, "培训费用"))) {
//		return false;
//	}
//	if(	javaTrim(FormName.fgs)=="") {
//		alert("请选择[所属分公司]！");
//		FormName.fgs.focus();
//		return false;
//	}
//	if(	javaTrim(FormName.jhkssj)=="") {
//		alert("请输入[计划开始时间]！");
//		FormName.jhkssj.focus();
//		return false;
//	}
//	if(!(isDatetime(FormName.jhkssj, "计划开始时间"))) {
//		return false;
//	}
//	if(	javaTrim(FormName.jhjssj)=="") {
//		alert("请输入[计划结束时间]！");
//		FormName.jhjssj.focus();
//		return false;
//	}
//	if(!(isDatetime(FormName.jhjssj, "计划结束时间"))) {
//		return false;
//	}
	FormName.action="SaveEditRs_pxjh.jsp";
	FormName.submit();
	return true;
}
function f_wc(FormName)//参数FormName:Form的名称
{
	FormName.action="EditRs_pxjhwc.jsp";
	FormName.submit();
	return true;
}
function f_mx(FormName)//参数FormName:Form的名称
{
	FormName.action="Rs_pxjhmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrmx(FormName)//参数FormName:Form的名称
{
	FormName.action="EditInsertRs_pxjhmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
