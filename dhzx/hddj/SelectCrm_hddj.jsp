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

<form method="post" action="Crm_hddjList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_khbh" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_khxm" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">性别</div>
              </td>
              <td width="35%"> 
                <select name="crm_hddj_xb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"M+男&W+女","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_lxfs" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">所属城区</div>
              </td>
              <td width="35%"> 
                <select name="crm_hddj_cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">拟装修地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_fwdz" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">回单装修地址</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_cgdz" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">回单施工队</div>
              </td>
              <td width="35%"> 
                <select name="crm_hddj_hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">回单班组</div>
              </td>
              <td width="35%"> 
                <select name="crm_hddj_hdsgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('4') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">回单设计师</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_hdsjs" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">录入时间 从</td>
              <td width="35%">
                <input type="text" name="crm_hddj_lrsj" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%">
                <input type="text" name="crm_hddj_lrsj2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_hddj_lrr" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
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
	if(!(isDatetime(FormName.crm_hddj_lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_hddj_lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
