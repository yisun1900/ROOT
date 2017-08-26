<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE6 {color: #0000CC}
-->
</style>
</head>
<%
String[] khbh=request.getParameterValues("khbh");
%>

<body bgcolor="#FFFFFF">
<div align="center">
  <CENTER>
    <strong>初始化结算进度</strong>
  </CENTER>
</div>

<form method="post" action="SavePlszJsjd.jsp" name="insertform"  >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="47%"><font color="#FF0000">*</font>施工队是否结算</td> 
  <td width="53%"><select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd order by gdjsjd","");
%>
  </select></td>
  </tr>
    <tr align="center"> 
      <td colspan="2"> 
<%
	for (int i=0;i<khbh.length ;i++ )
	{
		%>
			<input type="hidden" name="khbh" value='<%=khbh[i]%>' >
		<%
	}
%>
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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

	if(	javaTrim(FormName.gdjsjd)=="") {
		alert("请选择[施工队是否结算]！");
		FormName.gdjsjd.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
