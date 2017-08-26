<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJdm_cpjjhs.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">成品家具材质</td>
      <td width="27%"> 
        <select name="cpjjczbm" style="FONT-SIZE:12PX;WIDTH:152PX" onchange="getItemValue(cpjjczbm,cpjjhsbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjczbm,cpjjcz from jdm_cpjjcz order by cpjjczbm","");
%> 
        </select>
      </td>
      <td align="right" width="22%">&nbsp; </td>
      <td width="28%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="23%">成品家具花色编码（<font color="#CC0000"><b>4位</b></font>）</td>
      <td width="27%"> 
        <input type="text" name="cpjjhsbm" value="" size="20" maxlength="4" >
      </td>
      <td align="right" width="22%">成品家具花色</td>
      <td width="28%"> 
        <input type="text" name="cpjjhs" value="" size="20" maxlength="50" >
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
	if(	javaTrim(FormName.cpjjczbm)=="") {
		alert("请选择[成品家具材质]！");
		FormName.cpjjczbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhsbm)=="") {
		alert("请输入[成品家具花色编码]！");
		FormName.cpjjhsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjhs)=="") {
		alert("请输入[成品家具花色]！");
		FormName.cpjjhs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
