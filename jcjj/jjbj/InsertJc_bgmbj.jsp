<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJc_bgmbj.jsp" name="insertform" target="_blank">
<div align="center">请录入型材门报价</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>型材门类型</td> 
  <td width="32%"><select name="xcmlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select xcmlxbm,xcmlxmc from jdm_xcmlxbm order by xcmlxbm","");
%>
  </select></td>
  <td align="right" width="16%">&nbsp;</td> 
  <td width="34%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><strong>推拉门</strong>：边框型号<BR>
    <strong>吸塑</strong>：刀型<BR>
    <strong>包覆</strong>：刀型<BR>
    <strong>板材铝门</strong>：门型</td> 
  <td colspan="3"> 
    <input type="text" name="bklxxh" value="" size="71" maxlength="50" >
    <span class="STYLE1">*</span> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><strong>推拉门</strong>：材料<br>
    <strong>吸塑</strong>：花色<br>
    <strong>包覆</strong>：花色<br>
    <strong>板材铝门</strong>：材料</td>
  <td colspan="3"><input type="text" name="mbcl" value="" size="71" maxlength="50" >
    <span class="STYLE1">*</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">芯板配置</td> 
  <td colspan="3"> 
    <input type="text" name="xbpz" value="" size="71" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">装饰线条</td>
  <td colspan="3"><input type="text" name="zsxt" value="" size="71" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>计价方式</td> 
  <td width="32%"> 
    <input type="radio" name="jjfs"  value="1">平米单价
    <input type="radio" name="jjfs"  value="2">平米单价＋封边延米单价  </td>
  <td align="right" width="16%">照片名称</td> 
  <td width="34%"><input type="text" name="zpmc" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>平米单价</td>
  <td><input type="text" name="pmdj" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>延米单价</td>
  <td><input type="text" name="ymdj" value="0" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">录入人</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="16%"><span class="STYLE1">*</span><span class="STYLE2">录入时间</span></td> 
  <td width="34%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="70" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
		<input type="button"  value="存盘" name="bc" onClick="f_do(insertform)">
		<input type="reset"  value="重输" name="reset">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onClick="f_drnewExcel(insertform)"  value="增加型材门报价（Excel）" >      
	  <P><A HREF="型材门报价.xls"><B>点击右键另存为，下载Excel报价模板</B></A>      </td>
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
	if(	javaTrim(FormName.xcmlxbm)=="") {
		alert("请选择[型材门类型]！");
		FormName.xcmlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bklxxh)=="") {
		alert("请输入[边框型号、刀型、门型]！");
		FormName.bklxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.mbcl)=="") {
		alert("请输入[材料、花色]！");
		FormName.mbcl.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("请选择[计价方式]！");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.pmdj)=="") {
		alert("请输入[平米单价]！");
		FormName.pmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmdj, "平米单价"))) {
		return false;
	}
	if(	javaTrim(FormName.ymdj)=="") {
		alert("请输入[延米单价]！");
		FormName.ymdj.focus();
		return false;
	}
	if(!(isFloat(FormName.ymdj, "延米单价"))) {
		return false;
	}

	if (FormName.jjfs[0].checked)
	{
		if (parseFloat(FormName.pmdj.value)==0)
		{
			alert("[平米单价]不能为0！");
			FormName.pmdj.select();
			return false;
		}
		if (parseFloat(FormName.ymdj.value)!=0)
		{
			alert("[延米单价]应该为0！");
			FormName.ymdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.pmdj.value)==0)
		{
			alert("[平米单价]不能为0！");
			FormName.pmdj.select();
			return false;
		}
		if (parseFloat(FormName.ymdj.value)==0)
		{
			alert("[延米单价]不能为0！");
			FormName.ymdj.select();
			return false;
		}
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

	FormName.action="SaveInsertJc_bgmbj.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}

function f_drnewExcel(FormName)//参数FormName:Form的名称
{
	FormName.action="ImpAddDataBgm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
