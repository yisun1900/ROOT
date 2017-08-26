<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ysrbm=null;
String ysrmc=null;
String ysrxx=null;
String ysrsx=null;
String whereysrbm=cf.GB2Uni(request.getParameter("ysrbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ysrbm,ysrmc,ysrxx,ysrsx ";
	ls_sql+=" from  dm_ysrbm";
	ls_sql+=" where  (ysrbm='"+whereysrbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		ysrmc=cf.fillNull(rs.getString("ysrmc"));
		ysrxx=cf.fillNull(rs.getString("ysrxx"));
		ysrsx=cf.fillNull(rs.getString("ysrsx"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

<form method="post" action="SaveEditDm_ysrbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">月收入编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrbm" size="20" maxlength="2"  value="<%=ysrbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">月收入名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrmc" size="20" maxlength="50"  value="<%=ysrmc%>" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">月收入下限</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrxx" size="20" maxlength="17"  value="<%=ysrxx%>" >
  </td>
  <td width="15%"> 
    <div align="right">月收入上限</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ysrsx" size="20" maxlength="17"  value="<%=ysrsx%>" >
  </td>
</tr>
<input type="hidden" name="whereysrbm"  value="<%=whereysrbm%>" >
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
	if(	javaTrim(FormName.ysrbm)=="") {
		alert("请输入[月收入编码]！");
		FormName.ysrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysrmc)=="") {
		alert("请输入[月收入名称]！");
		FormName.ysrmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysrxx)=="") {
		alert("请输入[月收入下限]！");
		FormName.ysrxx.focus();
		return false;
	}
	if(!(isFloat(FormName.ysrxx, "月收入下限"))) {
		return false;
	}
	if(	javaTrim(FormName.ysrsx)=="") {
		alert("请输入[月收入上限]！");
		FormName.ysrsx.focus();
		return false;
	}
	if(!(isFloat(FormName.ysrsx, "月收入上限"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
