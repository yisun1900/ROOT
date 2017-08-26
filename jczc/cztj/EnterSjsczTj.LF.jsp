<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String jzbm=(String)session.getAttribute("jzbm");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">设计师产值统计</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">分公司</td>
      <td width="58%" height="39"> 
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
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">签约店面</td>
      <td width="58%" height="39"> 
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
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwbh='"+dwbh+"' OR dwbh='"+jzbm+"')","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">时间时间 从</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.firstDay()%>" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">到</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">统计时间</td>
      <td width="58%" height="37"> 
        <input type="radio" name="tjsjlx" value="qyrq" checked>
        签约时间 </td>
    </tr>
    <tr>
      <td align="right" width="42%" height="37"><font color="#FF0000">*</font>业绩范围</td>
      <td width="58%" height="37" bgcolor="#CCCCFF"> 
        <input type="radio" name="jzbz" value="0" checked>
        全部 
        <input type="radio" name="jzbz" value="1">
        家装 
        <input type="radio" name="jzbz" value="2">
        公装 </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">排名标准</td>
      <td width="58%" height="37"> 
        <select name="px" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="qye">工程签约额</option>
          <option value="qys">签约数</option>
          <option value="pjde">平均单额</option>
          <option value="pmjj">平米均价</option>
          <option value="sjf">设计费</option>
          <option value="zkl">折扣率</option>
          <option value="sjsyj">设计师业绩</option>
          <option value="sjstc">设计师提成</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">显示风格</td>
      <td width="58%" height="37"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  value="统计" onClick="f_do(selectform)">
		<input type="button"  value="设计师家居单项统计" onClick="f_do1(selectform)">
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
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}

	FormName.action="sjscztjb.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}

	FormName.action="sjsczjjdxtjb.jsp";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>
