<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String skxs=null;
String kclx=null;
String pxjg=null;
String pxjs=null;
String pxcd=null;
String pxrs=null;
String pxfy=null;
String gcrs=null;
String zcrs=null;
String jcrs=null;
String pxkssj=null;
String pxjssj=null;
String pxkc=null;
String kcnr=null;
String bz=null;
String wherepxmxbh=cf.GB2Uni(request.getParameter("pxmxbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select skxs,kclx,pxjg,pxjs,pxcd,pxrs,pxfy,gcrs,zcrs,jcrs,pxkssj,pxjssj,pxkc,kcnr,bz ";
	ls_sql+=" from  rs_pxzjmx";
	ls_sql+=" where  (pxmxbh='"+wherepxmxbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		skxs=cf.fillNull(rs.getString("skxs"));
		kclx=cf.fillNull(rs.getString("kclx"));
		pxjg=cf.fillNull(rs.getString("pxjg"));
		pxjs=cf.fillNull(rs.getString("pxjs"));
		pxcd=cf.fillNull(rs.getString("pxcd"));
		pxrs=cf.fillNull(rs.getString("pxrs"));
		pxfy=cf.fillNull(rs.getString("pxfy"));
		gcrs=cf.fillNull(rs.getString("gcrs"));
		zcrs=cf.fillNull(rs.getString("zcrs"));
		jcrs=cf.fillNull(rs.getString("jcrs"));
		pxkssj=cf.fillNull(rs.getDate("pxkssj"));
		pxjssj=cf.fillNull(rs.getDate("pxjssj"));
		pxkc=cf.fillNull(rs.getString("pxkc"));
		kcnr=cf.fillNull(rs.getString("kcnr"));
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
<form method="post" action="SaveEditRs_pxzjmx.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">授课形式</td> 
  <td width="35%"> 
    <select name="skxs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select skxs,skxsmc from rs_pxskxsbm order by skxs",skxs);
%>
    </select>
  </td>
  <td align="right" width="15%">课程类型</td> 
  <td width="35%"> 
    <select name="kclx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select kclx,lxmc  from rs_pxkclxbm order by kclx",kclx);
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训结果</td> 
  <td width="35%"> 
    <select name="pxjg" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"0+未完成&1+完成&2+部分完成",pxjg);
%>
    </select>
  </td>
  <td align="right" width="15%">培训讲师</td> 
  <td width="35%"> 
    <input type="text" name="pxjs" size="20" maxlength="40"  value="<%=pxjs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训场地</td> 
  <td width="35%"> 
    <input type="text" name="pxcd" size="20" maxlength="50"  value="<%=pxcd%>" >
  </td>
  <td align="right" width="15%">培训人数</td> 
  <td width="35%"> 
    <input type="text" name="pxrs" size="20" maxlength="8"  value="<%=pxrs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训费用</td> 
  <td width="35%"> 
    <input type="text" name="pxfy" size="20" maxlength="9"  value="<%=pxfy%>" >
  </td>
  <td align="right" width="15%">高层人数</td> 
  <td width="35%"> 
    <input type="text" name="gcrs" size="20" maxlength="8"  value="<%=gcrs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">中层人数</td> 
  <td width="35%"> 
    <input type="text" name="zcrs" size="20" maxlength="8"  value="<%=zcrs%>" >
  </td>
  <td align="right" width="15%">基层人数</td> 
  <td width="35%"> 
    <input type="text" name="jcrs" size="20" maxlength="8"  value="<%=jcrs%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训开始时间</td> 
  <td width="35%"> 
    <input type="text" name="pxkssj" size="20" maxlength="10"  value="<%=pxkssj%>" >
  </td>
  <td align="right" width="15%">培训结束时间</td> 
  <td width="35%"> 
    <input type="text" name="pxjssj" size="20" maxlength="10"  value="<%=pxjssj%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">培训课程</td> 
  <td width="35%"> 
    <textarea name="pxkc" cols="40" rows="3"><%=pxkc%></textarea>
  </td>
  <td align="right" width="15%">课程内容</td> 
  <td width="35%"> 
    <textarea name="kcnr" cols="40" rows="3"><%=kcnr%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
  </td>
</tr>
<input type="hidden" name="wherepxmxbh"  value="<%=wherepxmxbh%>" >
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
	if(	javaTrim(FormName.skxs)=="") {
		alert("请选择[授课形式]！");
		FormName.skxs.focus();
		return false;
	}
	if(	javaTrim(FormName.kclx)=="") {
		alert("请选择[课程类型]！");
		FormName.kclx.focus();
		return false;
	}
	if(	javaTrim(FormName.pxjg)=="") {
		alert("请选择[培训结果]！");
		FormName.pxjg.focus();
		return false;
	}
	if(	javaTrim(FormName.pxrs)=="") {
		alert("请输入[培训人数]！");
		FormName.pxrs.focus();
		return false;
	}
	if(!(isNumber(FormName.pxrs, "培训人数"))) {
		return false;
	}
	if(	javaTrim(FormName.pxfy)=="") {
		alert("请输入[培训费用]！");
		FormName.pxfy.focus();
		return false;
	}
	if(!(isFloat(FormName.pxfy, "培训费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gcrs)=="") {
		alert("请输入[高层人数]！");
		FormName.gcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.gcrs, "高层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.zcrs)=="") {
		alert("请输入[中层人数]！");
		FormName.zcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.zcrs, "中层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.jcrs)=="") {
		alert("请输入[基层人数]！");
		FormName.jcrs.focus();
		return false;
	}
	if(!(isNumber(FormName.jcrs, "基层人数"))) {
		return false;
	}
	if(	javaTrim(FormName.pxkssj)=="") {
		alert("请输入[培训开始时间]！");
		FormName.pxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxkssj, "培训开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.pxjssj)=="") {
		alert("请输入[培训结束时间]！");
		FormName.pxjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.pxjssj, "培训结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
