<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-weight: bold;
	font-size: 16px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">


<form  name="insert" method="post" action="copy.jsp"  >
<table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
<tr>
  <td height="37" colspan="15" align="center">复制月度指标</td>
</tr>
<tr>
 <td height="37" colspan="15" align="center">被复制周期数
   <select name="zqs" style="FONT-SIZE:12PX;WIDTH:152PX">
   <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select distinct zqs c1,zqs c2 from YY_SJ  order by zqs","");
%>
 </select>
   <input type="button" onClick="dos(insert)" value="开始复制">
  </td>
</tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language="javascript">
<!--
function dos(FormName)
{
	if(	javaTrim(FormName.zqs)=="") {
		alert("请输入[周期数]！");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</script>

