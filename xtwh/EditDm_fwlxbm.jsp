<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fwlxbm=null;
String fwlxmc=null;
String wherefwlxbm=cf.GB2Uni(request.getParameter("fwlxbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select fwlxbm,fwlxmc ";
	ls_sql+=" from  dm_fwlxbm";
	ls_sql+=" where  (fwlxbm='"+wherefwlxbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		fwlxmc=cf.fillNull(rs.getString("fwlxmc"));
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

<form method="post" action="SaveEditDm_fwlxbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">房屋类型编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fwlxbm" size="20" maxlength="1"  value="<%=fwlxbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">房屋类型名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fwlxmc" size="20" maxlength="50"  value="<%=fwlxmc%>" >
  </td>
</tr>
<input type="hidden" name="wherefwlxbm"  value="<%=wherefwlxbm%>" >
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
	if(	javaTrim(FormName.fwlxbm)=="") {
		alert("请输入[房屋类型编码]！");
		FormName.fwlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwlxmc)=="") {
		alert("请输入[房屋类型名称]！");
		FormName.fwlxmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
