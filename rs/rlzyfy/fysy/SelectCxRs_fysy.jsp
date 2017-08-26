<%@ page contentType="text/html;charset=GBK" %>
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
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_fysyCxList.jsp" name="selectform">
<div align="center">查询条件</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">费用使用编号</td> 
  <td width="35%"> 
    <input type="text" name="fysybh" size="20" maxlength="14" >  </td>
  <td align="right" width="15%">预算编号</td> 
  <td width="35%"> 
    <input type="text" name="hzbh" size="20" maxlength="11" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    </select>  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">使用时间 从</td> 
  <td width="35%"><input type="text" name="sysj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">使用时间 到  </td>
  <td width="35%"><input type="text" name="sysj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">使用类型</td> 
  <td width="35%"> 
    <select name="sylx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"01+招聘费&02+培训费&03+福利费&04+奖励费&05+社会保险费&06+处罚费&07+其他费用","");
%>
    </select>  </td>
  <td align="right" width="15%">用途形式</td> 
  <td width="35%"> 
    <input type="text" name="ytxs" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">费用</td> 
  <td width="35%"> 
    <input type="text" name="fy" size="20" maxlength="9" >  </td>
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"><input type="text" name="lrsj" size="20" maxlength="10" ></td>
  <td align="right" width="15%">录入时间 到  </td>
  <td width="35%"><input type="text" name="lrsj2" size="20" maxlength="10" ></td>
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
	if(!(isDatetime(FormName.sysj, "使用时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.sysj2, "使用时间"))) {
		return false;
	}
	if(!(isFloat(FormName.fy, "费用"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
