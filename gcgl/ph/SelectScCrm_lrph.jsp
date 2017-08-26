<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
%>
<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p>请输入查询条件（<font color="#FF0000">注意：只能删除空的批号，且只能删除自己的批号）</font></p>
        </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_lrphScList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">录入批号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrph" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">录入人</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhdlm%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">录入时间</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">批内最大序号</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zdxh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">本批数量</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sl" size="20" maxlength="8" value="0" readonly>
  </td>
  <td width="15%"> 
    <div align="right">类型</div>
  </td>
  <td width="35%"> 
    <select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+开工日期&2+中期款&3+完工日期&4+设工程担当&5+完工回访","");
%>
    </select>
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">
  </td>
</tr>
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.lrph, "录入批号"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isNumber(FormName.zdxh, "批内最大序号"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "本批数量"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


