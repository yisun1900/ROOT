<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String yhmc=(String)session.getAttribute("yhmc");
	String[] ddbh=request.getParameterValues("ddbh");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">设置不结算原因
</div>
<form method="post" action="" name="editform" >
<table width="100%" border="0" cellpadding="2" cellspacing="2" bgcolor="#999999" style="FONT-SIZE:12">
  
  <tr bgcolor="#FFFFFF">
    <td width="21%" align="right"><font color="#CC0000">*</font><font color="#0000FF">不结算设置人</font></td>
    <td width="29%"><input type="text" name="bjsszr" value="<%=yhmc%>" size="20" maxlength="10" readonly></td>
    <td width="21%" align="right"><font color="#CC0000">*</font><font color="#0000FF">不结算设置时间</font></td>
    <td width="29%"><input type="text" name="bjsszsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="21%" align="right"><font color="#CC0000">*</font>不结算原因</td>
    <td colspan="3">
		<select name="bjsyy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
			<option value=""></option>
			<option value="未出货不结算">未出货不结算</option>
			<option value="订单已结算">订单已结算</option>
			<option value="厂家无单据不结算">厂家无单据不结算</option>
			<option value="厂家扣款不结算">厂家扣款不结算</option>
		</select>
	</td>
  </tr>
  <tr>
    <td height="2" colspan="4" align="center"> 
	<%
	for (int i=0;i<ddbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ddbh" value="<%=ddbh[i]%>">
		<%
	}
	%>
	
        <input name="button" type="button" onClick="f_plxg(editform)"  value="设置"></td>
  </tr>
</table>
</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_plxg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjsyy)=="") {
		alert("请输入[不结算原因]！");
		FormName.bjsyy.focus();
		return false;
	}
	if(	javaTrim(FormName.bjsszr)=="") {
		alert("请输入[不结算设置人]！");
		FormName.bjsszr.focus();
		return false;
	}
	if(	javaTrim(FormName.bjsszsj)=="") {
		alert("请输入[不结算设置时间]！");
		FormName.bjsszsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.bjsszsj, "不结算设置时间"))) {
		return false;
	}

	FormName.action="SaveSzBjs.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>



