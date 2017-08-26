<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_kzbjblList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="cw_kzbjbl_xuhao" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">名称</td> 
  <td width="35%"> 
    <input type="text" name="cw_kzbjbl_mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">起点金额（>=）</td> 
  <td width="35%"> 
    <input type="text" name="cw_kzbjbl_qd" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">终点金额（<）</td> 
  <td width="35%"> 
    <input type="text" name="cw_kzbjbl_zd" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">扣除百分比</td> 
  <td width="35%"> 
    <input type="text" name="cw_kzbjbl_bfb" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="cw_kzbjbl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
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
	if(!(isNumber(FormName.cw_kzbjbl_xuhao, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_kzbjbl_qd, "起点金额（>=）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_kzbjbl_zd, "终点金额（<）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_kzbjbl_bfb, "扣除百分比"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
