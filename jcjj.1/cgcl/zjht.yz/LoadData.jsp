<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入橱柜明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ddbh = request.getParameter("ddbh");
%>
<body bgcolor="#FFFFFF">
<CENTER><B>导入橱柜明细</B><BR><HR>
<form method="post" action="SaveLoadData.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
			<input type="hidden" name="ddbh" value="<%=ddbh%>">
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