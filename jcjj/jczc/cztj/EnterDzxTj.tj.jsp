<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <div align="center">大小单统计 </div>
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td align="right" width="19%" height="2">分公司</td>
      <td width="31%" height="2"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>
      </td>
      <td width="17%" height="2" align="right">签约店面</td>
      <td width="33%" height="2"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="19%" height="2">签约时间 从</td>
      <td width="31%" height="2"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.firstDay()%>">
      </td>
      <td width="17%" height="2" align="right">到</td>
      <td width="33%" height="2"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="19%" height="2">签约额范围 从</td>
      <td width="31%" height="2"> 
        <input type="text" name="qye" size="17" maxlength="10" value="">
        元 </td>
      <td width="17%" height="2" align="right">到</td>
      <td width="33%" height="2"> 
        <input type="text" name="qye2" size="17" maxlength="10" value="">
        元</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF">所属热点地区<BR>
        <b>（可多选）</b></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple >
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right" bgcolor="#E8E8FF">所属环线位置<BR>
        <b>（可多选）</b></td>
      <td width="33%" bgcolor="#E8E8FF"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple >
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="19%" align="right" bgcolor="#E8E8FF">所属城区&nbsp;<BR>
        <b>（可多选）</b></td>
      <td width="31%" bgcolor="#E8E8FF"> 
        <select name="crm_khxx_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right" bgcolor="#E8E8FF">月收入&nbsp;&nbsp;<BR>
        <b>（可多选）</b></td>
      <td width="33%" bgcolor="#E8E8FF"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple >
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="19%" align="right">年龄区间&nbsp;<BR>
        <b>（可多选）</b></td>
      <td width="31%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple >
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm","");
%> 
        </select>
      </td>
      <td width="17%" align="right">职&nbsp;&nbsp;业&nbsp;&nbsp;<BR>
        <b>（可多选）</b></td>
      <td width="33%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple >
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="19%" height="32">选择项目</td>
      <td height="32" colspan="3"> 第一项 
		<input type="hidden" name="tj1name" value="">
        <select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj1name.value=tj1.options[tj1.selectedIndex].text" >
          <option value="">所属城区</option>
          <option value="">所属热点地区</option>
          <option value="">所属环线位置</option>
          <option value="">年龄区间</option>
          <option value="">月收入</option>
          <option value="">职业</option>
        </select>
        &nbsp;&nbsp; 第二项 
		<input type="hidden" name="tj2name" value="">
        <select name="tjxm2" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj2name.value=tj2.options[tj2.selectedIndex].text" >
          <option value=""></option>
          <option value="">所属城区</option>
          <option value="">所属热点地区</option>
          <option value="">所属环线位置</option>
          <option value="">年龄区间</option>
          <option value="">月收入</option>
          <option value="">职业</option>
        </select>
        &nbsp;&nbsp; 第三项 
		<input type="hidden" name="tj3name" value="">
        <select name="tjxm3" style="FONT-SIZE:12PX;WIDTH:100PX" onchange="tj3name.value=tj3.options[tj3.selectedIndex].text" >
          <option value=""></option>
          <option value="">所属城区</option>
          <option value="">所属热点地区</option>
          <option value="">所属环线位置</option>
          <option value="">年龄区间</option>
          <option value="">月收入</option>
          <option value="">职业</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="19%" height="29">显示风格</td>
      <td height="29" colspan="3"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="41" colspan="4"> 
        <input type="button"  value="大小单统计" onClick="f_do(selectform)">
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
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围"))) {
		return false;
	}


	if (FormName.qye.value!="" || FormName.qye2.value!="")
	{
		if(	javaTrim(FormName.qye)=="") {
			alert("请输入[签约额范围]！");
			FormName.qye.focus();
			return false;
		}
		if(!(isFloat(FormName.qye, "签约额范围"))) {
			return false;
		}
		if(	javaTrim(FormName.qye2)=="") {
			alert("请输入[签约额范围]！");
			FormName.qye2.focus();
			return false;
		}
		if(!(isFloat(FormName.qye2, "签约额范围"))) {
			return false;
		}

		FormName.action="dzxtjb4.jsp";
	}
	else{

		FormName.action="dzxtjb3.jsp";
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
