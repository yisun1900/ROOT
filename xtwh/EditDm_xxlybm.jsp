<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xxlybm=null;
String xxlymc=null;
String wherexxlybm=cf.GB2Uni(request.getParameter("xxlybm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select xxlybm,xxlymc ";
	ls_sql+=" from  dm_xxlybm";
	ls_sql+=" where  (xxlybm='"+wherexxlybm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		xxlybm=cf.fillNull(rs.getString("xxlybm"));
		xxlymc=cf.fillNull(rs.getString("xxlymc"));
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

<form method="post" action="SaveEditDm_xxlybm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">信息来源编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xxlybm" size="20" maxlength="2"  value="<%=xxlybm%>" >
  </td>
  <td width="15%"> 
    <div align="right">信息来源名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xxlymc" size="20" maxlength="50"  value="<%=xxlymc%>" >
  </td>
</tr>
<input type="hidden" name="wherexxlybm"  value="<%=wherexxlybm%>" >
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
	if(	javaTrim(FormName.xxlybm)=="") {
		alert("请输入[信息来源编码]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(	javaTrim(FormName.xxlymc)=="") {
		alert("请输入[信息来源名称]！");
		FormName.xxlymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
