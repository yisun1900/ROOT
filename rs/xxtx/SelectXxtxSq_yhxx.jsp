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
	String yhmc=(String)session.getAttribute("yhmc");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Sq_yhxxXxtxList.jsp" name="selectform">
<div align="center">信息提醒</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%" align="right" bgcolor="#FFFFCC">分公司</td>
      <td width="31%"><%
	if ( yhjs.equals("A0") ||yhjs.equals("A1")  )
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      <td width="17%" align="right">所属部门</td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if ( yhjs.equals("A0") ||yhjs.equals("A1")  )
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' order by dwbh","");
	}
	else
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','F1','F2') and  ssfgs='"+ssfgs+"' and  cxbz='N' order by dwbh","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">员工序号</td>
      <td width="31%"> 
        <input type="text" name="ygbh" size="20" maxlength="8" >
      </td>
      <td align="right" width="17%">工号</td>
      <td width="33%"> 
        <input type="text" name="bianhao" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">员工名称</td>
      <td width="31%"> 
        <input type="text" name="yhmc" size="20" maxlength="50" value="" >
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">身份证号</td>
      <td width="31%"> 
        <input type="text" name="sfzh" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">行政职务</td>
      <td width="33%"> 
        <select name="xzzwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="19%">提醒年</td>
      <td width="31%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectToken(out,"1995+1995年&1996+1996年&1997+1997年&1998+1998年&1999+1999年&2000+2000年&2001+2001年&2002+2002年&2003+2003年&2004+2004年&2005+2005年&2006+2006年&2007+2007年&2008+2008年&2009+2009年&2010+2010年&2011+2011年&2012+2012年&2013+2013年&2014+2014年&2015+2015年",cf.today("YYYY"));
%> 
        </select>
      </td>
      <td align="right" width="17%">提醒月份</td>
      <td width="33%"> 
        <select name="yue" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"01+一月&02+二月&03+三月&04+四月&05+五月&06+六月&07+七月&08+八月&09+九月&10+十月&11+十一月&12+十二月",cf.today("MM"));
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">显示风格</td>
      <td width="31%">
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	javaTrim(FormName.yue)=="") {
		alert("请输入[月份]！");
		FormName.yue.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
