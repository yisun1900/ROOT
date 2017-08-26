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
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_jzkmdmCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">序号</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_xuhao" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">科目代码</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_kmdm" size="20" maxlength="40" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">科目名称</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_kmmc" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">科目类别</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_kmlb" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">余额方向</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_yefx" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">全名</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_qm" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">项目辅助核算</td> 
  <td width="35%"> 
    <input type="text" name="cw_jzkmdm_xmfzhs" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">收款类型</td> 
  <td width="35%"> 
    <select name="cw_jzkmdm_fklxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fklxbm,fklxmc from cw_fklxbm where pzfl='1' order by fklxbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">收款期数</td> 
  <td width="35%"> 
    <select name="cw_jzkmdm_fkcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select fkcs,fkcsmc from cw_fkcs order by fkcs","");
%>
    </select>
  </td>
  <td align="right" width="15%">借贷标志</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "cw_jzkmdm_jdbz","1+借（退款）&0+贷（收款）","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">分公司名称</td> 
  <td width="35%"> 
    <select name="cw_jzkmdm_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
if (yhjs.equals("A0") || yhjs.equals("A1"))
{
	out.println("<option value=\"\"></option>");
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') order by dwbh","");
}
else{
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') ans dwbh='"+ssfgs+"' order by dwbh","");
}

%> 
    </select>
  </td>
  <td align="right" width="15%"> 
    &nbsp;
  </td>
  <td width="35%"> 
    &nbsp;
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isNumber(FormName.cw_jzkmdm_xuhao, "序号"))) {
		return false;
	}
	if(!(isNumber(FormName.cw_jzkmdm_fkcs, "收款期数"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
