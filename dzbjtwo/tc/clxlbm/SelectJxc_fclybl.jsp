<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">辅材领用比例－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">分公司</td> 
  <td width="32%"> 
    <select name="jxc_fclybl_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in('F0') order by dwbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">材料小类</td> 
  <td width="32%"><select name="jxc_fclybl_clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by cldlmc,clxlmc","");
%>
  </select></td>
  <td align="right" width="18%">材料小类</td> 
  <td width="32%"><input type="text" name="jxc_fclybl_clxlmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">标准领用比例 从</td>
  <td><input type="text" name="jxc_fclybl_bzlybl" size="14" maxlength="9" >
    百分比</td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_fclybl_bzlybl2" size="14" maxlength="9" >
    百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">领用比例下限 从</td>
  <td><input type="text" name="jxc_fclybl_lyblxx" size="14" maxlength="9" >
    百分比</td>
  <td align="right">到</td>
  <td><input type="text" name="jxc_fclybl_lyblxx2" size="14" maxlength="9" >
    百分比</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">领用比例上限 从</td> 
  <td width="32%"><input type="text" name="jxc_fclybl_lyblsx" size="14" maxlength="9" >
    百分比</td>
  <td align="right" width="18%">到</td> 
  <td width="32%"><input type="text" name="jxc_fclybl_lyblsx2" size="14" maxlength="9" >
    百分比 </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input name="button" type="button" onClick="f_dc(selectform)"  value="导出">
    <input type="reset"  value="重输">  </td>
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
	if(!(isNumber(FormName.jxc_fclybl_clxlbm, "材料小类编码"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_bzlybl, "标准领用比例"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_bzlybl2, "标准领用比例"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblxx, "领用比例下限"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblxx2, "领用比例下限"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblsx, "领用比例上限"))) {
		return false;
	}
	if(!(isFloat(FormName.jxc_fclybl_lyblsx2, "领用比例上限"))) {
		return false;
	}

	FormName.target="";
	FormName.action="Jxc_fclyblList.jsp";
	FormName.submit();
	return true;
}
function f_dc(FormName)//参数FormName:Form的名称
{

	FormName.target="_blank";
	FormName.action="Jxc_fclyblExpList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
