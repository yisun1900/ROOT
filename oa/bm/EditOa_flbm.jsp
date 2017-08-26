<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String flbm=null;
String flmc=null;
String whereflbm=cf.GB2Uni(request.getParameter("flbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select flbm,flmc ";
	ls_sql+=" from  oa_flbm";
	ls_sql+=" where  (flbm='"+whereflbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		flbm=cf.fillNull(rs.getString("flbm"));
		flmc=cf.fillNull(rs.getString("flmc"));
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

<form method="post" action="SaveEditOa_flbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">办公用品分类编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="flbm" size="20" maxlength="2"  value="<%=flbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">办公用品分类名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="flmc" size="20" maxlength="50"  value="<%=flmc%>" >
  </td>
</tr>
<input type="hidden" name="whereflbm"  value="<%=whereflbm%>" >
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
	if(	javaTrim(FormName.flbm)=="") {
		alert("请输入[办公用品分类编码]！");
		FormName.flbm.focus();
		return false;
	}
	if(	javaTrim(FormName.flmc)=="") {
		alert("请输入[办公用品分类名称]！");
		FormName.flmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
