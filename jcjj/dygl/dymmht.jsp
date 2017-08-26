<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>木门合同打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yddbh=request.getParameter("yddbh");
	String khbh=cf.executeQuery("select khbh from jc_mmydd where yddbh='"+yddbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">木门合同打印(预订单编号：<%=yddbh%>)</div>
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
          <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button" name="Button" value="打印合同" onClick="f_do(selectform,'dyht')">
          <input type="button" name="Submit2" value="打印附件" onClick="f_do(selectform,'dymx')">
          <input type="button" name="Button3" value="打印图片" onClick="f_do(selectform,'dytp')">
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
		FormName.action="dymmhtzb.jsp";
	}
	else if (lx=="dymx")
	{
		FormName.action="dymmhtfj.jsp";
	}
	else if (lx=="dyydd")
	{
		FormName.action="dyydd.jsp?lx=mm&ddbh=<%=yddbh%>";
	}
	else if (lx=="dytp")
	{
		FormName.action="dymmtp.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

