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

<form method="post" action="Crm_zjsjkCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">记录号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_jlh" size="20" maxlength="8" >
              </td>
              <td width="15%"> 
                <div align="right">专家库类型</div>
              </td>
              <td width="35%"> 
                <select name="crm_zjsjk_zjlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zjlxbm,zjlxmc from dm_zjlxbm order by zjlxbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">标题</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_bt" size="20" maxlength="40" >
              </td>
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_yhdlm" size="20" maxlength="16" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">录入日期 从</td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_lrrq" size="20" maxlength="10" >
              </td>
              <td width="15%" align="right">到</td>
              <td width="35%"> 
                <input type="text" name="crm_zjsjk_lrrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">内容</td>
              <td colspan="3"> 
                <textarea name="crm_zjsjk_nr" cols="55" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(!(isNumber(FormName.crm_zjsjk_jlh, "记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjsjk_lrrq, "录入日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zjsjk_lrrq2, "录入日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
