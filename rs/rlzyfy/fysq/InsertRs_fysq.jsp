<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_fysq.jsp" name="insertform" target="_blank">
<div align="center">人事费用预算申请</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">申请分公司</td>
    <td width="35%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','F0') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('A0','F0') and cxbz='N' order by dwlx,dwbh","");
	}
%>
    </select>
    </td>
    <td align="right" width="15%">申请时间</td>
    <td width="35%"><input type="text" name="sqsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">申请类型</td>
    <td width="35%"><select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="01">招聘费</option>
      <option value="02">培训费</option>
      <option value="03">福利费</option>
      <option value="04">奖励费</option>
      <option value="05">社会保险费</option>
      <option value="06">处罚费</option>
      <option value="07">其他费用</option>
    </select>
    </td>
    <td align="right" width="15%">用途形式</td>
    <td width="35%"><input type="text" name="ytxs" value="" size="20" maxlength="100" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">费用</td>
    <td width="35%"><input type="text" name="fy" value="" size="20" maxlength="9" >
    </td>
	<td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
	  <td align="right" width="15%"><font color="#0000FF">录入人</font></td> 
	  <td width="35%"> 
		<input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
	  </td>
	  <td align="right" width="15%"><font color="#0000FF">录入时间</font></td> 
	  <td width="35%"> 
		<input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
	  </td> 
  </tr>  
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">备注</td>
  <td colspan="3"> 
	<textarea name="bz" cols="69" rows="3"></textarea>  </td>
  </tr>

  <tr align="center">
    <td colspan="4"><input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
        <input type="reset"  value="重输" name="reset">
    </td>
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
	if(	javaTrim(FormName.fgs)=="") {
		alert("请输入[申请分公司]！");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.sqsj)=="") {
		alert("请输入[申请时间]！");
		FormName.sqsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqsj, "申请时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xqlx)=="") {
		alert("请选择[申请类型]！");
		FormName.xqlx.focus();
		return false;
	}
	if(	javaTrim(FormName.ytxs)=="") {
		alert("请输入[用途形式]！");
		FormName.ytxs.focus();
		return false;
	}
	if(	javaTrim(FormName.fy)=="") {
		alert("请输入[费用]！");
		FormName.fy.focus();
		return false;
	}
	if(!(isFloat(FormName.fy, "费用"))) {
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
	FormName.button.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
