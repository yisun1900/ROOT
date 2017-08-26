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
String slbm=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_nbtsjlList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">反馈记录号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tsjlh" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="35%"> 
                <select name="crm_nbtsjl_clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="1">未处理</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">被反馈人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_btsr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">反馈人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tsr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">反馈时间 从</td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tssj" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_tssj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_slr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_slsj" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="35%"> 
                <select name="crm_nbtsjl_slbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by ssfgs,dwbh",slbm);
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm);
	}
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">处理人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_clr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">处理开始时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_clkssj" size="20" maxlength="10" >
              </td>
              <td width="15%"> 
                <div align="right">处理结束时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_nbtsjl_cljssj" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.crm_nbtsjl_tsjlh, "投诉记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_tssj, "投诉时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_tssj2, "投诉时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_slsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_clkssj, "处理开始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_nbtsjl_cljssj, "处理结束时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
