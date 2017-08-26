<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>
<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<CENTER><B>导入EXCEL</B><BR><HR>
<form method="post" action="readDate.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载EXCEL文件</b><br>
		</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="继续" onClick="f_onclick(loadform)">
          </p>
		  <hr>
        </td>
      </tr>
	  <tr> 
        <td colspan="2" align="left"> 
          <p>&nbsp;</p>
          <p> 
           <font color="blue" size="2">
		   <b>注意:</b>短信前缀+短信内容不能超过60个字,否则无法发送!<br>
		   <b>关于前缀与内容:</b>短信前缀为可选内容,例如:您可以输入"王先生",或者可以不输入,如果您输入的短信前缀是"王先生",短信内容是"祝您工作顺利!",系统将发送"王先生,祝您工作顺利!"
		   </font>
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