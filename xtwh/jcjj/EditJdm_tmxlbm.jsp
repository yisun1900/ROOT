<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String tmxlbm=null;
String tmxlmc=null;
String wheretmxlbm=cf.GB2Uni(request.getParameter("tmxlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select tmxlbm,tmxlmc ";
	ls_sql+=" from  jdm_tmxlbm";
	ls_sql+=" where  (tmxlbm='"+wheretmxlbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		tmxlbm=cf.fillNull(rs.getString("tmxlbm"));
		tmxlmc=cf.fillNull(rs.getString("tmxlmc"));
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

<form method="post" action="SaveEditJdm_tmxlbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">台面系列编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tmxlbm" size="20" maxlength="2"  value="<%=tmxlbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">台面系列名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="tmxlmc" size="20" maxlength="50"  value="<%=tmxlmc%>" >
  </td>
</tr>
<input type="hidden" name="wheretmxlbm"  value="<%=wheretmxlbm%>" >
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
	if(	javaTrim(FormName.tmxlbm)=="") {
		alert("请输入[台面系列编码]！");
		FormName.tmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmxlmc)=="") {
		alert("请输入[台面系列名称]！");
		FormName.tmxlmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
