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
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");

%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入库存品主材报价信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
                </select>              </td>
              <td width="18%" align="right"><strong><font color="#FF0000">*</font></strong>是否推荐产品</td>
              <td width="32%"><%
	cf.radioToken(out, "sftjcp","Y+是&N+否","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材大类</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeDl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材小类</td>
              <td width="32%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm order by clxlbm","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>子品牌</td>
              <td width="32%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
              <td width="18%" align="right">内部编码</td>
              <td width="32%"><input type="text" name="nbbm" value="" size="20" maxlength="100" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材名称</td>
              <td colspan="3"> 
                <input type="text" name="clmc" value="" size="73" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别/系列</td>
              <td colspan="3"> 
                <input type="text" name="cllbbm" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xh" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">颜色</td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="" size="20" maxlength="100" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>包装规格</td>
              <td><input type="text" name="bzgg" size="20" maxlength="8"  value="" ></td>
              <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span>包装计量单位</td>
              <td><select name="bzjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc mc,jldwmc from jdm_jldwbm order by jldwmc","");
%>
              </select></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>市场标价              </td>
              <td width="32%"> 
                <input type="text" name="lsj" value="" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>销售价              </td>
              <td width="32%"> 
                <input type="text" name="xsj" value="" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>结算价</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="" size="20" maxlength="9" >              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>结算比例</td>
              <td width="32%"> 
                <input type="text" name="jsbl" value="100" size="12" maxlength="8" >
                % <font color="#0000CC">（百分比）</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>计入活动比例</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="cxhdbl" value="" size="12" maxlength="8" >
                % <font color="#0000CC">（百分比）</font> </td>
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>是否有促销</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="radio" name="sfycx" value="N">
                没促销 
                <input type="radio" name="sfycx" value="Y">
                有促销 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" height="2">促销开始时间</td>
              <td width="32%" height="2" bgcolor="#E8E8FF"> 
                <input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right" height="2">促销结束时间</td>
              <td width="32%" height="2"> 
                <input type="text" name="cxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">促销价</td>
              <td width="32%"> 
                <input type="text" name="cxj" value="" size="20" maxlength="9" >              </td>
              <td width="18%" align="right">促销结算价</td>
              <td width="32%"> 
                <input type="text" name="cxcbj" value="" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">促销期计入活动比例</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="lscxhdbl" value="" size="12" maxlength="9" >
                % <font color="#0000CC">（百分比）</font> </td>
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>是否有货</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="radio" name="sfyh" value="Y" checked>
                有货 
                <input type="radio" name="sfyh" value="N">
                无货 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>是否包含配件</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="radio" name="sfbhpj" value="Y">
                包含 
                <input type="radio" name="sfbhpj" value="N">
                不包含 </td>
              <td width="18%" align="right" bgcolor="#FFFFFF">配件套数</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="pjts" value="" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                产品级别              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="" size="20" maxlength="50" >              </td>
              <td width="18%" align="right"> 
                风格属性              </td>
              <td width="32%"> 
                <input type="text" name="fgsx" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">产品说明</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">产地</td>
              <td width="32%"> 
                <input type="text" name="cd" value="" size="20" maxlength="50" >              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <p> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
                  <input type="button"  value="允许存盘" onClick="bc.disabled=false;" >
                  <input type="reset"  value="重输" name="reset">
                </p>              </td>
            </tr>
          </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//启用AJAX
%>

var fieldName="";

function changeDl(FormName)
{
	FormName.clxlbm.length=1;

	if (FormName.cldlbm.value=="")
	{
		return;
	}

	fieldName="cldlbm";

	var sql;
	sql="select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+FormName.cldlbm.value+"' order by clxlbm";

	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function changeXl(FormName)
{
	FormName.ppmc.length=1;

	if (FormName.clxlbm.value=="")
	{
		return;
	}

	fieldName="clxlbm";

	var sql;
	sql="select distinct jxc_ppxx.ppmc from jxc_ppxx,jxc_ppgysdzb where jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.ssfgs in(select dwbh from sq_dwxx where dwlx in('A0','F0') and cxbz='N' and dqbm='"+FormName.dqbm.value+"') and jxc_ppxx.clxl='"+FormName.clxlbm.value+"' order by jxc_ppxx.ppmc";

	var actionStr="/ajax/getstr.jsp?sql="+sql;
//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
	if (fieldName=="cldlbm")
	{
		strToItem2(insertform.clxlbm,ajaxRetStr);
	}
	else if (fieldName=="clxlbm")
	{
		strToItem2(insertform.ppmc,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sftjcp)) {
		alert("请选择[是否推荐产品]！");
		FormName.sftjcp[0].focus();
		return false;
	}

	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[主材名称]！");
		FormName.clmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(javaTrim(FormName.bzjldwbm)=="") {
		alert("请选择[包装计量单位]！");
		FormName.bzjldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzgg)=="") {
		alert("请输入[包装规格]！");
		FormName.bzgg.focus();
		return false;
	}
	if(!(isNumber(FormName.bzgg, "包装规格"))) {
		return false;
	}
	if (parseFloat(FormName.bzgg.value)<1)
	{
		alert("[包装规格]必须大于或者等于1！");
		FormName.bzgg.select();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("请输入[市场标价]！");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "市场标价"))) {
		return false;
	}
	if(	javaTrim(FormName.xsj)=="") {
		alert("请输入[销售价]！");
		FormName.xsj.focus();
		return false;
	}
	if(!(isFloat(FormName.xsj, "销售价"))) {
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[结算价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}
	if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
	{
		alert("错误！[结算比例]应在0到100之间");
		FormName.jsbl.focus();
		return false;
	}

	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("请输入[计入活动比例]！");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "计入活动比例"))) {
		return false;
	}
	if (parseFloat(FormName.cxhdbl.value)<0 || parseFloat(FormName.cxhdbl.value)>100)
	{
		alert("错误！[计入活动比例]应在0到100之间");
		FormName.cxhdbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("请输入[促销价]！");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "促销价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxcbj)=="") {
			alert("请输入[促销结算价]！");
			FormName.cxcbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcbj, "促销结算价"))) {
			return false;
		}
		if(	javaTrim(FormName.lscxhdbl)=="") {
			alert("请输入[促销期计入活动比例]！");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.lscxhdbl, "促销期计入活动比例"))) {
			return false;
		}
		if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
		{
			alert("错误！[促销期计入活动比例]应在0到100之间");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("请输入[促销开始时间]！");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjzsj)=="") {
			alert("请输入[促销结束时间]！");
			FormName.cxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjzsj, "促销结束时间"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjzsj.value)
		{
			alert("[促销开始时间]不能大于[促销结束时间]！");
			FormName.cxjzsj.select();
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.lscxhdbl.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
	}

	if(	!radioChecked(FormName.sfyh)) {
		alert("请选择[是否有货]！");
		FormName.sfyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbhpj)) {
		alert("请选择[是否包含配件]！");
		FormName.sfbhpj[0].focus();
		return false;
	}
	if (FormName.sfbhpj[0].checked)
	{
		if(	javaTrim(FormName.pjts)=="") {
			alert("请输入[配件套数]！");
			FormName.pjts.focus();
			return false;
		}
		if(!(isNumber(FormName.pjts, "配件套数"))) {
			return false;
		}
	}
	else{
		FormName.pjts.value="";
	}



	FormName.action="SaveInsertJxc_clbm.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

//-->
</SCRIPT>
