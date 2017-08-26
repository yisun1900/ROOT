<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jc_tqzsxxList.jsp" name="selectform">
<div align="center"> 特权赠送信息－维护</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">所属分公司</td> 
  <td width="35%"> 
    <select name="jc_tqzsxx_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("错误！未进行客户资料授权，请联系系统管理员");
			return;
		}
	%> 
     </select>  
 </td>
  <td align="right" width="15%">赠送项目</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_zsxm" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">计量单位</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_jldw" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">成本单价</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_cbdj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">市场单价</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_scdj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">赠送数量上限</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_zsslsx" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">赠送数量下限</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_zsslxx" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">是否停止</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "jc_tqzsxx_sftz","Y+是&N+否","");
%>
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
	if(!(isFloat(FormName.jc_tqzsxx_cbdj, "成本单价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tqzsxx_scdj, "市场单价"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tqzsxx_zsslsx, "赠送数量上限"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tqzsxx_zsslxx, "赠送数量下限"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
