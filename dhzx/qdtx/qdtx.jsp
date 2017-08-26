<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>签单提醒</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" >
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td colspan="2" height="49"> 
        <div align="center"><font size="5" face="楷体_GB2312"><b><font face="仿宋_GB2312">未签单客户提醒</font></b></font></div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" bgcolor="#FFFFFF" align="right" height="47">录入时间超过 
        <input type="text" name="lrsj" size="3" maxlength="3" value="30">
        天</td>
      <td width="50%" height="47"> 
        <input type="button"  value="查看明细" onClick="f_do(selectform,'lrsj')">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" bgcolor="#FFFFFF" align="right" height="41">分配店面超过 
        <input type="text" name="fpdm" size="3" maxlength="3" value="25">
        天</td>
      <td width="50%" height="41">
        <input type="button"  value="查看明细" onClick="f_do(selectform,'fpdm')">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="50%" bgcolor="#FFFFFF" align="right" height="42">分配设计师超过 
        <input type="text" name="fpsjs" size="3" maxlength="3" value="20">
        天</td>
      <td width="50%" height="42">
        <input type="button"  value="查看明细" onClick="f_do(selectform,'fpsjs')">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td bgcolor="#FFFFFF" align="right" height="45">交量房订金超过
        <input type="text" name="jlfdj" size="3" maxlength="3" value="5">
        天</td>
      <td height="45"><input type="button"  value="查看明细" onClick="f_do(selectform,'jlfdj')">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" bgcolor="#FFFFFF" align="right" height="45">交设计费超过 
        <input type="text" name="jsjf" size="3" maxlength="3" value="5">
        天</td>
      <td width="50%" height="45">
        <input type="button"  value="查看明细" onClick="f_do(selectform,'jsjf')">      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if (lx=="lrsj")
	{
		if(	javaTrim(FormName.lrsj)=="") {
			alert("请输入[录入时间]！");
			FormName.lrsj.focus();
			return false;
		}
		if(!(isNumber(FormName.lrsj, "录入时间"))) {
			return false;
		}

		FormName.action="LrsjCxList.jsp";
	}
	else if (lx=="fpdm")
	{
		if(	javaTrim(FormName.fpdm)=="") {
			alert("请输入[分配店面]！");
			FormName.fpdm.focus();
			return false;
		}
		if(!(isNumber(FormName.fpdm, "分配店面"))) {
			return false;
		}

		FormName.action="FpdmCxList.jsp";
	}
	else if (lx=="fpsjs")
	{
		if(	javaTrim(FormName.fpsjs)=="") {
			alert("请输入[分配设计师]！");
			FormName.fpsjs.focus();
			return false;
		}
		if(!(isNumber(FormName.fpsjs, "分配设计师"))) {
			return false;
		}

		FormName.action="FpsjsCxList.jsp";
	}
	else if (lx=="jlfdj")
	{
		if(	javaTrim(FormName.jlfdj)=="") {
			alert("请输入[交量房订金]！");
			FormName.jlfdj.focus();
			return false;
		}
		if(!(isNumber(FormName.jlfdj, "交量房订金"))) {
			return false;
		}

		FormName.action="JlfdjCxList.jsp";
	}
	else if (lx=="jsjf")
	{
		if(	javaTrim(FormName.jsjf)=="") {
			alert("请输入[交设计费]！");
			FormName.jsjf.focus();
			return false;
		}
		if(!(isNumber(FormName.jsjf, "交设计费"))) {
			return false;
		}

		FormName.action="JsjfCxList.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
