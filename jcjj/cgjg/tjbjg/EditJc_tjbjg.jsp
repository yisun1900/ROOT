<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tjbbm=null;
String jg=null;
String wheretjbbm=cf.GB2Uni(request.getParameter("tjbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tjbbm,jg ";
	ls_sql+=" from  jc_tjbjg";
	ls_sql+=" where  (tjbbm='"+wheretjbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tjbbm=cf.fillNull(rs.getString("tjbbm"));
		jg=cf.fillNull(rs.getString("jg"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_tjbjg.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">踢脚板</div>
  </td>
  <td width="35%"> 
    <select name="tjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select tjbbm,tjbmc from jdm_tjbbm order by tjbbm",tjbbm);
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">价格</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jg" size="20" maxlength="9"  value="<%=jg%>" >
  </td>
</tr>
<input type="hidden" name="wheretjbbm"  value="<%=wheretjbbm%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tjbbm)=="") {
		alert("请选择[踢脚板]！");
		FormName.tjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("请输入[价格]！");
		FormName.jg.focus();
		return false;
	}
	if(!(isFloat(FormName.jg, "价格"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
