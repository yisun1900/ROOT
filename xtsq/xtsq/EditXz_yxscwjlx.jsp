<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wjlx=null;
String bz=null;
String wherewjlx=cf.GB2Uni(request.getParameter("wjlx"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wjlx,bz ";
	ls_sql+=" from  xz_yxscwjlx";
	ls_sql+=" where  (wjlx='"+wherewjlx+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjlx=cf.fillNull(rs.getString("wjlx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditXz_yxscwjlx.jsp" name="editform">
<div align="center">请修改信息</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">文件类型</td>
      <td colspan="3" width="85%"> 
        <input type="text" name="wjlx" size="20" maxlength="20"  value="<%=wjlx%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">备注</td>
      <td colspan="3" width="85%"> 
        <textarea name="bz" cols="73" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wherewjlx"  value="<%=wherewjlx%>" >
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="保存" onClick="f_do(editform)">
          <input type="reset"  value="重输">
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
	if(	javaTrim(FormName.wjlx)=="") {
		alert("请输入[文件类型]！");
		FormName.wjlx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
