<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] tsjlh = request.getParameterValues("tsjlh");
String chooseitem =cf.GB2Uni(cf.arrayToInSQL(tsjlh,"tsjlh"));
//out.print(chooseitem);
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="saveplfk.jsp" name="insertform" target="_blank">
<div align="center">请选择支付方式及日期</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#FF0033">*</font>支付方式</td> 
  <td width="35%"> 
   <input type="radio" name="zffs" value="1" checked>
现金
  <input type="radio" name="zffs" value="2" >
转账
</td>
  <td align="right" width="15%"><font color="#FF0033">*</font>支付日期</td> 
  <td width="35%"> 
    <input type="text" name="zfsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)"> 
	 <input type="hidden" name="tj" value="<%=chooseitem%>"> </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zfsj)=="") {
		alert("请输入[支付日期]！");
		FormName.zfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zfsj, "支付时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>