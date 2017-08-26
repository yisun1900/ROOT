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
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_fyshCxList.jsp" name="selectform">
<div align="center">费用预算报表查询条件</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申请分公司</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:178PX">
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
  <td align="right" width="15%">申请时间</td> 
  <td width="35%">        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
  <option value=""></option>
          <%
	cf.selectToken(out,"1995+1995年&1996+1996年&1997+1997年&1998+1998年&1999+1999年&2000+2000年&2001+2001年&2002+2002年&2003+2003年&2004+2004年&2005+2005年&2006+2006年&2007+2007年&2008+2008年&2009+2009年&2010+2010年&2011+2011年&2012+2012年&2013+2013年&2014+2014年&2015+2015年",cf.today("YYYY"));
%> 
  </select>
  年
  <select name="yue" id="yue" style="FONT-SIZE:12PX;WIDTH:80PX" >
  <option value=""></option>
          <%
	cf.selectToken(out,"01+01月&02+02月&03+03月&04+04月&05+05月&06+06月&07+07月&08+08月&09+09月&10+10月&11+11月&12+12月",cf.today("MM"));
%> 
  </select>
  月</td>	
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申请状态</td> 
  <td width="35%"> 
     <select name="yshz" id="yshz" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
		<%
		cf.selectToken(out,"01+等待审核&02+等待审批&03+审批完成&04+修改&05+取消申请","");
		%> 	  
	  </select>
  </td>  
  <td align="right" width="15%">汇总编号</td> 
  <td width="35%"> 
    <input type="text" name="hzbh" size="24" maxlength="11" >  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核结论</td> 
  <td width="35%"> 
         <select name="shjl" id="shjl" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
		<%
		cf.selectToken(out,"0+审核取消&1+审核通过&2+返回修改","");
		%> 	  
	  </select>
  </td>
  <td align="right" width="15%">审批结论</td> 
  <td width="35%"> 
         <select name="spjl" id="spjl" style="FONT-SIZE:12PX;WIDTH:178PX">
      <option value=""></option>
		<%
		cf.selectToken(out,"0+审核取消&1+审核通过&2+返回审核","");
		%> 	  
	  </select>
  </td>	
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核人</td> 
  <td width="35%"> 
    <input name="shr" type="text" id="shr" size="24" maxlength="20" >  </td>
  <td align="right" width="15%">审批人</td> 
  <td width="35%"> 
    <input name="spr" type="text" id="spr" size="24" maxlength="20" >  </td>	
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审核时间 从</td> 
  <td width="35%"><input name="shsj" type="text" id="shsj" onDblClick="JSCalendar(this)" size="24" maxlength="10" >
  <BR></td>
  <td align="right" width="15%">审核时间 到 </td>
  <td width="35%"><input name="shsj2" type="text" id="shsj2" onDblClick="JSCalendar(this)" size="24" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审批时间 从</td> 
  <td width="35%"><input name="spsj" type="text" id="spsj" onDblClick="JSCalendar(this)" size="24" maxlength="10" >
  <BR></td>
  <td align="right" width="15%">审批时间 到 </td>
  <td width="35%"><input name="spsj2" type="text" id="spsj2" onDblClick="JSCalendar(this)" size="24" maxlength="10"></td>
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
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.shsj2, "审核时间"))) {
		return false;
	}

	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.spsj2, "审批时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
