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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_sgdyzcdbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">严重程度编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="yzcdbm" value="" size="20" maxlength="1" >
  </td>
  <td width="15%"> 
    <div align="right">严重程度名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ydcdmc" value="" size="20" maxlength="50" >
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
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yzcdbm)=="") {
		alert("请输入[严重程度编码]！");
		FormName.yzcdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ydcdmc)=="") {
		alert("请输入[严重程度名称]！");
		FormName.ydcdmc.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
