<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jryjkhCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">分公司</td>
    <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform)">
        <option value=""></option>
        <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select></td>
    <td align="right">考核周期</td>
    <td><select name="khzq" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">所属部门</td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
      </select>
    </td>
    <td align="right">姓名</td>
    <td><input type="text" name="cw_jryjkh_yhmc" size="20" maxlength="20" >
    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right">是否考核</td>
  <td width="32%">
	<input type="radio" name="sfkh"  value="Y">考核
	<input type="radio" name="sfkh"  value="N">未考核  </td>
  <td width="18%" align="right">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="查询" onClick="f_do(selectform)">
    <input type="reset"  value="重输">  </td>
</tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//启用Ajax
	cf.ajax(out);
%>

var fieldName="";

function changeFgs(FormName)
{
	FormName.khzq.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="khzq";

	var sql;
	sql="select khzq c1,khzq||'('||TO_CHAR(khqssj,'YYYY-MM-DD')||'至'||TO_CHAR(khjzsj,'YYYY-MM-DD')||')' c2 from cw_jrkhzq where fgsbh='"+FormName.ssfgs.value+"' order by khzq desc";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getDwbh(FormName)
{
	FormName.dwbh.length=1;

	if (FormName.ssfgs.value=="")
	{
		return;
	}

	fieldName="dwbh";

	var sql;
	sql="select dwbh,dwmc from sq_dwxx where dwlx='F2' and  cxbz='N' and ssfgs='"+FormName.ssfgs.value+"' order by cxbz,dwbh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (fieldName=="khzq")
	{
		strToSelect(selectform.khzq,ajaxRetStr);
		getDwbh(selectform);
	}
	else if (fieldName=="dwbh")
	{
		strToSelect(selectform.dwbh,ajaxRetStr);
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
