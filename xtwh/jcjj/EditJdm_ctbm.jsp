<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ctbm=null;
String ctmc=null;
String wherectbm=cf.GB2Uni(request.getParameter("ctbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ctbm,ctmc ";
	ls_sql+=" from  jdm_ctbm";
	ls_sql+=" where  (ctbm='"+wherectbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ctbm=cf.fillNull(rs.getString("ctbm"));
		ctmc=cf.fillNull(rs.getString("ctmc"));
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

<form method="post" action="SaveEditJdm_ctbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">抽屉编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ctbm" size="20" maxlength="2"  value="<%=ctbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">抽屉名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ctmc" size="20" maxlength="50"  value="<%=ctmc%>" >
  </td>
</tr>
<input type="hidden" name="wherectbm"  value="<%=wherectbm%>" >
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
	if(	javaTrim(FormName.ctbm)=="") {
		alert("请输入[抽屉编码]！");
		FormName.ctbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ctmc)=="") {
		alert("请输入[抽屉名称]！");
		FormName.ctmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
