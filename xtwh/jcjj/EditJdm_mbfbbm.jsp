<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mbfbbm=null;
String mbfbmc=null;
String wherembfbbm=cf.GB2Uni(request.getParameter("mbfbbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mbfbbm,mbfbmc ";
	ls_sql+=" from  jdm_mbfbbm";
	ls_sql+=" where  (mbfbbm='"+wherembfbbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mbfbbm=cf.fillNull(rs.getString("mbfbbm"));
		mbfbmc=cf.fillNull(rs.getString("mbfbmc"));
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

<form method="post" action="SaveEditJdm_mbfbbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">门板封边编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mbfbbm" size="20" maxlength="2"  value="<%=mbfbbm%>" >
  </td>
  <td width="15%"> 
    <div align="right">门板封边名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="mbfbmc" size="20" maxlength="50"  value="<%=mbfbmc%>" >
  </td>
</tr>
<input type="hidden" name="wherembfbbm"  value="<%=wherembfbbm%>" >
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
	if(	javaTrim(FormName.mbfbbm)=="") {
		alert("请输入[门板封边编码]！");
		FormName.mbfbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mbfbmc)=="") {
		alert("请输入[门板封边名称]！");
		FormName.mbfbmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
