<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>增加新的辅材报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dwbh = request.getParameter("dwbh");
%>

<body bgcolor="#FFFFFF">
<CENTER>
  <B>增加新的辅材编码</B><BR>
  <HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择辅材编码EXECEL文件</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"><b><font color="#FF0000">注意：不会删除现有的辅材编码，把新数据添加到数据库中<P>请注意不要重复导入</font></b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
			<input name="dwbh" type="hidden" value="<%=dwbh%>" >
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
	FormName.action="DisImpAddData.jsp";

	FormName.submit();
	return true;
} 
//-->
</script>