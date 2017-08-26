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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
	String yhmc=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertYy_rqsd.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>周期数</td> 
  <td width="32%"> 
    <input type="text" name="zqs" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>上周日期开始</td>
  <td><input type="text" name="yy_rqsd_szs" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>上周日期结束</td>
  <td><input type="text" name="yy_rqsd_sze" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>本周日期开始</td> 
  <td width="32%"><input type="text" name="yy_rqsd_bzs" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>本周日期结束</td> 
  <td width="32%"><input type="text" name="yy_rqsd_bze" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zqs)=="") {
		alert("请输入[周期数]！");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_szs)=="") {
		alert("请输入[上周日期开始]！");
		FormName.yy_rqsd_szs.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_szs, "上周日期开始"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_sze)=="") {
		alert("请输入[上周日期结束]！");
		FormName.yy_rqsd_sze.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_sze, "上周日期结束"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_bzs)=="") {
		alert("请输入[本周日期开始]！");
		FormName.yy_rqsd_bzs.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bzs, "本周日期开始"))) {
		return false;
	}
	if(	javaTrim(FormName.yy_rqsd_bze)=="") {
		alert("请输入[本周日期结束]！");
		FormName.yy_rqsd_bze.focus();
		return false;
	}
	if(!(isDatetime(FormName.yy_rqsd_bze, "本周日期结束"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
