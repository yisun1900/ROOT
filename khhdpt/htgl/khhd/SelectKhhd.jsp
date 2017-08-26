<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String zdyhbz=(String)session.getAttribute("zdyhbz");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");

	String yhdlm=(String)session.getAttribute("yhdlm");
	String yhmc=cf.executeQuery("select yhmc from sq_yhxx where zwbm='05' and yhdlm='"+yhdlm+"' ");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Hy_khhdptCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFCC"> 
              <td width="19%"> 
                <div align="right">分公司</div>
              </td>
              <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
              <td width="17%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
                </select>
              </td>
            </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">客户编号</td> 
  <td width="35%"> 
    <input type="text" name="hy_khhdpt_khbh" size="20" maxlength="20" >
  </td>
      <td align="right" width="15%"> 客户姓名 </td>    <td width="35%"><input type="text" name="crm_khxx_khxm" size="20" maxlength="50" > 
      </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">录入人</td> 
  <td width="35%"> 
    <input type="text" name="hy_khhdpt_lrr" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">录入时间</td> 
  <td width="35%"> 
    <input type="text" name="hy_khhdpt_lrsj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="15%">购买日期</td>
      <td width="35%"><input type="text" name="hy_khhdpt_gmrq" size="20" maxlength="10" > 
      </td>
  <td align="right" width="15%">房屋地址</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">联系方式</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >
  </td>
  <td align="right" width="15%">设计师</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">合同号</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">施工队</td> 
  <td width="35%"> 
    <input type="text" name="crm_khxx_sgd" size="20" maxlength="5" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">主材名称</td> 
  <td width="35%"> 
    <input type="text" name="jc_zcjgb_zcmc" size="20" maxlength="50" >
  </td>
  <td align="right" width="15%">&nbsp; 
    
  </td>
  <td width="35%">&nbsp; 
    
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
	if(!(isDatetime(FormName.hy_khhdpt_gmrq, "购买日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_khhdpt_lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
