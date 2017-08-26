<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_fkfamxCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">付款方案</td>
      <td width="28%"> 
        <select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkfabm,fkfamc from cw_fkfabm order by fkfabm","");
%> 
      </select>      </td>
      <td align="right" width="23%">收款期数</td>
      <td width="27%"> 
        <select name="cw_fkfamx_fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs","");
%> 
      </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="22%">收款方式</td>
      <td colspan="3"> 
		<INPUT type="radio" name="cw_fkfamx_lx" value="1">按折前收款(不含增减项)<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="2">按折前收款（含增减项一次收取）<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="3">按折前收款（含增减项分次收取）<BR><BR>

		<INPUT type="radio" name="cw_fkfamx_lx" value="6">按折后收款(不含增减项)<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="7">按折后收款（含增减项一次收取）<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="8">按折后收款（含增减项分次收取）<BR><BR>

		<INPUT type="radio" name="cw_fkfamx_lx" value="A">折前增减项<BR>
		<INPUT type="radio" name="cw_fkfamx_lx" value="B">折后增减项<BR>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">收款是否包含管理费</td>
      <td>
		<INPUT type="radio" name="sfbhglf" value="N">不包含
		<INPUT type="radio" name="sfbhglf" value="Y">包含
	 </td>
      <td align="right">收款是否包含税金</td>
      <td>
		<INPUT type="radio" name="sfbhsj" value="N">不包含
		<INPUT type="radio" name="sfbhsj" value="Y">包含
	</td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
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
	if(!(isNumber(FormName.cw_fkfamx_fkcs, "收款期数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
