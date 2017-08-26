<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入提醒</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertSq_txxxb.jsp" name="insertform"  >
<div align="center">录入提醒</div>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>提醒类型</td>
  <td width="32%"><select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="01">咨询回访</option>
    <option value="02">在施工程回访</option>
    <option value="03">投诉报修回访</option>
    <option value="04">投诉报修</option>
  </select></td>
  <td width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>开始提醒日期</td>
  <td><input type="text" name="kstxsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right"><span class="STYLE1">*</span>开始提醒时间</td>
  <td><input type="text" name="kstxsj1" size="6" maxlength="5"  value="" > 
    格式 HH：MM(小时：分钟)</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>提醒次数</td>
  <td><input type="text" name="txcs" value="1" size="10" maxlength="8"></td>
  <td align="right"><span class="STYLE1">*</span>两次提醒间隔</td>
  <td><input type="text" name="txjg" value="0" size="10" maxlength="8">
  小时</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>提醒方式</td> 
  <td colspan="3"> 
    <input type="radio" name="txfs"  value="1">系统
    <input type="radio" name="txfs"  value="2">电话
    <input type="radio" name="txfs"  value="3">传真
    <input type="radio" name="txfs"  value="4">短信
    <input type="radio" name="txfs"  value="9">全部  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>提醒关键字</td> 
  <td colspan="3"> 
    <input type="text" name="txgjz" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>提醒内容</td>
  <td colspan="3"><textarea name="txnr" cols="72" rows="7"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh" value="<%=ygbh[i]%>" >
		<%
	}
%>
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
	if(	!radioChecked(FormName.txfs)) {
		alert("请选择[提醒方式]！");
		FormName.txfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.txlx)=="") {
		alert("请选择[提醒类型]！");
		FormName.txlx.focus();
		return false;
	}
	if(	javaTrim(FormName.txgjz)=="") {
		alert("请输入[提醒关键字]！");
		FormName.txgjz.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("请输入[提醒内容]！");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.kstxsj)=="") {
		alert("请输入[开始提醒日期]！");
		FormName.kstxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kstxsj, "开始提醒日期"))) {
		return false;
	}
	if(	javaTrim(FormName.kstxsj1)=="") {
		alert("请输入[开始提醒时间]！");
		FormName.kstxsj1.focus();
		return false;
	}

	if(	javaTrim(FormName.txcs)=="") {
		alert("请选择[提醒次数]！");
		FormName.txcs.focus();
		return false;
	}
	if(!(isNumber(FormName.txcs, "提醒次数"))) {
		return false;
	}
	if(	javaTrim(FormName.txjg)=="") {
		alert("请选择[两次提醒间隔]！");
		FormName.txjg.focus();
		return false;
	}
	if(!(isNumber(FormName.txjg, "两次提醒间隔"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
