<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String gysbm=request.getParameter("gysbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppgysdzb.jsp" name="insertform" >
<div align="center">
  <p>主材－子品牌供应商对照表录入</p>
  <p class="STYLE1"><strong>请按顺序选择：分公司 -> 子品牌 -> 供应商</strong></p>
</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>分公司</td> 
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
	else{
		out.println("错误！未进行客户资料授权，请联系系统管理员");
		return;
	}
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>子品牌</td>
  <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where jxc_ppxx.pplb='2' order by ppmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>供应商</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <%
	cf.selectItem(out,"select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','（合作）','N','（不合作）') from jxc_gysxx where gysbm="+gysbm,gysbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFCC" align="center">
  <td colspan="4">系统授权</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>可登陆系统标志</td>
  <td><%
	cf.radioToken(out,"kdlxtbz","Y+可登陆&N+不可登陆","");
%></td>
  <td align="right">用户名称</td>
  <td><input type="text" name="yhmc" value="" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">用户登录名</td>
  <td><input type="text" name="yhdlm" value="" size="20" maxlength="16" >
  </td>
  <td align="right">用户口令</td>
  <td><input type="text" name="yhkl" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>是否锁定</td>
  <td><%
	cf.radioToken(out,"sfsd","Y+已锁定&N+未锁定","");
%></td>
  <td align="right">密码使用周期</td>
  <td><input type="text" name="mmsyzq" value="" size="16" maxlength="8" >
    天 </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">允许登陆失败次数</td>
  <td><input type="text" name="yxdlsbcs" value="" size="20" maxlength="8" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input name="sq" disabled type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="用户授权" ></td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请输入[分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[子品牌]！");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "子品牌"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商"))) {
		return false;
	}

	if(!(isNumber(FormName.mmsyzq, "密码使用周期"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "允许登陆失败次数"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfsd)) {
		alert("请选择[是否锁定]！");
		FormName.sfsd[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("请选择[可登陆系统标志]！");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(FormName.kdlxtbz[0].checked) 
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("请输入[用户登录名]！");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("请选择[用户口令]！");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("请选择[用户名称]！");
			FormName.yhmc.focus();
			return false;
		}
	}
	else{
		FormName.yhdlm.value="";
		FormName.yhkl.value="";
		FormName.yhmc.value="";
	}

	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
