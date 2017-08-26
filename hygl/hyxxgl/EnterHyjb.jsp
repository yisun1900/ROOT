<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>开工登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] hybh=request.getParameterValues("hybh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEnterHyjb.jsp" name="insertform">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2" height="43"> 
        <div align="center">
          <p>输入新的会员级别</p>
          <p><font color="#FF3333">注意：此种操作方式适用于不需改变水质分析卡号</font></p>
        </div>
        <%
	for (int i=0;i<hybh.length ;i++ )
	{
		out.print("<input type='hidden' name='hybh' value='"+hybh[i]+"'>");
	}
%> </td>
    </tr>
    <tr> 
      <td width="43%" align="right" height="36">会员级别</td>
      <td width="57%" height="36"> 
        <select name="hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
<%
			cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
		</select>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center"> 
          <input type="button"  value="存盘" onClick="f_do(insertform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hyjb)=="") {
		alert("请选择[会员级别]！");
		FormName.hyjb.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
