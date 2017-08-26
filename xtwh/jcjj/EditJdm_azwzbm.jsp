<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String azwzbm=null;
String azwzmc=null;
String whereazwzbm=cf.GB2Uni(request.getParameter("azwzbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select azwzbm,azwzmc ";
	ls_sql+=" from  jdm_azwzbm";
	ls_sql+=" where  (azwzbm='"+whereazwzbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		azwzbm=cf.fillNull(rs.getString("azwzbm"));
		azwzmc=cf.fillNull(rs.getString("azwzmc"));
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

<form method="post" action="SaveEditJdm_azwzbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">安装位置编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="azwzbm" size="20" maxlength="2"  value="<%=azwzbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">安装位置名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="azwzmc" size="20" maxlength="50"  value="<%=azwzmc%>" >
  </td>
</tr>
<input type="hidden" name="whereazwzbm"  value="<%=whereazwzbm%>" >
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
	if(	javaTrim(FormName.azwzbm)=="") {
		alert("请输入[安装位置编码]！");
		FormName.azwzbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
