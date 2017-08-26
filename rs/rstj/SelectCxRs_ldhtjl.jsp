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
<form method="post" action="Rs_ldhtjlCxList.jsp" name="selectform">
<div align="center">合同台账</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
  <td width="35%"> 
  <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
  <option value=""></option>
          <%	cf.selectToken(out,"1995+1995年&1996+1996年&1997+1997年&1998+1998年&1999+1999年&2000+2000年&2001+2001年&2002+2002年&2003+2003年&2004+2004年&2005+2005年&2006+2006年&2007+2007年&2008+2008年&2009+2009年&2010+2010年&2011+2011年&2012+2012年&2013+2013年&2014+2014年&2015+2015年",cf.today("YYYY"));
%> 
  </select>
  年
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
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[分公司]！");
		FormName.fgs.focus();
		return false;
	}	
	if(	javaTrim(FormName.nian)=="") {
		alert("请选择[年]！");
		FormName.nian.focus();
		return false;
	}	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
