<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppxx.jsp" name="insertform" target="_blank">
<div align="center">请录入子品牌信息</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌类别</td>
  <td>
  <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX"  onChange="changePplb(insertform)">
    <option value=""></option>
    <option value="1">主材</option>
    <option value="2">辅材</option>
  </select></td>
  <td width="18%" rowspan="7" align="right"><font color="#FF0000">*</font>所属分公司</td>
  <td width="32%" rowspan="7">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="13" multiple>
    <%
	cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","");
%>
  </select>
   </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>材料小类</td>
  <td>
  <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX" onChange=";insertform.ppmc.value=insertform.scsmc.value+this.value">
    <option value=""></option>
    <%
	out.print("<optgroup label=\"主材类\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='1'  order by clxlmc","");
	out.print("<optgroup label=\"辅材类\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='2'  order by clxlmc","");
	out.print("<optgroup label=\"通用类\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='3'  order by clxlmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>品牌</td> 
  <td width="32%">
  
  <select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="insertform.ppmc.value=this.value+insertform.clxl.value">
    <option value=""></option>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌</td>
  <td><input type="text" name="ppmc" value="" size="20" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">子品牌负责人</td>
  <td><input name="ppfzr" type="text" id="ppfzr" value="" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">财务代码</td>
  <td><input type="text" name="cwdm" size="20" maxlength="20" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">每日安装户数限制</td> 
  <td width="32%"><input type="text" name="mrazhs" value="" size="20" maxlength="8" ></td>
  </tr>
<tr bgcolor="#CCCCFF">
  <td align="right"><font color="#FF0000">*</font>是否有优惠</td>
  <td><input type="radio" name="sfyyh" value="N">
    否
    <input type="radio" name="sfyyh" value="Y">
    是 </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">优惠开始时间</td>
  <td><input type="text" name="yhkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">优惠截至时间</td>
  <td><input type="text" name="yhjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#CCCCFF">
  <td align="right">优惠内容</td>
  <td colspan="3"><textarea name="yhnr" cols="70" rows="3"></textarea>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
      <textarea name="bz" cols="71" rows="2"></textarea>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//启用AJAX
%>

function changePplb(FormName) 
{
	FormName.scsmc.length=1;

	if (FormName.pplb.value=="")
	{
		return;
	}


	var sql;
	sql="select scsmc from jxc_scsxx where scslb in ('3','"+FormName.pplb.value+"') order by scsmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToItem2(insertform.scsmc,ajaxRetStr);
}

function f_do(FormName)//参数FormName:Form的名称
{

	if(	javaTrim(FormName.pplb)=="") {
		alert("请选择[子品牌类别]！");
		FormName.pplb.focus();
		return false;
	}

	if(	javaTrim(FormName.clxl)=="") {
		alert("请输入[材料小类]！");
		FormName.clxl.focus();
		return false;
	}


	if(	javaTrim(FormName.scsmc)=="") {
		alert("请输入[品牌]！");
		FormName.scsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(!(isNumber(FormName.mrazhs, "每日安装户数限制"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("请输入[优惠开始时间]！");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "优惠开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("请输入[优惠截至时间]！");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "优惠截至时间"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[优惠开始时间]不能大于[优惠截至时间]！");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
