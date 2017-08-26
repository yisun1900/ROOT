<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String mpbb=null;
String wherempbb=cf.GB2Uni(request.getParameter("mpbb"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select mpbb ";
	ls_sql+=" from  xz_mpbb";
	ls_sql+=" where  (mpbb='"+wherempbb+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mpbb=cf.fillNull(rs.getString("mpbb"));
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
<form method="post" action="" name="editform">
<div align="center">请修改信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">名片版本</td> 
  <td width="35%"> 
    <input type="text" name="mpbb" size="20" maxlength="20"  value="<%=mpbb%>" >
  </td>
  <td align="right" width="15%">&nbsp; 
    
  </td>
  <td width="35%">&nbsp; 
    
  </td>
</tr>
<input type="hidden" name="wherempbb"  value="<%=wherempbb%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
	<div align="center">
	  <input type="button"  value="保存" onClick="f_do(editform)">
	  <input type="reset"  value="重输">
          <input type="button"  value="上传照片" onClick="f_do1(editform)" name="button">
        </div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mpbb)=="") {
		alert("请输入[名片版本]！");
		FormName.mpbb.focus();
		return false;
	}
	FormName.action="SaveEditXz_mpbb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mpbb)=="") {
		alert("请输入[名片版本]！");
		FormName.mpbb.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
