<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String slfsbm=null;
String slfsmc=null;
String whereslfsbm=cf.GB2Uni(request.getParameter("slfsbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select slfsbm,slfsmc ";
	ls_sql+=" from  dm_slfsbm";
	ls_sql+=" where  (slfsbm='"+whereslfsbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		slfsmc=cf.fillNull(rs.getString("slfsmc"));
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

<form method="post" action="SaveEditDm_slfsbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">投诉受理方式编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="slfsbm" size="20" maxlength="1"  value="<%=slfsbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">投诉受理方式名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="slfsmc" size="20" maxlength="50"  value="<%=slfsmc%>" >
  </td>
</tr>
<input type="hidden" name="whereslfsbm"  value="<%=whereslfsbm%>" >
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
	if(	javaTrim(FormName.slfsbm)=="") {
		alert("请输入[投诉受理方式编码]！");
		FormName.slfsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.slfsmc)=="") {
		alert("请输入[投诉受理方式名称]！");
		FormName.slfsmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
