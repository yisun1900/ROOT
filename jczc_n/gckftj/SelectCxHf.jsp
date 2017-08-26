<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<div align="center">
 

<form method="post" action="" name="selectform">

    <table width="37%" border="0" style="FONT-SIZE:14" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFCC">
        <td width="59%" height="25" >
          <div align="center">回访明细</div>
        </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="hftj" value="1" onClick="f_do(selectform,'zsg')">
          在施工回访统计 </td>
      </tr>
      <tr bgcolor="#FFFFCC"> 
        <td width="59%" height="25" > 
          <INPUT type="radio" name="hftj" value="2" onClick="f_do(selectform,'ts')">
          投诉回访统计 </td>
      </tr>
	</table>

</form>
</div>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{

	if(lx=="zsg"){
	FormName.action="EnterHfTj.jsp";
	}
	if(lx=="ts"){
	FormName.action="EnterTsHfTj.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

