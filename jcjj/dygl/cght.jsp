<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>橱柜合同打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ddbh=request.getParameter("ddbh");
	String khbh=cf.executeQuery("select khbh from jc_cgdd where ddbh='"+ddbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">橱柜合同打印(预订单编号：<%=ddbh%>)</div>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="95"> 
        <div align="center"> 
          <input type="button" value="打印预订单" onClick="f_do(selectform,'dyydd')">
        </div>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
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
		FormName.action="cgdd.jsp";
	}
	else if (lx=="dymx")
	{
		FormName.action="cgfj.jsp";
	}
	else if (lx=="dyydd")
	{
		FormName.action="dyydd.jsp?lx=cg&ddbh=<%=ddbh%>";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
