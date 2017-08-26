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
<form method="post" action="Jxc_ppxxListfzr.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="red">新子品牌负责人</font></td> 
  <td width="35%"><input type="text" name="ppfzr" size="20" >（用户登陆名）</td>
  <td align="right" width="15%">原子品牌负责人</td> 
  <td width="35%"><input type="text" name="yppfzr" size="20" >（用户登陆名）</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">品牌名称</td> 
  <td width="35%"><select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	out.print("<optgroup label=\"主材品牌\"> </optgroup>");
	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='1' order by scsmc","");
		out.print("<optgroup label=\"辅材品牌\"> </optgroup>");

	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='2' order by scsmc","");
		out.print("<optgroup label=\"通用品牌\"> </optgroup>");

	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='3' order by scsmc","");

%>
  </select></td>
  <td align="right" width="15%">材料小类</td> 
  <td width="35%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
	<%
	out.print("<optgroup label=\"主材类\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='1'  order by clxlmc","");
	out.print("<optgroup label=\"辅材类\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='2'  order by clxlmc","");
	out.print("<optgroup label=\"通用类\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='3'  order by clxlmc","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">子品牌编码</td> 
  <td width="35%"><input type="text" name="ppbm" size="20" maxlength="8" ></td>
  <td align="right" width="15%">&nbsp;<!-- 子品牌类别 --></td> 
  <td width="35%">&nbsp;<!-- <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">木门</option>
    <option value="2">橱柜</option>
    <option value="3">家具</option>
    <option value="4">主材</option>
    <option value="5" >辅材</option>
  </select> --></td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="批量维护" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
说明：[新子品牌负责人]输入您要替换的负责人登录名。<br>
例如：我想将原来aaa负责的子品牌全部转到ddd的名下负责，录入方法如下：<br>
[新子品牌负责人]输入：ddd&nbsp;&nbsp;[原子品牌负责人]输入：aaa<br>
[原子品牌负责人]只是过滤条件，跟[品牌名称]、[子品牌类别]等一样都是条件，可以选择性的输入，[新子品牌负责人]必须输入！<br>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.ppbm, "子品牌编码"))) {
		return false;
	}
	if(	javaTrim(FormName.ppfzr)=="") {
		alert("请输入[新子品牌负责人]！");
		FormName.ppfzr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
