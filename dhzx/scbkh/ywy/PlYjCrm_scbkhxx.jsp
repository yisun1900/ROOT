<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String[] scbkhbh = request.getParameterValues("scbkhbh");

String ssfgs=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select ssfgs";
	ls_sql+=" from  crm_scbkhxx";
	ls_sql+=" where scbkhbh='"+scbkhbh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
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
<title>移交</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SavePlYjCrm_scbkhxx.jsp" name="editform">
<div align="center">市场部客户－批量移交</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>状态</td> 
  <td width="35%"> 
   <INPUT name="zt" type="radio" value="3" checked>
   移交   </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>移交部门</td> 
  <td width="35%"> 
    <select name="yjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">移交说明</td>
  <td colspan="3"><textarea name="yjsm" cols="72" rows="3"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">移交人</span></td> 
  <td width="35%"><input type="text" name="yjr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right" width="15%"><span class="STYLE1">*</span><span class="STYLE2">移交时间</span></td> 
  <td width="35%"><input type="text" name="yjsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
<%
for (int i=0;i<scbkhbh.length ;i++ )
{
	%>
	<input type="hidden" name="scbkhbh"  value="<%=scbkhbh[i]%>" >
	<%
}
%>
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

	if(	javaTrim(FormName.yjbm)=="") {
		alert("请输入[移交部门]！");
		FormName.yjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjr)=="") {
		alert("请输入[移交人]！");
		FormName.yjr.focus();
		return false;
	}
	if(	javaTrim(FormName.yjsj)=="") {
		alert("请输入[移交时间]！");
		FormName.yjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjsj, "移交时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
