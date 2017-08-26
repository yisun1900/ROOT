<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpjjhsbm=null;
String cpjjhs=null;
String cpjjczbm=null;
String wherecpjjhsbm=cf.GB2Uni(request.getParameter("cpjjhsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cpjjhsbm,cpjjhs,cpjjczbm ";
	ls_sql+=" from  jdm_cpjjhs";
	ls_sql+=" where  (cpjjhsbm='"+wherecpjjhsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cpjjhsbm=cf.fillNull(rs.getString("cpjjhsbm"));
		cpjjhs=cf.fillNull(rs.getString("cpjjhs"));
		cpjjczbm=cf.fillNull(rs.getString("cpjjczbm"));
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
<form method="post" action="SaveEditJdm_cpjjhs.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">成品家具材质</td>
      <td width="27%"> 
        <select name="cpjjczbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="getItemValue(cpjjczbm,cpjjhsbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjczbm,cpjjcz from jdm_cpjjcz order by cpjjczbm",cpjjczbm);
%> 
        </select>
      </td>
      <td align="right" width="20%">&nbsp; </td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">成品家具花色编码（<font color="#FF0000"><b>4位</b></font>）</td>
      <td width="27%"> 
        <input type="text" name="cpjjhsbm" size="20" maxlength="4"  value="<%=cpjjhsbm%>" >
      </td>
      <td align="right" width="20%">成品家具花色</td>
      <td width="30%"> 
        <input type="text" name="cpjjhs" size="20" maxlength="50"  value="<%=cpjjhs%>" >
      </td>
    </tr>
    <input type="hidden" name="wherecpjjhsbm"  value="<%=wherecpjjhsbm%>" >
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
	if(	javaTrim(FormName.cpjjczbm)=="") {
		alert("请选择[成品家具材质]！");
		FormName.cpjjczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhsbm)=="") {
		alert("请输入[成品家具花色编码]！");
		FormName.cpjjhsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhs)=="") {
		alert("请输入[成品家具花色]！");
		FormName.cpjjhs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
