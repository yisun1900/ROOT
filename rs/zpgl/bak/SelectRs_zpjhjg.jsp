<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_zpjhjgList.jsp" name="selectform">
<div align="center">维护招聘结果</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘计划编号</td> 
  <td width="35%"> 
    <input type="text" name="zpjhbh" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘人数</td> 
  <td width="35%"> 
    <input type="text" name="zprs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>实际招聘人数</font></td> 
  <td width="35%"> 
    <input type="text" name="sjzprs" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%"><font color=red>实际招聘费用</font></td> 
  <td width="35%"> 
    <input type="text" name="sjzpfy" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划状态</td> 
  <td width="35%"> 
    <select name="jhzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="3">招聘完成</option>
    </select>
  </td>
  <td align="right" width="15%">录入人分公司</td> 
  <td width="35%"> 
     <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划开始时间 从</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">计划开始时间 到</td> 
  <td width="35%"> 
    <input type="text" name="jhkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>实际开始时间 从</font></td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"><font color=red>实际开始时间 到</font></td> 
  <td width="35%"> 
    <input type="text" name="sjkssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计划结束时间 从</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
   <td align="right" width="15%">计划结束时间 到</td> 
  <td width="35%"> 
    <input type="text" name="jhjssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>实际结束时间 从</font></td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
   <td align="right" width="15%"><font color=red>实际结束时间 到</font></td> 
  <td width="35%"> 
    <input type="text" name="sjjssj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入时间 从</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%">录入时间 到</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>结果录入时间 从</font></td> 
  <td width="35%"> 
    <input type="text" name="wclrsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
  <td align="right" width="15%"><font color=red>结果录入时间 到</font></td> 
  <td width="35%"> 
    <input type="text" name="wclrsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="wclrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%"><font color=red>结果录入人</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.zprs, "招聘人数"))) {
		return false;
	}
	if(!(isFloat(FormName.zpfy, "招聘费用"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhkssj, "计划开始时间 从"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhkssj2, "计划开始时间 到"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj, "计划结束时间 从"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjssj2, "计划结束时间 到"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间 从"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 到"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
