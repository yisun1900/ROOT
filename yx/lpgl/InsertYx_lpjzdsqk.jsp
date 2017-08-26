<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>
<%
String lrr=(String)session.getAttribute("yhmc");

String xqbh=cf.GB2Uni(request.getParameter("xqbh"));
String xqmc=cf.GB2Uni(request.getParameter("xqmc"));
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertYx_lpjzdsqk.jsp" name="insertform" target="_blank">
<div align="center">请录入楼盘竞争对手情况</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">小区编号</span></td>
    <td colspan="3"><input type="text" name="xqbh" value="<%=xqbh%>" size="20" maxlength="8" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><span class="STYLE1">小区名称</span> </td>
    <td colspan="3"><input type="text" name="xqmc" value="<%=xqmc%>" size="70" maxlength="50" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">竞争对手名称</td> 
  <td colspan="3"> 
    <input type="text" name="jzdsmc" value="" size="70" maxlength="50" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">广告投放形式</td>
  <td colspan="3"><input type="text" name="ggtfxs" value="" size="70" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">宣传卖点</td> 
  <td colspan="3"> 
    <textarea name="xcmd" cols="69" rows="3"></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">广告投入金额</td>
  <td><input type="text" name="ggtrje" value="" size="20" maxlength="16" ></td>
  <td align="right">人力投入</td>
  <td><input type="text" name="rltr" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户掌握情况</td> 
  <td width="32%"><input type="text" name="khzwqk" value="" size="20" maxlength="50" ></td>
  <td align="right" width="17%">占有率</td> 
  <td width="33%"><input type="text" name="zyl" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">与开发商关系</td> 
  <td colspan="3"><input type="text" name="ykfsgx" value="" size="70" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font><font color="#0000FF">录入人</font> </td>
  <td><input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>  </td>
  <td align="right"><font color="#CC0000">*</font><font color="#0000FF">录入时间 </font></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.xqbh)=="") {
		alert("请输入[小区编号]！");
		FormName.xqbh.focus();
		return false;
	}
	if(!(isNumber(FormName.xqbh, "小区编号"))) {
		return false;
	}
	if(	javaTrim(FormName.xqmc)=="") {
		alert("请输入[小区名称]！");
		FormName.xqmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jzdsmc)=="") {
		alert("请输入[竞争对手名称]！");
		FormName.jzdsmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ggtfxs)=="") {
		alert("请输入[广告投放形式]！");
		FormName.ggtfxs.focus();
		return false;
	}
	if(	javaTrim(FormName.xcmd)=="") {
		alert("请输入[宣传卖点]！");
		FormName.xcmd.focus();
		return false;
	}
	if(	javaTrim(FormName.ggtrje)=="") {
		alert("请输入[广告投入金额]！");
		FormName.ggtrje.focus();
		return false;
	}
	if(!(isNumber(FormName.ggtrje, "广告投入金额"))) {
		return false;
	}
	if(	javaTrim(FormName.rltr)=="") {
		alert("请输入[人力投入]！");
		FormName.rltr.focus();
		return false;
	}
	if(	javaTrim(FormName.khzwqk)=="") {
		alert("请输入[客户掌握情况]！");
		FormName.khzwqk.focus();
		return false;
	}
	if(	javaTrim(FormName.zyl)=="") {
		alert("请输入[占有率]！");
		FormName.zyl.focus();
		return false;
	}
	if(!(isFloat(FormName.zyl, "占有率"))) {
		return false;
	}
	if(	javaTrim(FormName.ykfsgx)=="") {
		alert("请输入[与开发商关系]！");
		FormName.ykfsgx.focus();
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
