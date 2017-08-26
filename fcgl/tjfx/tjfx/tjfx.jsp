<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
		<td align="right" width="15%"><font color="red">统计时间</font> 从：</td> 
		<td width="35%"> <input type="text" name="tjsj" size="20" maxlength="10" >
		</td>
		<td width="15%"> <div align="right">到</div></td>
		<td width="35%"> <input type="text" name="tjsj2" size="20" maxlength="10" >
		</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料大类</td> 
  <td width="35%"> 
    <select name="cldlbm" style="FONT-SIZE:12px;WIDTH:152px">
		<option value=""></option>
		<%
		cf.selectItem(out,"select cldlbm,cldlmc from cl_cldlbm order by cldlmc","");
		%>
	</select>
  </td>
  <td align="right" width="15%">分公司</td> 
  <td width="35%"> 
   <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
		%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料名称</td> 
  <td width="35%"> 
	<select name="clbm" style="FONT-SIZE:12px;WIDTH:152px">
		<option value=""></option>
		<%
		cf.selectItem(out,"select clbm,clmc from cl_clbm order by clmc","");
		%>
	</select>
  </td>
  <td align="right" width="15%">材料规格</td> 
  <td width="35%"> 
    <input type="text" name="clgg" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">利润计算方式</td> 
  <td width="35%"> 
	<select name="lrjsfs" style="FONT-SIZE:12PX;WIDTH:152PX"> 
	<option value=""></option>
	<option value="1">差价方式</option>
	<option value="2">百分比方式</option>
	</select>
  </td>
  <td width="15%"> <div align="right">计量单位</div></td>
              <td width="35%"> 
			  <select name="jldwbm" style="FONT-SIZE:12px;WIDTH:152px">
                <option value=""></option>
				<%
				cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
				%>
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">利润百分比 从</td> 
  <td width="35%"> 
    <input type="text" name="lrbfb" size="20" maxlength="9" >%
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> 
    <input type="text" name="lrbfb2" size="20" maxlength="9" >%
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">材料单价 从</td> 
  <td width="35%"> 
    <input type="text" name="cldj" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> 
    <input type="text" name="cldj2" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">签约百分比 从</td> 
  <td width="35%"> 
    <input type="text" name="qybfb" size="20" maxlength="9" >%
  </td>
  <td align="right" width="15%">到</td> 
  <td width="35%"> 
    <input type="text" name="qybfb2" size="20" maxlength="9" >%
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
/*
	if(	javaTrim(FormName.tjsj)=="") {
		alert("请输入[统计时间]！");
		FormName.tjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjsj, "统计时间"))) {
		return false;
	}
	if(	javaTrim(FormName.tjsj2)=="") {
		alert("请输入[统计时间]！");
		FormName.tjsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjsj2, "统计时间"))) {
		return false;
	}
*/
	if(!(isFloat(FormName.lrbfb, "利润百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.lrbfb2, "利润百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.cldj, "材料单价"))) {
		return false;
	}
	if(!(isFloat(FormName.cldj2, "材料单价"))) {
		return false;
	}
	if(!(isFloat(FormName.qybfb, "签约百分比"))) {
		return false;
	}
	if(!(isFloat(FormName.qybfb2, "签约百分比"))) {
		return false;
	}

	FormName.action="tjfxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
