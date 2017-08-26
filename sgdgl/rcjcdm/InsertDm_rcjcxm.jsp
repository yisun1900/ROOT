<%@ page contentType="text/html;charset=GBK" %>
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
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_rcjcxm.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>日常检查类型</td>
    <td><select name="rcjclxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select rcjclxbm,rcjclxmc from dm_rcjclxbm order by rcjclxbm","");
%>
      </select>
    </td>
    <td align="right"><span class="STYLE1">*</span>日常检查大类 </td>
    <td><select name="rcjcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select rcjcdlbm,rcjcdlmc from dm_rcjcdlbm order by rcjcdlbm","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>项目编码</td> 
  <td width="32%"> 
    <input type="text" name="xmbm" value="" size="20" maxlength="4" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>项目名称</td>
  <td colspan="3"><input type="text" name="xmmc" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>检查内容</td> 
  <td colspan="3"><textarea name="jcnr" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
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
	if(	javaTrim(FormName.xmbm)=="") {
		alert("请输入[项目编码]！");
		FormName.xmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjcdlbm)=="") {
		alert("请选择[日常检查大类]！");
		FormName.rcjcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jcnr)=="") {
		alert("请输入[检查内容]！");
		FormName.jcnr.focus();
		return false;
	}
	if(	javaTrim(FormName.rcjclxbm)=="") {
		alert("请选择[日常检查类型]！");
		FormName.rcjclxbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
