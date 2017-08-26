<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
	String yhzbh=cf.GB2Uni(request.getParameter("yhzbh"));
%>
<form method="post" action="SaveInsertJdsq.jsp" name="insertform" target="_blank">
<div align="center">交底确认授权</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="14%" valign="top">用户组</td> 
      <td width="32%" valign="top"> 
        <select name="yhzbh" style="FONT-SIZE:12PX;WIDTH:230PX">
          <%
	cf.selectItem(out,"select yhzbh,yhzmc  from sq_yhz where yhzbh='"+yhzbh+"'",yhzbh);
	%> 
        </select>
      </td>    
      <td align="right" width="13%">确认类型</td> 
      <td width="41%"> 
        <select name="jdqrlx" style="FONT-SIZE:12PX;WIDTH:230PX" size="12" multiple>
          <option value=""></option>
          <%
	cf.mutilSelectItem(out,"select jdqrlx,jdqrlxmc from dm_jdqrlx order by jdqrlx","select jdqrlx from crm_jdqrqx where yhzbh='"+yhzbh+"'");
	%> 
        </select>
      </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
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
	if(	!selectChecked(FormName.jdqrlx)) {
		alert("请输入[确认类型]！");
		FormName.jdqrlx.focus();
		return false;
	}

	if(	javaTrim(FormName.yhzbh)=="") {
		alert("请选择[用户组]！");
		FormName.yhzbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
