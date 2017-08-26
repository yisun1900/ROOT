<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>修改－其它收款--选择客户类型 </p>
    <table width="33%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC" align="center"> 
        <td width="59%" height="38" > 
          <INPUT type="radio" name="zt" value="1" onclick="f_do(selectform)">
          签单客户 </td>
      </tr>
      <tr bgcolor="#FFFFCC" align="center"> 
        <td width="59%" height="35" > 
          <INPUT type="radio" name="zt" value="2" onclick="f_do(selectform)">
          非签单客户 </td>
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
	FormName.action="SelectCw_khfkjl1.jsp";

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

