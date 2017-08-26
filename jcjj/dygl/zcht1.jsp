<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>主材合同打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ddbh=request.getParameter("ddbh");
	String khbh=cf.executeQuery("select khbh from jc_zcdd where ddbh='"+ddbh+"'");
	String sxhtsfysh=cf.executeQuery("select sxhtsfysh from jc_zcdd where ddbh='"+ddbh+"'");
	if (sxhtsfysh!=null && sxhtsfysh.equals("N"))//M：非手写合同；Y：已审核；N：未审核
	{
		out.println("错误！手写合同未审核，不能打印");
		return;
	}

%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
<table width="100%">
  <tr> 
    <td colspan="2" height="74"> 
      <div align="center">主材合同打印(预订单编号：<%=ddbh%>)</div>
    </td>
  </tr>
  <tr> 
    <td height="21">&nbsp;</td>
    <td height="21">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2">
      <div align="center">
		<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
		<input type="hidden" name="khbh"  value="<%=khbh%>" >
        <!--<input type="button" name="Button" value="打印合同" onClick="f_do(selectform,'dyht')">-->
        <input type="button" name="Submit2" value="打印附件" onClick="f_do(selectform,'dymx')">
      </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{

	if (lx=="dyht")
	{
		FormName.action="zcdd.jsp";
	}
	else if (lx=="dymx")
	{
		FormName.action="zcfj.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
