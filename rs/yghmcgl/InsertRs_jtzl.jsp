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
<form method="post" action="SaveInsertRs_jtzl.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">员工序号</font></td> 
  <td width="35%"> 
    <input type="text" name="ygbh" value="<%=whereygbh%>" size="20" maxlength="8" readonly>
  </td>
  <td align="right" width="15%">亲属姓名</td> 
  <td width="35%"> 
    <input type="text" name="xm" value="" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">与本人关系</td> 
  <td width="35%"> 
    <input type="text" name="gx" value="" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">出生年份</td> 
  <td width="35%"> 
    <input type="text" name="csnf" value="" size="10" maxlength="4" ><font color=red>XXXX四位表示年份</font>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">工作单位</td> 
  <td width="35%"> 
    <input type="text" name="gzdw" value="" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">职务</td> 
  <td width="35%"> 
    <input type="text" name="zw" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">联系电话</td> 
  <td width="35%"> 
    <input type="text" name="lxdh" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
    <input type="button" value="修改家庭资料" onClick="window.open('Rs_jtzlList.jsp?ygbh=<%=whereygbh%>')">
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
	if(	javaTrim(FormName.xm)=="") {
		alert("请输入[姓名]！");
		FormName.xm.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("请输入[关系]！");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.csnf)=="") {
		alert("请输入[出生年份]！");
		FormName.csnf.focus();
		return false;
	}
	if(!(isNumber(FormName.csnf, "出生年份"))) {
		return false;
	}
	if(	javaTrim(FormName.gzdw)=="") {
		alert("请输入[工作单位]！");
		FormName.gzdw.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("请输入[职务]！");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.lxdh)=="") {
		alert("请输入[联系电话]！");
		FormName.lxdh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
