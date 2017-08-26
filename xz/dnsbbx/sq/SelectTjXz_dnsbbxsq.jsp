<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="Xz_dnsbbxsqTjList.jsp" name="selectform">
<div align="center">统计－电脑及设备报修申请</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC">
  <td width="22%" align="right">报修分公司</td> 
  <td width="28%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and cxbz='N' order by dwbh","");
%>
    </select></td>
  <td width="19%" align="right">报修部门</td> 
  <td width="31%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">固定资产编号</td>
  <td><input type="text" name="gsbh" size="20" maxlength="20" >  </td>
  <td align="right">固定资产名称</td>
  <td><input type="text" name="gdzcmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">固定资产部门内编号</td>
  <td><input type="text" name="bmbh" size="20" maxlength="20" >  </td>
  <td align="right">固定资产分类</td>
  <td><select name="gdzcflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gdzcflmc c1,gdzcflmc c2 from xz_gdzcflbm order by gdzcflbm","");
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">型号</td>
  <td><input type="text" name="xh" size="20" maxlength="50" >  </td>
  <td align="right">品牌</td>
  <td><input type="text" name="pp" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">配置(CPU)</td>
  <td><input type="text" name="pz1" size="20" maxlength="50" >  </td>
  <td align="right">配置(内存)</td>
  <td><input type="text" name="pz2" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">配置(硬盘)</td>
  <td><input type="text" name="pz3" size="20" maxlength="50" >  </td>
  <td align="right">配置(主板)</td>
  <td><input type="text" name="pz4" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">配置(显卡)</td>
  <td><input type="text" name="pz5" size="20" maxlength="50" >  </td>
  <td align="right">配置(显示器)</td>
  <td><input type="text" name="pz6" size="20" maxlength="50" >  </td>
</tr>

<tr bgcolor="#E8E8FF">
  <td align="right">报修处理状态</td>
  <td colspan="3"><input type="radio" name="clzt" value="1">
    未接收
      <input type="radio" name="clzt" value="2">
      接收
      <input type="radio" name="clzt" value="3">
      维修中
      <input type="radio" name="clzt" value="4">
      采购中
      <input type="radio" name="clzt" value="5">
      送修中
      <input type="radio" name="clzt" value="6">
      完成 </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="22%" align="right">报修序号</td> 
  <td width="28%"><input type="text" name="bxxh" size="20" maxlength="8" ></td>
  <td width="19%" align="right">报修申请人</td> 
  <td width="31%"> 
    <input type="text" name="sqr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">电脑及设备分类</td> 
  <td width="28%"> 
    <select name="dnsbflmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dnsbflmc c1,dnsbflmc c2 from xz_dnsbflbm order by dnsbflbm","");
%>
    </select>  </td>
  <td align="right" width="19%">设备保管人</td> 
  <td width="31%"> 
    <input type="text" name="bgr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">设备中是否有重要数据</td> 
  <td width="28%">
    <INPUT type="radio" name="sfyzysj" value="N">无
    <INPUT type="radio" name="sfyzysj" value="Y">有  </td> 
  <td align="right" width="19%">电脑及设备故障</td> 
  <td width="31%"> 
    <select name="dnsbgzmc" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dnsbgzmc c1,dnsbgzmc c2 from xz_dnsbgzbm order by dnsbgzbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="22%">录入人</td> 
  <td width="28%"><input type="text" name="lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">接收人</td> 
  <td width="31%"><input type="text" name="jsr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">维修人</td>
  <td><input type="text" name="wxr" size="20" maxlength="20" >  </td>
  <td align="right">维修费用</td>
  <td><input type="text" name="wxfy" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right" bgcolor="#FFFFCC">报修日期 从 </td>
  <td><input type="text" name="bxrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right">到</td>
  <td><input type="text" name="bxrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">希望完成日期 从</td>
  <td><input type="text" name="jhlqrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jhlqrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">接收时间 从 </td>
  <td><input type="text" name="jssj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="jssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">维修录入时间 从</td>
  <td><input type="text" name="wxlrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">到</td>
  <td><input type="text" name="wxlrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td width="22%" align="right">维修完成时间 从</td> 
  <td width="28%"> 
    <input type="text" name="wcsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td width="19%" align="right">到</td> 
  <td width="31%"><input type="text" name="wcsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFCC">
  <td align="right">电脑及设备报修申请统计</td>
  <td colspan="3">第一列
	<input type="hidden" name="tj1name" value="">
	<select name="tj1" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj1name.value=tj1.options[tj1.selectedIndex].text">
	  <option value=""></option>
        <option value="DECODE(clzt,'1','未接收','2','接收','3','维修中','4','采购中','5','送修中','6','完成')">处理状态</option>
        <option value="bxxh">报修序号</option>
        <option value="a.dwmc">报修分公司</option>
        <option value="b.dwmc">报修部门</option>
        <option value="sqr">报修申请人</option>
        <option value="bxrq">报修日期</option>
        <option value="jhlqrq">希望完成日期</option>
        <option value="dnsbflmc">电脑及设备分类</option>
        <option value="bgr">设备保管人</option>
        <option value="sfyzysj">设备中是否有重要数据</option>
        <option value="dnsbgzmc">电脑及设备故障分类</option>
        <option value="jsr">接收人</option>
        <option value="jssj">接收时间</option>
        <option value="c.dwmc">维修部门</option>
        <option value="wxr">维修人</option>
        <option value="wxlrsj">维修录入时间</option>
        <option value="wcsj">维修完成时间</option>

        <option value="gdzcflmc">固定资产分类</option>
        <option value="gsbh">固定资产编号</option>
        <option value="gdzcmc">固定资产名称</option>
        <option value="bmbh">部门内部编号</option>
        <option value="xh">型号</option>
        <option value="pp">品牌</option>
        <option value="pz1">配置(CPU)</option>
        <option value="pz2">配置(内存)</option>
        <option value="pz3">配置(硬盘)</option>
        <option value="pz4">配置(主板)</option>
        <option value="pz5">配置(显卡)</option>
        <option value="pz6">配置(显示器)</option>
      </select>
    第二列
	<input type="hidden" name="tj2name" value="">
	<select name="tj2" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj2name.value=tj2.options[tj2.selectedIndex].text">
	  <option value=""></option>
        <option value="DECODE(clzt,'1','未接收','2','接收','3','维修中','4','采购中','5','送修中','6','完成')">处理状态</option>
        <option value="bxxh" >报修序号</option>
        <option value="a.dwmc">报修分公司</option>
        <option value="b.dwmc">报修部门</option>
        <option value="sqr">报修申请人</option>
        <option value="bxrq">报修日期</option>
        <option value="jhlqrq">希望完成日期</option>
        <option value="dnsbflmc">电脑及设备分类</option>
        <option value="bgr">设备保管人</option>
        <option value="sfyzysj">设备中是否有重要数据</option>
        <option value="dnsbgzmc">电脑及设备故障分类</option>
        <option value="jsr">接收人</option>
        <option value="jssj">接收时间</option>
        <option value="c.dwmc">维修部门</option>
        <option value="wxr">维修人</option>
        <option value="wxlrsj">维修录入时间</option>
        <option value="wcsj">维修完成时间</option>

        <option value="gdzcflmc">固定资产分类</option>
        <option value="gsbh">固定资产编号</option>
        <option value="gdzcmc">固定资产名称</option>
        <option value="bmbh">部门内部编号</option>
        <option value="xh">型号</option>
        <option value="pp">品牌</option>
        <option value="pz1">配置(CPU)</option>
        <option value="pz2">配置(内存)</option>
        <option value="pz3">配置(硬盘)</option>
        <option value="pz4">配置(主板)</option>
        <option value="pz5">配置(显卡)</option>
        <option value="pz6">配置(显示器)</option>
    </select>
    第三列
	<input type="hidden" name="tj3name" value="">
	<select name="tj3" style="FONT-SIZE:12PX;WIDTH:100PX" onChange="tj3name.value=tj3.options[tj3.selectedIndex].text">
	  <option value=""></option>
        <option value="DECODE(clzt,'1','未接收','2','接收','3','维修中','4','采购中','5','送修中','6','完成')">处理状态</option>
        <option value="bxxh">报修序号</option>
        <option value="a.dwmc">报修分公司</option>
        <option value="b.dwmc">报修部门</option>
        <option value="sqr">报修申请人</option>
        <option value="bxrq">报修日期</option>
        <option value="jhlqrq">希望完成日期</option>
        <option value="dnsbflmc">电脑及设备分类</option>
        <option value="bgr">设备保管人</option>
        <option value="sfyzysj">设备中是否有重要数据</option>
        <option value="dnsbgzmc">电脑及设备故障分类</option>
        <option value="jsr">接收人</option>
        <option value="jssj">接收时间</option>
        <option value="c.dwmc">维修部门</option>
        <option value="wxr">维修人</option>
        <option value="wxlrsj">维修录入时间</option>
        <option value="wcsj">维修完成时间</option>

        <option value="gdzcflmc">固定资产分类</option>
        <option value="gsbh">固定资产编号</option>
        <option value="gdzcmc">固定资产名称</option>
        <option value="bmbh">部门内部编号</option>
        <option value="xh">型号</option>
        <option value="pp">品牌</option>
        <option value="pz1">配置(CPU)</option>
        <option value="pz2">配置(内存)</option>
        <option value="pz3">配置(硬盘)</option>
        <option value="pz4">配置(主板)</option>
        <option value="pz5">配置(显卡)</option>
        <option value="pz6">配置(显示器)</option>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">显示风格</td>
  <td colspan="3"><input type="radio" name="xsfg" value="1" checked>
    网页
    <input type="radio" name="xsfg" value="2">
    EXCEL </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
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
	if(!(isNumber(FormName.bxxh, "报修序号"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxrq, "报修日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.bxrq2, "报修日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq, "希望完成日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhlqrq2, "希望完成日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj, "接收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jssj2, "接收时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wxlrsj, "维修录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wxlrsj2, "维修录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wcsj, "维修完成时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.wcsj2, "维修完成时间"))) {
		return false;
	}
	if(!(isFloat(FormName.wxfy, "维修费用"))) {
		return false;
	}

	if(FormName.tj1.value=="" && FormName.tj2.value=="" && FormName.tj3.value=="") {
		alert("请选择[统计列]！");
		FormName.tj1.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
