<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>发送短信——测试</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
 

<div align="center">
<form method="post" action="setMess.jsp" name="insertform" target="_blank">
  <table width="37%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" >
          <div align="center">发送短信——测试</div>
        </td>
      </tr>


      <tr bgcolor="#FFFFCC" align="center"> 
        <td width="59%" height="25" >选择电话 
          <input type="text" name="dh" size="20" value="13601167422">
        </td>
      </tr>
      <tr bgcolor="#FFFFCC" align="center"> 
        <td width="59%" height="49" > 
          <input type="button" value="发送短信" onClick="f_do(insertform)" name="button">
        </td>
      </tr>
    </table>
</form>
  
  </div>


</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dh)=="") {
		alert("请输入[接受电话]！");
		FormName.dh.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

