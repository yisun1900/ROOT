<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String khbh=request.getParameter("khbh");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>导入主材（客户编号:<%=khbh%>）</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td width="100%" height="52"><b>请选择上载EXECEL文件</b></td>
      </tr>
      <tr align="center"> 
        <td height="2"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="hidden"  name="khbh" value="<%=khbh%>"  >
            <input type="button"  value="继续" onClick="f_onclick(loadform)">
          </p>        </td>
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

	FormName.target="";
	FormName.action="DisData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>