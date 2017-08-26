<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>youboli</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<CENTER>
  <form method="post" action="" name="onloadform" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center">&nbsp;</td>
      </tr>
      <tr> 
        <td align="right" height="2" width="30%">&nbsp;</td>
        <td width="70%" height="2"> 
          <input type="text" name="aaa" size="60" value="\u网3\王\u6E38u738B4u往5">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="继续" onclick="f_onload(onloadform)">
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
function f_onload(FormName)
{
	if(	javaTrim(FormName.aaa)=="") {
		alert("请选择[aaa]！");
		FormName.aaa.focus();
		return false;
	}
	FormName.action="DcfwFyt.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>