<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zzjgbm=null;
String zzjgmc=null;
String wherezzjgbm=cf.GB2Uni(request.getParameter("zzjgbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select zzjgbm,zzjgmc ";
	ls_sql+=" from  dm_zzjgbm";
	ls_sql+=" where  (zzjgbm='"+wherezzjgbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zzjgbm=cf.fillNull(rs.getString("zzjgbm"));
		zzjgmc=cf.fillNull(rs.getString("zzjgmc"));
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

<form method="post" action="SaveEditDm_zzjgbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="22%"> 
                <div align="right">投诉报修结案结论编码</div>
  </td>
              <td width="28%"> 
                <input type="text" name="zzjgbm" size="20" maxlength="1"  value="<%=zzjgbm%>" >
  </td>
              <td width="21%"> 
                <div align="right">投诉报修结案结论名称</div>
  </td>
              <td width="29%"> 
                <input type="text" name="zzjgmc" size="20" maxlength="50"  value="<%=zzjgmc%>" >
  </td>
</tr>
<input type="hidden" name="wherezzjgbm"  value="<%=wherezzjgbm%>" >
	    <tr> 
              <td width="22%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="28%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="21%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="29%" height="2"> 
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
	if(	javaTrim(FormName.zzjgbm)=="") {
		alert("请输入[投诉报修结案结论编码]！");
		FormName.zzjgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zzjgmc)=="") {
		alert("请输入[投诉报修结案结论名称]！");
		FormName.zzjgmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
