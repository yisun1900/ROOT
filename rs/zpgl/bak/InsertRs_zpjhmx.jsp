<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
String yhmc=(String)session.getAttribute("yhmc");
//String dwbh=cf.executeQuery("select dwbh from cl_clsgd where sgph='"+sgph+"'");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String zpmxbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(zpmxbh,9,3)),0)";
	ls_sql+=" from  rs_zpjhmx";
	ls_sql+=" where zpjhbh='"+zpjhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	zpmxbh=zpjhbh+cf.addZero(count,3);
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
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><b>招聘明细（编号：<%=zpmxbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘职位</td> 
  <td width="31%"> 
	<select name="zpzw" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
	  <%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%> 
	</select>
  </td>
  <td align="right" width="15%">招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="zprs" value="" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%" >备注</td> 
  <td width="35%" colspan="3"> 
     <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input name="zpjhbh" type="hidden" value="<%=zpjhbh%>">
    <input name="zpmxbh" type="hidden" value="<%=zpmxbh%>">
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
	if(	javaTrim(FormName.zpzw)=="") {
		alert("请输入[招聘职位]！");
		FormName.zpzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zprs)=="") {
		alert("请输入[招聘人数]！");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "招聘人数"))) {
		return false;
	}
	FormName.action="SaveInsertRs_zpjhmx.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
