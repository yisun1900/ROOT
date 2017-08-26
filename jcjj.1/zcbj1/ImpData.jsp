<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>替换全部主材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm = request.getParameter("dqbm");
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <B>替换全部主材报价</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择主材报价EXECEL文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">注意：将删除现有的所有主材报价，用新的替换</font></b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
			<input name="dqbm" type="hidden" value="<%=dqbm%>" >
          <input type="button"  value="继续" onClick="f_onclick(loadform)">
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
	FormName.action="DisImpData.jsp";

	FormName.submit();
	return true;
} 
//-->
</script>