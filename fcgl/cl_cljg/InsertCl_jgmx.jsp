<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>分公司</td>
      <td width="30%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("	<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
        </select>      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>材料</td>
      <td colspan="3">
	  <select name="clbm" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	cf.selectItem(out,"select clbm,trim(clbm)||'：'||clmc||'（'||clgg||'）' from cl_clbm where clbm='"+clbm+"'","");
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>厂价</td>
      <td width="30%"> 
        <input type="text" name="cj" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font>与厂家结算价</td>
      <td width="30%"> 
        <input type="text" name="cjjsj" value="" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>分公司材料单价</td>
      <td width="30%"> 
        <input type="text" name="fgsdj" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font>工队价</td>
      <td width="30%"> 
        <input type="text" name="gdj" value="" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0000">*</font>是否有促销</td>
      <td width="30%"> 
        <input type="radio" name="sfycx" value="N">
        没促销 
        <input type="radio" name="sfycx" value="Y">
        有促销 </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp;</td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="20%" align="right" height="2">促销开始时间</td>
      <td width="30%" height="2" bgcolor="#E8E8FF"> 
        <input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td width="20%" align="right" height="2">促销结束时间</td>
      <td width="30%" height="2"> 
        <input type="text" name="cxjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="20%" align="right">促销期厂价</td>
      <td width="30%"> 
        <input type="text" name="cxcj" value="" size="20" maxlength="9" >      </td>
      <td width="20%" align="right">促销期与厂家结算价</td>
      <td width="30%"> 
        <input type="text" name="cxcjjsj" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="20%" align="right">促销期分公司材料单价</td>
      <td width="30%"> 
        <input type="text" name="cxfgsdj" value="" size="20" maxlength="9" >      </td>
      <td width="20%" align="right">促销期工队价</td>
      <td width="30%"> 
        <input type="text" name="cxgdj" value="" size="20" maxlength="9" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font>是否入库</td>
      <td width="30%"> 
        <input type="radio" name="sfrk"  value="Y">
        是 
        <input type="radio" name="sfrk"  value="N">
        否 </td>
      <td align="right" width="20%">仓库名称</td>
      <td width="30%">
        <input type="text" name="ckmc" value="" size="20" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%"><font color="#FF0033">*</font><font color="#0000CC">调整人</font></td>
      <td width="30%"> 
        <input type="text" name="tzr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">      </td>
      <td align="right" width="20%"><font color="#FF0033">*</font><font color="#0000CC">调整时间</font></td>
      <td width="30%"> 
        <input type="text" name="tzsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="导出报价" onClick="f_exp(insertform)">
        <input type="button"  value="增加新报价" onClick="f_drnew(insertform)">
        <input type="button"  value="更新报价" onClick="f_edit(insertform)" >
        <input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[材料编码]！");
		FormName.clbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cj)=="") {
		alert("请输入[厂价]！");
		FormName.cj.focus();
		return false;
	}
	if(!(isFloat(FormName.cj, "厂价"))) {
		return false;
	}
	if(	javaTrim(FormName.cjjsj)=="") {
		alert("请输入[与厂家结算价]！");
		FormName.cjjsj.focus();
		return false;
	}
	if(!(isFloat(FormName.cjjsj, "与厂家结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.fgsdj)=="") {
		alert("请输入[分公司材料单价]！");
		FormName.fgsdj.focus();
		return false;
	}
	if(!(isFloat(FormName.fgsdj, "分公司材料单价"))) {
		return false;
	}
	if(	javaTrim(FormName.gdj)=="") {
		alert("请输入[工队价]！");
		FormName.gdj.focus();
		return false;
	}
	if(!(isFloat(FormName.gdj, "工队价"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxcj)=="") {
			alert("请输入[促销期厂价]！");
			FormName.cxcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcj, "促销期厂价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxcjjsj)=="") {
			alert("请输入[促销期与厂家结算价]！");
			FormName.cxcjjsj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcjjsj, "促销期与厂家结算价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxfgsdj)=="") {
			alert("请输入[促销期分公司材料单价]！");
			FormName.cxfgsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxfgsdj, "促销期分公司材料单价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxgdj)=="") {
			alert("请输入[促销期工队价]！");
			FormName.cxgdj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxgdj, "促销期工队价"))) {
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
		FormName.cxcj.value="";
		FormName.cxcjjsj.value="";
		FormName.cxfgsdj.value="";
		FormName.cxgdj.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
	}
	
	
	if(	!radioChecked(FormName.sfrk)) {
		alert("请选择[是否入库]！");
		FormName.sfrk[0].focus();
		return false;
	}
	if (FormName.sfrk[0].checked)
	{
		if(	javaTrim(FormName.ckmc)=="") {
			alert("请输入[仓库名称]！");
			FormName.ckmc.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.ckmc)!="") {
			alert("不需要输入[仓库名称]！");
			FormName.ckmc.select();
			return false;
		}
	}

	if(	javaTrim(FormName.tzr)=="") {
		alert("请输入[调整人]！");
		FormName.tzr.focus();
		return false;
	}
	if(	javaTrim(FormName.tzsj)=="") {
		alert("请输入[调整时间]！");
		FormName.tzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tzsj, "调整时间"))) {
		return false;
	}

	
	FormName.action="SaveInsertCl_jgmx.jsp";
	FormName.submit();
	return true;
}


function f_exp(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ExpCl_jgmx.jsp";
	FormName.submit();
	return true;

}

function f_drnew(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ImpAddData.jsp";
	FormName.submit();
	return true;

}

function f_edit(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[分公司]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="ImpEditData.jsp";
	FormName.submit();
	return true;

}

//-->
</SCRIPT>
