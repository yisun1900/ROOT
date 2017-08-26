<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>主材购买明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ssfgs=cf.executeQuery("select fgsbh from crm_khxx where khbh='"+khbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_khzcgmmx.jsp" name="insertform" target="_blank">
<div align="center">录入－客户主材购买明细（客户编号：<%=khbh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#FF0000">*</font>主材大类</td>
    <td><select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX"  onchange="changeDl(insertform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm  order by zcdlbm","");
%>
      </select>    </td>
    <td align="right"><font color="#FF0000">*</font>主材小类</td>
    <td><select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeXl(insertform)">
      </select>    </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#FF0000">*</font>品牌供应商</td>
    <td colspan="3"><select name="ppgys" style="FONT-SIZE:12PX;WIDTH:506PX">
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>原价</td> 
  <td width="32%"> 
    <input type="text" name="yj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>折后价</td> 
  <td width="32%"> 
    <input type="text" name="zhj" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>订金</td> 
  <td width="32%"> 
    <input type="text" name="dj" value="" size="20" maxlength="17" >  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>实收款</td> 
  <td width="32%"> 
    <input type="text" name="ssk" value="" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">日期</td>
  <td><input type="text" name="rq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">
	<input type="hidden" name="khbh" value="<%=khbh%>">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function changeDl(FormName)
{
	czlx=2;

	FormName.zcxlbm.length=1;
	FormName.ppgys.length=1;

	var sql="select zcxlmc from jdm_zcxlbm where zcdlmc='"+FormName.zcdlbm.value+"' order by zcxlmc";
	var actionStr="/ajax/getstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function changeXl(FormName)
{
	czlx=3;

	FormName.ppgys.length=1;

	var sql="select sq_gysxx.gysmc c1,sq_gysxx.gysmc c2 from sq_gysxx,sq_ppgyssqfgs where sq_gysxx.gysbh=sq_ppgyssqfgs.gysbh and sq_ppgyssqfgs.ssfgs='<%=ssfgs%>' and sq_gysxx.gyslb='4' and sq_gysxx.zclb='"+FormName.zcxlbm.value+"' order by sq_gysxx.gysmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	if (czlx==2)
	{
		strToItem2(insertform.zcxlbm,ajaxRetStr);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ppgys,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppgys)=="") {
		alert("请选择[品牌供应商名称]！");
		FormName.ppgys.focus();
		return false;
	}
	if(	javaTrim(FormName.yj)=="") {
		alert("请输入[原价]！");
		FormName.yj.focus();
		return false;
	}
	if(!(isFloat(FormName.yj, "原价"))) {
		return false;
	}
	if(	javaTrim(FormName.zhj)=="") {
		alert("请输入[折后价]！");
		FormName.zhj.focus();
		return false;
	}
	if(!(isFloat(FormName.zhj, "折后价"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[订金]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "订金"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("请输入[实收款]！");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "实收款"))) {
		return false;
	}
	if(!(isDatetime(FormName.rq, "日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
