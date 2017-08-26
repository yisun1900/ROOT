<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_jyjl.jsp" name="insertform" target="_blank">
<div align="center">录入教育经历</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000FF">员工序号</font></td>
      <td width="35%"> 
        <input type="text" name="ygbh" value="<%=whereygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">开始时间</td>
      <td width="35%"> 
        <input type="text" name="kssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">截至时间</td>
      <td width="35%">
        <input type="text" name="jzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">教育机构</td>
      <td colspan="3"> 
        <input type="text" name="jyjg" value="" size="73" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">教育说明</td>
      <td width="35%" colspan="3"> 
        <TEXTAREA NAME="jysm" ROWS="4" COLS="71"></TEXTAREA>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="button" value="修改教育经历" onClick="window.open('Rs_jyjlList.jsp?ygbh=<%=whereygbh%>')">
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.kssj)=="") {
		alert("请输入[开始时间]！");
		FormName.kssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kssj, "开始时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("请输入[截至时间]！");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "截至时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jyjg)=="") {
		alert("请输入[教育机构]！");
		FormName.jyjg.focus();
		return false;
	}
	if(	javaTrim(FormName.jysm)=="") {
		alert("请输入[教育说明]！");
		FormName.jysm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
