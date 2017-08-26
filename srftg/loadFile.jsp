<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上载文件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<CENTER>
  <form method="post" action="" name="onloadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>文件传输</b></td>
      </tr>
      <tr> 
        <td align="right" height="2" width="30%">上载文件存放目录</td>
        <td width="70%" height="2"> 
          <input type="text" name="path" size="60">
        </td>
      </tr>
      <tr> 
        <td width="30%" height="2" align="right">上载文件</td>
        <td width="70%" height="2"> 
          <input type="file" name="loadname" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="上载文件" onclick="f_onload(onloadform)">
          </p>
        </td>
      </tr>
    </table>
</form>

  <form method="post" action="" name="downloadform" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>文件传输</b></td>
      </tr>
      <tr> 
        <td width="30%" height="2" align="right">下载文件目录</td>
        <td width="70%" height="2"> 
          <input type="text" name="path2" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="下载文件" onClick="f_download(downloadform)">
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
	if(	javaTrim(FormName.path)=="") {
		alert("请选择[上载文件存放目录]！");
		FormName.path.focus();
		return false;
	}
	if(	javaTrim(FormName.loadname)=="") {
		alert("请选择[上载文件]！");
		FormName.loadname.focus();
		return false;
	}
	FormName.action="saveloadFile.jsp";
	FormName.submit();
	return true;
} 
function f_download(FormName)
{
	if(	javaTrim(FormName.path2)=="") {
		alert("请选择[下载文件目录]！");
		FormName.path.focus();
		return false;
	}

	FormName.action="viewFile.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>