<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<html>
<head>
<title>人员增补申请</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_ryzbsq.jsp" name="insertform" id="insertform" target="_blank">
<div align="center">人员增补申请</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">申报分公司</td>
    <td width="35%"><select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
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
    </select></td>
	    <td align="right" width="15%">申请部门</td>
    <td width="35%"><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">增补职务</td>
    <td width="35%"><select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%>
    </select>
    </td>
    <td align="right" width="15%">增补员额</td>
    <td width="35%"><input type="text" name="zbye"  value="" size="20" maxlength="8" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">增补理由</td>
    <td width="35%"><select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)" >
      <option value=""></option>
      <option value="1">缺员补充</option>
      <option value="2">扩大编制</option>
      <option value="3">储备人力</option>
      <option value="4">其他</option>
    </select>
    </td>
	    <td align="right" width="15%">增补其他</td>
    <td width="35%" ><input type="text" name="zbqt" value="" id="zbqt" size="20" maxlength="20" disabled>
    选择<span class="STYLE2">其他请</span>填写    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">希望到岗时间</td>
    <td width="35%"><input type="text" name="xwdgsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" width="15%">等待审批</td>
    <td width="35%">
		<select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
			<option value=""></option>
							  <%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{%> 
			<option value="0150">总裁：等待董事长审批</option>
			<option value="0160">副总裁：等待总裁审核</option>
			<option value="0170">部门总监/总裁助理：等待分管副总裁审核</option>
			<option value="0180">部门经理：等待部门总监审核</option>
			<option value="0190">集团员工：等待部门经理审核</option>
			<option value="0110">总经理：等待人力行政总监审核</option>
			<option value="0120">副总经理/总经理助理：等待大区经理审核</option>
			<option value="0130">部门经理：等待大区经理审核</option>
			<option value="0140">分公司员工：等待人力资源行政经理审核</option>
		<%}
		else{%> 
			<option value="0110">总经理：等待人力行政总监审核</option>
			<option value="0120">副总经理/总经理助理：等待大区经理审核</option>
			<option value="0130">部门经理：等待大区经理审核</option>
			<option value="0140">分公司员工：等待人力资源行政经理审核</option>

		<%}%>
		</select>

    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">性别</td>
    <td width="35%"><select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="0">不限制</option>
      <option value="1">男</option>
      <option value="2">女</option>
    </select>
    </td>
    <td align="right" width="15%">婚姻</td>
    <td width="35%"><select name="hy" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="0">不限制</option>
      <option value="1">已婚</option>
      <option value="2">未婚</option>
    </select>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">年龄</td>
    <td width="35%"><input type="text" name="nl" value="" size="20" maxlength="20" >
    </td>
    <td align="right" width="15%">学历</td>
    <td width="35%"><select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <option value="0">高中</option>
      <option value="1">大专</option>
      <option value="2">大学</option>
      <option value="3">硕士</option>
    </select>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">专业</td>
    <td width="35%"><input type="text" name="zy" value="" size="20" maxlength="40" >
    </td>
    <td align="right" width="15%">外语</td>
    <td width="35%"><input type="text" name="wy" value="" size="20" maxlength="20" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">计算机能力</td>
    <td width="35%"><input type="text" name="jsjnl" value="" size="20" maxlength="20" >
    </td>
    <td align="right" width="15%">工作经验</td>
    <td width="35%"><input type="text" name="gzjy" value="" size="20" maxlength="20" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">个性</td>
    <td width="35%"><input type="text" name="gx" value="" size="20" maxlength="60" >
    </td>
    <td align="right" width="15%">技能</td>
    <td width="35%"><input type="text" name="jn" value="" size="20" maxlength="40" >
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">其他</td>
    <td width="35%" colspan="3"><input type="text" name="qt" value="" size="20" maxlength="200" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">补充人员工作内容</td>
    <td width="35%" colspan="3">
	<textarea name="rygznr" cols="70" rows="2"></textarea>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" width="15%"><span class="STYLE1">录入人</span></td>
    <td width="35%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
    </td>
	    <td align="right" width="15%"><span class="STYLE1">录入时间</span></td>
    <td width="35%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
    </td>
  </tr>
    <tr bgcolor="#FFFFFF">
    <td align="right" width="15%">备注</td>
    <td width="35%" colspan="3">
	<textarea name="bz" cols="70" rows="2"></textarea>
    </td>
  </tr>
  <tr align="center">
    <td colspan="4">
	    <input name="ssfgs" type="hidden" value="<%=ssfgs%>">
		<input name="button" type="button" onClick="f_do(insertform)"  value="存盘">
        <input type="reset"  value="重输" name="reset">
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
function setText(obj)
{
	var valsel = obj.value;
	var textid = document.getElementById("zbqt");
	if(valsel != "4")
	 textid.disabled = true;
	else
	 textid.disabled = false;
}
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[申报分公司]！");
		FormName.fgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[申请部门]！");
		FormName.dwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.zbye)=="") {
		alert("请输入[增补员额]！");
		FormName.zbye.focus();
		return false;
	}
	if(!(isNumber(FormName.zbye, "增补员额"))) {
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("请输入[增补职务]！");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zbly)=="") {
		alert("请选择[增补理由]！");
		FormName.zbly.focus();
		return false;
	}
	if(	javaTrim(FormName.xwdgsj)=="") {
		alert("请输入[希望到岗时间]！");
		FormName.xwdgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xwdgsj, "希望到岗时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("请选择[性别]！");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.hy)=="") {
		alert("请选择[婚姻]！");
		FormName.hy.focus();
		return false;
	}
	if(	javaTrim(FormName.nl)=="") {
		alert("请输入[年龄]！");
		FormName.nl.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("请选择[学历]！");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("请输入[专业]！");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("请输入[外语]！");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("请输入[工作经验]！");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("请输入[个性]！");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("请输入[技能]！");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("请输入[补充人员工作内容]！");
		FormName.rygznr.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请输入[等待审核]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
