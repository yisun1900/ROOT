<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工作经历录入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_gzjl.jsp" name="insertform" target="_blank">
<div align="center">工作经历录入</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000FF">员工序号</font></td>
      <td width="33%"> 
        <input type="text" name="ygbh" value="<%=whereygbh%>" size="20" maxlength="8" readonly>
      </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">时间段</td>
      <td colspan="3"> 
        <input type="text" name="sjd" value="" size="50" maxlength="50" >
        <font color="#FF0000">（可用任何方式表示时间段）</font> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">工作单位何部门</td>
      <td colspan="3">
        <input type="text" name="gzdwbm" value="" size="73" maxlength="100" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">担任职务</td>
      <td width="33%">
        <input type="text" name="drzw" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="16%">证明人</td>
      <td width="34%">
        <input type="text" name="zmr" value="" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">单位电话</td>
      <td width="33%"> 
        <input type="text" name="dwdh" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="16%">&nbsp;</td>
      <td width="34%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
        <input type="button" value="修改工作经历" onClick="window.open('Rs_gzjlList.jsp?ygbh=<%=whereygbh%>')">
      </td>
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请输入[员工序号]！");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "员工序号"))) {
		return false;
	}
	if(	javaTrim(FormName.sjd)=="") {
		alert("请输入[时间段]！");
		FormName.sjd.focus();
		return false;
	}
	if(	javaTrim(FormName.gzdwbm)=="") {
		alert("请输入[工作单位何部门]！");
		FormName.gzdwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.drzw)=="") {
		alert("请输入[担任职务]！");
		FormName.drzw.focus();
		return false;
	}
	if(	javaTrim(FormName.dwdh)=="") {
		alert("请输入[单位电话]！");
		FormName.dwdh.focus();
		return false;
	}
	if(	javaTrim(FormName.zmr)=="") {
		alert("请输入[证明人]！");
		FormName.zmr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
