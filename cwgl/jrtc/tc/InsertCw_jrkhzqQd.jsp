<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform"  >
<div align="center">签单提成</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">分公司</td>
  <td width="32%"><select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
  </select></td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">考核周期</td> 
  <td colspan="3"> 
    <select name="khzq" style="FONT-SIZE:12PX;WIDTH:252PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select khzq c1,khzq||'('||TO_CHAR(khqssj,'YYYY-MM-DD')||'至'||TO_CHAR(khjzsj,'YYYY-MM-DD')||')' c2 from cw_jrkhzq order by khzq","");
%>
    </select>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value=" 选择提成" onClick="f_xz(insertform)">
	<input type="button" onClick="f_pl(insertform)"  value="批量提成">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_xz(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("请选择[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	FormName.action="Crm_khxxQdCxList.jsp";
	FormName.submit();
	return true;
}

function f_pl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khzq)=="") {
		alert("请选择[考核周期]！");
		FormName.khzq.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	FormName.action="pltcQd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
