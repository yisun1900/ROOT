<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zczjxyybm=null;
String zczjxyymc=null;
String wherezczjxyybm=cf.GB2Uni(request.getParameter("zczjxyybm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zczjxyybm,zczjxyymc ";
	ls_sql+=" from  jdm_zczjxyybm";
	ls_sql+=" where  (zczjxyybm='"+wherezczjxyybm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zczjxyybm=cf.fillNull(rs.getString("zczjxyybm"));
		zczjxyymc=cf.fillNull(rs.getString("zczjxyymc"));
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

<form method="post" action="SaveEditJdm_zczjxyybm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">主材增减项原因编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zczjxyybm" size="20" maxlength="2"  value="<%=zczjxyybm%>" >
  </td>
  <td width="15%"> 
    <div align="right">主材增减项原因名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zczjxyymc" size="20" maxlength="50"  value="<%=zczjxyymc%>" >
  </td>
</tr>
<input type="hidden" name="wherezczjxyybm"  value="<%=wherezczjxyybm%>" >
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
	if(	javaTrim(FormName.zczjxyybm)=="") {
		alert("请输入[主材增减项原因编码]！");
		FormName.zczjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.zczjxyymc)=="") {
		alert("请输入[主材增减项原因名称]！");
		FormName.zczjxyymc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
