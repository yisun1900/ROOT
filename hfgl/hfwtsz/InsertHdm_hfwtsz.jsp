<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="InsertHdm_hfwtsz1.jsp" name="insertform" >
<div align="center">回访问题设置</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="40%" height="71" align="right">选择回访类型</td> 
  <td width="60%"> 
    <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl in('2','3') order by hflxbm","");
%>
    </select>  </td>
  </tr>


    <tr align="center"> 
      <td colspan="2"> 
       
	    <input type="button"  value="继续" onClick="f_do(insertform)">      </tr>
</table>


</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("请选择[回访类型]！");
		FormName.hflxbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
