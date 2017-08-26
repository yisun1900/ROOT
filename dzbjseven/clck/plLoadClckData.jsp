<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入材料出库单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh = request.getParameter("khbh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	int  gdjsjd=0;
	ls_sql="select gdjsjd";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjd=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if(gdjsjd>0){
		
		out.println("<BR>错误！此客户已做结算，不能导入材料！");
		return;
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<body bgcolor="#FFFFFF">
<CENTER><B>导入材料出库单</B><BR><HR>
<form method="post" action="SavePlLoadData.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
			<input type="hidden" name="khbh" value="<%=khbh%>">
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="继续" onclick="f_onclick(loadform)">
          </p>
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if(	javaTrim(FormName.loadName)=="") {
		alert("请选择[上载文件]！");
		FormName.loadName.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>