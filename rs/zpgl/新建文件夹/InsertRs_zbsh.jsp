<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String sqbh=cf.GB2Uni(request.getParameter("sqbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
int shbh_int=0;
String shbh=null;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(shbh),0)";
	ls_sql+=" from  rs_ryzbsq ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		shbh_int=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	shbh=cf.addZero(shbh_int,8);
}
catch (Exception e) {
	out.print("发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">序号</td>
	<td  width="12%">增补申请编号</td>
	<td  width="18%">审批状态</td>
	<td  width="10%">审核结论</td>
	<td  width="10%">审核人</td>
	<td  width="10%">审核时间</td>
	<td  width="30%">审核意见</td>
</tr>
<%
	int row=0;
	String ys=null;
	String shbh_v=null;
	String jhbh=null;
	String shjl=null;
	String shr=null;
	String shsj=null;
	String shyj=null;
	String yztbm=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT rs_ryzbsq.shbh shbh,rs_ryzbsq.sqbh sqbh,rs_ztbm.ztmc yztbm,rs_ryzbsqbm.shjlmc shjl,rs_ryzbsq.shr shr,TO_CHAR(shsj,'YYYY-MM-DD') shsj,rs_ryzbsq.shyj shyj ";
	ls_sql+=" FROM rs_ryzbsq,rs_ryzbsqbm,rs_ztbm  ";
    ls_sql+=" where rs_ryzbsq.shjl=rs_ryzbsqbm.shjl and rs_ztbm.ztbm=rs_ryzbsq.yztbm and rs_ryzbsq.sqbh='"+sqbh+"'";
	ls_sql+=" order by shbh";
//	out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
//		shbh_v=rs.getString("shbh");
		jhbh=rs.getString("sqbh");
		shjl=rs.getString("shjl");
		shr=rs.getString("shr");
		shsj=rs.getString("shsj");
		shyj=cf.fillHtml(rs.getString("shyj"));
		yztbm=rs.getString("yztbm");

		row++;

		if (row%2==0)
		{
			ys="#E8E8FF";
		}
		else{
			ys="#FFFFFF";
		}
%> 
  <tr align="center" bgcolor="<%=ys%>">
    <td><%=row%></td>
    <td><A HREF="viewzpjhmx.jsp?sqbh=<%=jhbh%>" target="_blank"><%=jhbh%></A></td>
	<td><%=yztbm%></td>
    <td><%=shjl%></td>
    <td><%=shr%></td>
    <td><%=shsj%></td>
    <td><%=shyj%></td>
  </tr>
  <%
		}
		rs.close();
		ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e+"<br>");
	out.print("<font color=red>请选择可审核状态!</font>");
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
</table>
<form method="post" action="SaveInsertrs_ryzbsq.jsp" name="insertform" target="_blank">
<div align="center">增补申请审核</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">计划编号</font></td> 
  <td width="35%"> 
    <input type="text" name="sqbh" value="<%=sqbh%>" size="20" maxlength="8" readonly>
  </td>
  <td align="right" width="15%">审核结论</td> 
  <td width="35%"> 
    <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="1">同意</option>
    <option value="0">驳回</option>
    <option value="9">修改计划</option>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">审核人</font></td> 
  <td width="35%"> 
    <input type="text" name="shr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
    <td align="right" width="15%"><font color="#0000FF">审核时间</font></td> 
  <td width="35%"> 
    <input type="text" name="shsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核意见</td> 
  <td width="35%" colspan="3"> 
    <textarea name="shyj" cols="71" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input name="shbh" type="hidden" value="<%=shbh%>" >
	<input type="button"  value="存盘" onClick="f_do(insertform)" name="savebutton">
	<input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.shbh)=="") {
		alert("请输入[审核编号]！");
		FormName.shbh.focus();
		return false;
	}
	if(!(isNumber(FormName.shbh, "审核编号"))) {
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
	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
