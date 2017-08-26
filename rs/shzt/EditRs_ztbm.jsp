<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ztbm=null;
String ztmc=null;
String ztlx=null;
String sqzt=null;
String whereztbm=cf.GB2Uni(request.getParameter("ztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ztbm,ztmc,ztlx,sqzt ";
	ls_sql+=" from  rs_ztbm";
	ls_sql+=" where  (ztbm='"+whereztbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ztbm=cf.fillNull(rs.getString("ztbm"));
		ztmc=cf.fillNull(rs.getString("ztmc"));
		ztlx=cf.fillNull(rs.getString("ztlx"));
		sqzt=cf.fillNull(rs.getString("sqzt"));
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
<form method="post" action="SaveEditRs_ztbm.jsp" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">状态编码</td> 
  <td width="35%"> 
    <input type="text" name="ztbm" size="20" maxlength="4"  value="<%=ztbm%>" >
  </td>
  <td align="right" width="15%">状态名称</td> 
  <td width="35%"> 
    <input type="text" name="ztmc" size="20" maxlength="40"  value="<%=ztmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">状态类型</td> 
  <td width="35%"> 
    <select name="ztlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+招聘&02+培训&03+变动&04+费用审批&06+二次入职&07+调休申请&08+加班申请&09+考勤卡修正单&10+请假单&11+出差申请&12+增设岗位申请&13+辞职申请&14+退回人员申请",ztlx);
%>
    </select>
  </td>
  <td align="right" width="15%">需修改申请状态</td> 
  <td width="35%"> 
    <select name="sqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"02+正在审批&03+审批通过&04+审批取消",sqzt);
%>
    </select>
  </td>
</tr>
<input type="hidden" name="whereztbm"  value="<%=whereztbm%>" >
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
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请输入[状态编码]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ztmc)=="") {
		alert("请输入[状态名称]！");
		FormName.ztmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ztlx)=="") {
		alert("请选择[状态类型]！");
		FormName.ztlx.focus();
		return false;
	}
	if(	javaTrim(FormName.sqzt)=="") {
		alert("请选择[需修改申请状态]！");
		FormName.sqzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
