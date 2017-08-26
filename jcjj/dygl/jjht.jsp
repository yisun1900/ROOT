<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>家具合同打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ddbh=request.getParameter("ddbh");
	String khbh=cf.executeQuery("select khbh from jc_jjdd where ddbh='"+ddbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
<table width="100%">
  <tr> 
    <td colspan="2" height="74"> 
      <div align="center">家具合同打印(预订单编号：<%=ddbh%>)</div>
    </td>
  </tr>
    <tr> 
      <td colspan="2" height="95"> 
        <div align="center"> 
          <input type="button" name="Button2" value="打印预订单" onClick="f_do(selectform,'dyydd')">
        </div>
      </td>
    </tr>
  <tr> 
    <td colspan="2">
      <div align="center">
		<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button" name="Button" value="打印合同" onClick="f_do(selectform,'dyht')">
        <input type="button" name="Submit2" value="打印家具附件" onClick="f_do(selectform,'dyjjmx')">
        <input type="button" name="Submit2" value="打印型材门附件" onClick="f_do(selectform,'dyxcmmx')">
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
		FormName.action="jjdd.jsp";
	}
	else if (lx=="dyjjmx")
	{
		FormName.action="jjfj.jsp";
	}
	else if (lx=="dyxcmmx")
	{
		FormName.action="jjxcmfj.jsp";
	}
	else if (lx=="dyydd")
	{
		FormName.action="dyydd.jsp?lx=jj&ddbh=<%=ddbh%>";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
