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
<form method="post" action="SaveInsertTc_yhlbmx.jsp" name="insertform" target="_blank">
<div align="center">录入－套餐优惠礼包明细</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>礼包项目编码</td> 
  <td width="32%"><input type="text" name="lbxmbm" value="" size="20" maxlength="6" ></td>
  <td align="right" width="18%">地区</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">报价级别</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm","");
%>
    </select>  </td>
  <td align="right" width="18%">礼包名称</td> 
  <td width="32%">
  <select name="lbmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select lbmc c1,lbmc c2 from tc_yhlb order by lbmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">项目名称</td>
  <td colspan="3"><input type="text" name="xmmc" value="" size="73" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">品牌</td> 
  <td colspan="3"> 
    <input type="text" name="ppmc" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">型号</td>
  <td colspan="3"><input type="text" name="xh" value="" size="73" maxlength="100" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">折前单价</td>
  <td><input type="text" name="zqdj" value="" size="20" maxlength="17" ></td>
  <td align="right">升级折价</td>
  <td><input type="text" name="sjzj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">优惠单价</td>
  <td><input type="text" name="dj" value="" size="20" maxlength="17" ></td>
  <td align="right">计量单位</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">数量</td> 
  <td width="32%"><input type="text" name="sl" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%">类型</td> 
  <td width="32%"><%
	cf.radioToken(out, "lx","1+工程&2+主材","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注及工艺说明</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="10"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="button" onClick="f_dr(insertform)"  value="导入优惠项目">
	<input type="button" onClick="f_dc(insertform)"  value="导出优惠项目">
	<P>
	<A HREF="CSH06-套餐优惠礼包.xls"><B>点击右键另存为，下载Excel报价模板</B></A>	</td>
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
	if(	javaTrim(FormName.lbxmbm)=="") {
		alert("请选择[礼包项目编码]！");
		FormName.lbxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lbmc)=="") {
		alert("请选择[礼包名称]！");
		FormName.lbmc.focus();
		return false;
	}
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
	if(	javaTrim(FormName.xmmc)=="") {
		alert("请输入[项目名称]！");
		FormName.xmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("请选择[计量单位]！");
		FormName.jldw.focus();
		return false;
	}
	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前单价"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[优惠单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "优惠单价"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzj)=="") {
		alert("请输入[升级折价]！");
		FormName.sjzj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzj, "升级折价"))) {
		return false;
	}
	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "数量"))) {
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
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}

function f_dr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadDataYh.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请选择[报价级别]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpTc_yhlb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
