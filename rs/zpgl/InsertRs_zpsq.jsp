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
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_zpsq.jsp" name="insertform" target="_blank" id="insertform">
<div align="center">请录入数据</div>
<table width="100%" border="1" style="FONT-SIZE:12"  bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">申报分公司</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,sqbm,<%=dwstr%>)">
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
  <td align="right" width="15%">申请部门</td> 
  <td width="35%"> 
    <select name="sqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td width="35%"> 
    <select name="zbzw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xzzwbm,xzzwmc c1,xzzwmc c2 from dm_xzzwbm order by xzzwbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">增补员额</td> 
  <td width="35%"> 
    <input type="text" name="zprs" value="" size="20" maxlength="8" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">增补理由</td> 
  <td width="35%"> 
    <select name="zbly" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="setText(this)">
    <option value=""></option>
    <option value="1">缺员补充</option>
    <option value="2">扩大编制</option>
    <option value="3">储备人力</option>
    <option value="0">其他</option>
    </select>
  </td>
  <td align="right" width="15%">增补其他</td> 
  <td width="35%"> 
    <input type="text" name="zbqt" value="" size="20" maxlength="20" disabled>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">招聘费用</td> 
  <td width="35%"> 
    <input type="text" name="zpfy" value="" size="20" maxlength="9" >
  </td>
  <td align="right" width="15%">希望到岗时间</td> 
  <td width="35%"> 
    <input type="text" name="xwdgsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">性别要求</td> 
  <td width="35%"> 
    <select name="xbyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">不限</option>
    <option value="1">男</option>
    <option value="2">女</option>
    </select>
  </td>
  <td align="right" width="15%">婚姻要求</td> 
  <td width="35%"> 
    <select name="hyyq" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">不限</option>
    <option value="1">已婚</option>
    <option value="2">未婚</option>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">年龄要求</td> 
  <td width="35%"> 
    <input type="text" name="nlyq" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">学历要求</td> 
  <td width="35%"> 
    <select name="xl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">高中</option>
    <option value="1">大专</option>
    <option value="2">大学</option>
    <option value="3">硕士</option>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">

  <td align="right" width="15%">专业要求</td> 
  <td width="35%"> 
    <input type="text" name="zy" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">外语能力要求</td> 
  <td width="35%"> 
    <input type="text" name="wy" value="" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计算机能力要求</td> 
  <td width="35%"> 
    <input type="text" name="jsjnl" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">工作经验要求</td> 
  <td width="35%"> 
    <input type="text" name="gzjy" value="" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">个性要求</td> 
  <td width="35%"> 
    <input type="text" name="gx" value="" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">技能要求</td> 
  <td width="35%"> 
    <input type="text" name="jn" value="" size="20" maxlength="50" >
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">其他要求</td> 
  <td width="35%"> 
    <input type="text" name="qt" value="" size="20" maxlength="200" >
  </td>
  <td align="right" width="15%">审批状态编码</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztlx='01' and  ztbm not in ('0188','0199') order by ztbm","");
%>
    </select>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">补充人员工作内容</td> 
  <td width="35%" colspan="3"> 
    <textarea name="rygznr" cols="72" rows=""></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人分公司</td> 
  <td width="35%"> 
	<select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	%>
	  </select>  </td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">备注</td> 
  <td width="35%" colspan="3"> 
    <textarea name="bz" cols="72" rows=""></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
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
	if(valsel != "0")
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
	if(	javaTrim(FormName.sqbm)=="") {
		alert("请输入[申请部门]！");
		FormName.sqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zbzw)=="") {
		alert("请选择[增补职务]！");
		FormName.zbzw.focus();
		return false;
	}
	if(	javaTrim(FormName.zprs)=="") {
		alert("请输入[增补员额]！");
		FormName.zprs.focus();
		return false;
	}
	if(!(isNumber(FormName.zprs, "增补员额"))) {
		return false;
	}
	if(	javaTrim(FormName.zpfy)=="") {
		alert("请输入[招聘费用]！");
		FormName.zpfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zpfy, "招聘费用"))) {
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
	if(	javaTrim(FormName.xbyq)=="") {
		alert("请选择[性别要求]！");
		FormName.xbyq.focus();
		return false;
	}
	if(	javaTrim(FormName.hyyq)=="") {
		alert("请选择[婚姻要求]！");
		FormName.hyyq.focus();
		return false;
	}
	if(	javaTrim(FormName.nlyq)=="") {
		alert("请输入[年龄要求]！");
		FormName.nlyq.focus();
		return false;
	}
	if(	javaTrim(FormName.xl)=="") {
		alert("请选择[学历要求]！");
		FormName.xl.focus();
		return false;
	}
	if(	javaTrim(FormName.zy)=="") {
		alert("请输入[专业要求]！");
		FormName.zy.focus();
		return false;
	}
	if(	javaTrim(FormName.wy)=="") {
		alert("请输入[外语能力要求]！");
		FormName.wy.focus();
		return false;
	}
	if(	javaTrim(FormName.jsjnl)=="") {
		alert("请输入[计算机能力要求]！");
		FormName.jsjnl.focus();
		return false;
	}
	if(	javaTrim(FormName.gzjy)=="") {
		alert("请输入[工作经验要求]！");
		FormName.gzjy.focus();
		return false;
	}
	if(	javaTrim(FormName.gx)=="") {
		alert("请输入[个性要求]！");
		FormName.gx.focus();
		return false;
	}
	if(	javaTrim(FormName.jn)=="") {
		alert("请输入[技能要求]！");
		FormName.jn.focus();
		return false;
	}
	if(	javaTrim(FormName.qt)=="") {
		alert("请输入[其他要求]！");
		FormName.qt.focus();
		return false;
	}
	if(	javaTrim(FormName.rygznr)=="") {
		alert("请输入[补充人员工作内容]！");
		FormName.rygznr.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("请选择[审批状态编码]！");
		FormName.ztbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	FormName.savebutton.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
