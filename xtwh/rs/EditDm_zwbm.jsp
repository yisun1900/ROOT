<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zwbm=null;
String zwmc=null;
String wherezwbm=cf.GB2Uni(request.getParameter("zwbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select zwbm,zwmc ";
	ls_sql+=" from  dm_zwbm";
	ls_sql+=" where  (zwbm='"+wherezwbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zwbm=cf.fillNull(rs.getString("zwbm"));
		zwmc=cf.fillNull(rs.getString("zwmc"));
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

<form method="post" action="SaveEditDm_zwbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">工种编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zwbm" size="20" maxlength="2"  value="<%=zwbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">工种名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zwmc" size="20" maxlength="50"  value="<%=zwmc%>" >
  </td>
</tr>
<input type="hidden" name="wherezwbm"  value="<%=wherezwbm%>" >
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
	if(	javaTrim(FormName.zwbm)=="") {
		alert("请输入[工种编码]！");
		FormName.zwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zwmc)=="") {
		alert("请输入[工种名称]！");
		FormName.zwmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
