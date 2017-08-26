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
<form method="post" action="Cw_dejsglflList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">序号</td>
      <td width="29%"> 
        <input type="text" name="cw_dejsglfl_xh" size="20" maxlength="8" >
      </td>
      <td align="right" width="20%">地区</td>
      <td width="30%"> 
        <select name="cw_dejsglfl_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">成本金额起始值（>=）</td>
      <td width="29%"> 
        <input type="text" name="cw_dejsglfl_qsz" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">成本金额截止值（<）</td>
      <td width="30%"> 
        <input type="text" name="cw_dejsglfl_jzz" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="21%">结算比例(0-100)</td>
      <td width="29%"> 
        <input type="text" name="cw_dejsglfl_jsbl" size="20" maxlength="17" >
      </td>
      <td align="right" width="20%">&nbsp;</td>
      <td width="30%">&nbsp; </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
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
	if(!(isNumber(FormName.cw_dejsglfl_xh, "序号"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_dejsglfl_qsz, "成本金额起始值（>=）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_dejsglfl_jzz, "成本金额截止值（<）"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_dejsglfl_jsbl, "结算比例(0-100)"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
