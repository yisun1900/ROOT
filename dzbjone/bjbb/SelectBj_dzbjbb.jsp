<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Bj_dzbjbbList.jsp" name="selectform">
<div align="center">维护报价版本</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">地区编码</td> 
  <td width="33%"> 
    <select name="bj_dzbjbb_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
    </select>  </td>
  <td align="right" width="17%">报价版本号</td> 
  <td width="33%"> 
    <input type="text" name="bj_dzbjbb_bjbbh" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">启用时间 从</td> 
  <td width="33%"><input type="text" name="bj_dzbjbb_qysj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="17%">到</td> 
  <td width="33%"><input type="text" name="bj_dzbjbb_qysj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">是否在用版本</td> 
  <td colspan="3">
	<INPUT type="radio" name="sfzybb" value="1">未启用
	<INPUT type="radio" name="sfzybb" value="2">当前版
	<INPUT type="radio" name="sfzybb" value="3">可用版
	<INPUT type="radio" name="sfzybb" value="4">已停用
  </td>
  </tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isDatetime(FormName.bj_dzbjbb_qysj, "启用时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.bj_dzbjbb_qysj2, "启用时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
