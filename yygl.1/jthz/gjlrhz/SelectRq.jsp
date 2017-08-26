<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>日期选择</title>
</head>

<body > 
<form name="cx" action="GjlrList.jsp" method="post" target="_blank">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr bgcolor="#FFFFFF">
		<td height="35" colspan="2" align="center">关键利润指标汇总</td>
	</tr>
	<tr bgcolor="#FFFFFF">
		<td width="31%" height="44" align="right">选择周期数</td>
		<td width="69%">
			<select name="zqs" style="FONT-SIZE:12PX;WIDTH:252PX" >
				<option value=""></option>
				<%
					cf.selectItem(out,"select zqs,'周期'||zqs||'（'||TO_CHAR(yy_rqsd_bzs,'YYYY-MM-DD')||'至'||TO_CHAR(yy_rqsd_bze,'YYYY-MM-DD')||'）' from YY_RQSD order by yy_rqsd_bzs desc","");
				%>
			</select>		</td>
	</tr>
	<tr bgcolor="#E8E8FF">
      <td height="44" align="right">显示风格</td>
	  <td><input type="radio" name="xsfg" value="1" checked>
	    网页
	    <input type="radio" name="xsfg" value="2">
	    EXCEL </td>
    </tr>
	<tr>
		<td height="54" colspan="2" align="center"><input name="button" type="button" onClick="f_do(cx)" value="查询"></td>
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
	if(	javaTrim(FormName.zqs)=="") {
		alert("请输入[周期数]！");
		FormName.zqs.focus();
		return false;
	}
	if(!(isNumber(FormName.zqs, "周期数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
