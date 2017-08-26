<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTckd_tcjgb.jsp" name="insertform" target="_blank">
<div align="center">录入－套餐价格表</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>地区</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font>报价级别</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>户型</td>
  <td><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>套内基准面积</td>
  <td><input type="text" name="fwmj" value="" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">套餐名称</td> 
  <td colspan="3"> 
    <input type="text" name="tcmc" value="" size="73" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>套餐价格</td> 
  <td width="32%"> 
    <input type="text" name="tcjg" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>平米增加单价</td> 
  <td width="32%"> 
    <input type="text" name="pmzjdj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>涂料改为壁纸加价</td>
  <td><input type="text" name="tlgbzjj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>地板换大磁砖收费</td>
  <td><input name="dbhddzjj" type="text" value="" size="20" maxlength="17" ></td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      
	<input type="button" onClick="f_dr(insertform)"  value="导入报价">
	<input type="button" onClick="f_dc(insertform)"  value="导出报价">
	<P>
	<A HREF="套餐价格表.xls"><B>点击右键另存为，下载Excel报价模板</B></A>	</td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请选择[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[套内基准面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "套内基准面积"))) {
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("请输入[套餐价格]！");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "套餐价格"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjdj)=="") {
		alert("请输入[平米增加单价]！");
		FormName.pmzjdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjdj, "平米增加单价"))) {
		return false;
	}
	if(	javaTrim(FormName.tlgbzjj)=="") {
		alert("请输入[涂料改为壁纸加价]！");
		FormName.tlgbzjj.focus();
		return false;
	}
	if(!(isFloat(FormName.tlgbzjj, "涂料改为壁纸加价"))) {
		return false;
	}
	if(	javaTrim(FormName.dbhddzjj)=="") {
		alert("请输入[地板换大磁砖收费]！");
		FormName.dbhddzjj.focus();
		return false;
	}
	if(!(isFloat(FormName.dbhddzjj, "地板换大磁砖收费"))) {
		return false;
	}

	FormName.action="SaveInsertTckd_tcjgb.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadDataTc.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpTckd_tcjgb.jsp";
	FormName.submit();
	return true;
}
</SCRIPT>
