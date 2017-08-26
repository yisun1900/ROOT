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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">名片版本</td> 
  <td width="35%"> 
    <input type="text" name="mpbb" value="" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">&nbsp; 
    
  </td>
  <td width="35%">&nbsp; 
    
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
        <input type="button"  value="上传照片" onClick="f_do1(insertform)" name="button">
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
	if(	javaTrim(FormName.mpbb)=="") {
		alert("请输入[名片版本]！");
		FormName.mpbb.focus();
		return false;
	}
	FormName.action="SaveInsertXz_mpbb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.mpbb)=="") {
		alert("请输入[名片版本]！");
		FormName.mpbb.focus();
		return false;
	}
	FormName.action="ChooseFile.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
