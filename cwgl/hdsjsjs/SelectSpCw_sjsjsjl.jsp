<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
	String sjsstr=cf.getItemData("select a.dwbh,a.dwmc||'（'||b.dwmc||'）',a.ssdw from sq_dwxx a,sq_dwxx b where a.ssdw=b.dwbh and a.dwlx in('F3') order by a.ssdw,a.dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_sjsjsjlSpList.jsp" name="selectform">
<div align="center">设计师结算---审批</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFCC">
    <td align="right">分公司</td>
    <td>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
    </td>
    <td align="right">签约店面</td>
    <td><select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(dwbh,sjsbh,<%=sjsstr%>)">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%>
      </select>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">结算记录号</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjsjsjl_jsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="15%">设计室</td> 
  <td width="35%">
  <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value=""></option>
  </select>
  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="cw_sjsjsjl_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">录入部门</td> 
  <td width="35%"><select name="cw_sjsjsjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入时间从</td>
  <td><input type="text" name="cw_sjsjsjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">到</td>
  <td><input type="text" name="cw_sjsjsjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审批标志</td> 
  <td width="35%"><select name="cw_sjsjsjl_spbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="2">未审批</option>
  </select></td>
  <td align="right" width="15%">审批人</td> 
  <td width="35%"><input type="text" name="cw_sjsjsjl_spr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">审批时间 从</td> 
  <td width="35%"><input type="text" name="cw_sjsjsjl_spsj" size="20" maxlength="10" ></td>
  <td align="right" width="15%">到</td> 
  <td width="35%"><input type="text" name="cw_sjsjsjl_spsj2" size="20" maxlength="10" >  </td>
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cw_sjsjsjl_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjsjsjl_lrsj2, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjsjsjl_spsj, "审批时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjsjsjl_spsj2, "审批时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
