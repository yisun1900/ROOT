<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Hd_scdcwtList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">问题编号</td>
      <td width="35%"> <input type="text" name="wtbh" size="20" maxlength="20" > 
      </td>
      <td align="right" width="15%">调查期数</td>
      <td width="35%"> <input type="text" name="dcqs" size="20" maxlength="100" > 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">问题名称</td>
      <td width="35%"> <input type="text" name="wtmc" size="20" maxlength="100" > 
      </td>
      <td align="right" width="15%">是否可多选</td>
      <td width="35%"> 
        <%
	cf.radioToken(out, "sfkdx","Y+可多选&N+单选","");
%>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">问题是否过期</td>
      <td width="35%"> 
        <%
	cf.radioToken(out, "wtsfgq","Y+过期&N+未过期","");
%>
      </td>
      <td align="right" width="15%">问题分类</td>
      <td width="35%"> <input type="text" name="wtfl" size="20" maxlength="1" > 
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> <input type="button"  value="查询" onClick="f_do(selectform)"> 
        <input type="reset"  value="重输"> </td>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
