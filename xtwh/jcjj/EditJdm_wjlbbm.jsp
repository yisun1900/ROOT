<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wjlbbm=null;
String wjlbmc=null;
String wherewjlbbm=cf.GB2Uni(request.getParameter("wjlbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wjlbbm,wjlbmc ";
	ls_sql+=" from  jdm_wjlbbm";
	ls_sql+=" where  (wjlbbm='"+wherewjlbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjlbbm=cf.fillNull(rs.getString("wjlbbm"));
		wjlbmc=cf.fillNull(rs.getString("wjlbmc"));
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

<form method="post" action="SaveEditJdm_wjlbbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">五金类别编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wjlbbm" size="20" maxlength="2"  value="<%=wjlbbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">五金类别名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="wjlbmc" size="20" maxlength="50"  value="<%=wjlbmc%>" >
  </td>
</tr>
<input type="hidden" name="wherewjlbbm"  value="<%=wherewjlbbm%>" >
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
	if(	javaTrim(FormName.wjlbbm)=="") {
		alert("请输入[五金类别编码]！");
		FormName.wjlbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wjlbmc)=="") {
		alert("请输入[五金类别名称]！");
		FormName.wjlbmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
