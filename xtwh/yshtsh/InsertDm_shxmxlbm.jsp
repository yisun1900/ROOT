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

<form method="post" action="SaveInsertDm_shxmxlbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">审核项目大类</div>
              </td>
              <td width="31%"> 
                <select name="shxmdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select shxmdlbm,shxmdlmc from dm_ysshxmdlbm order by shxmdlbm","");
%> 
                </select>
              </td>
              <td width="20%"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">审核项目小类编码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="shxmxlbm" value="" size="20" maxlength="2" >
              </td>
              <td width="20%"> 
                <div align="right">审核项目小类名称</div>
              </td>
              <td width="30%"> 
                <input type="text" name="shxmxlmc" value="" size="20" maxlength="50" >
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
	if(	javaTrim(FormName.shxmxlbm)=="") {
		alert("请输入[审核项目小类编码]！");
		FormName.shxmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmxlmc)=="") {
		alert("请输入[审核项目小类名称]！");
		FormName.shxmxlmc.focus();
		return false;
	}
	if(	javaTrim(FormName.shxmdlbm)=="") {
		alert("请选择[审核项目大类]！");
		FormName.shxmdlbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
