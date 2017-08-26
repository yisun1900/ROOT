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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_dgqkList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_khbh" size="20" maxlength="20" >
              </td>
              <td width="12%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >
              </td>
              <td width="12%"> 
                <div align="right">设计师</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">施工队</div>
              </td>
              <td width="33%"> 
                <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh","");
%> 
                </select>
              </td>
              <td width="12%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">产品</div>
              </td>
              <td width="33%"> 
                <select name="crm_dgqk_cpbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cpbm,cpmc from dm_cpbm order by cpbm","");
%> 
                </select>
              </td>
              <td width="12%"> 
                <div align="right">驻店家居顾问</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_clgw" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">供应商</div>
              </td>
              <td width="33%"> 
                <select name="crm_dgqk_gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='5' order by dwbh","");
%> 
                </select>
              </td>
              <td width="12%"> 
                <div align="right">品牌</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_pp" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"> 
                <div align="right">实际安装日期 从</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_sazrq" size="20" maxlength="10" >
              </td>
              <td width="12%"> 
                <div align="right">到</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_sazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">应安装日期 从</td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_yazrq" size="20" maxlength="10" >
              </td>
              <td width="12%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_yazrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">录入时间 从</td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_lrsj" size="20" maxlength="10" >
              </td>
              <td width="12%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="crm_dgqk_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">录入人</div>
              </td>
              <td width="33%"> 
                <input type="text" name="crm_dgqk_lrr" size="20" maxlength="20" >
              </td>
              <td width="12%"> 
                <div align="right">安装标志</div>
              </td>
              <td width="35%">
                <select name="crm_dgqk_azbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+未安装&Y+已安装","");
%> 
                </select>
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
	if(!(isDatetime(FormName.crm_dgqk_yazrq, "应安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_yazrq2, "应安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_sazrq, "实际安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_sazrq2, "实际安装日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dgqk_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
