<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String zpjhbh=cf.GB2Uni(request.getParameter("zpjhbh"));
	String yhmc=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_zpjhjg.jsp" name="insertform" target="_blank">
<div align="center"><b>招聘结果（编号：<%=zpjhbh%>）</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" value="" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">实际招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" value="" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">实际招聘开始时间</td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">实际招聘结束时间</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
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
  <td width="35%" colspan="3"> 
     <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input name="zpjhbh" type="hidden" value="<%=zpjhbh%>">
	<input type="button"  value="存盘" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.sjzprs)=="") {
		alert("请输入[实际招聘人数]！");
		FormName.sjzprs.focus();
		return false;
	}
	if(!(isNumber(FormName.sjzprs, "实际招聘人数"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzpfy)=="") {
		alert("请输入[实际招聘费用]！");
		FormName.sjzpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzpfy, "实际招聘费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("请输入[实际招聘开始时间]！");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "实际招聘开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("请输入[实际招聘结束时间]！");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "实际招聘结束时间"))) {
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注：录入被招聘人姓名职位]！");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
