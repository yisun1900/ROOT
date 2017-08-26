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
<form method="post" action="Cw_zxjlblList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">序号</td> 
      <td width="32%"> 
        <input type="text" name="cw_zxjlbl_xuhao" size="20" maxlength="8" >
  </td>
      <td align="right" width="19%">名称</td> 
      <td width="31%"> 
        <input type="text" name="cw_zxjlbl_mc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">起点百分比（>=）</td> 
      <td width="32%"> 
        <input type="text" name="cw_zxjlbl_qd" size="20" maxlength="17" >
  </td>
      <td align="right" width="19%">终点百分比（<）</td> 
      <td width="31%"> 
        <input type="text" name="cw_zxjlbl_zd" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">奖励百分比</td> 
      <td width="32%"> 
        <input type="text" name="cw_zxjlbl_bfb" size="20" maxlength="17" >
  </td>
      <td align="right" width="19%">分公司</td> 
      <td width="31%"> 
        <select name="cw_zxjlbl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
	if(!(isNumber(FormName.cw_zxjlbl_xuhao, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zxjlbl_qd, "起点百分比（>=）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zxjlbl_zd, "终点百分比（<）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zxjlbl_bfb, "奖励百分比"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
