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
String yhdlm=(String)session.getAttribute("yhdlm");
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

<form method="post" action="Oa_lqsqLqCxList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">办公用品</div>
              </td>
              <td width="31%"> 
                <select name="oa_lqsq_bgypbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bgypbm,bgypmc from oa_bgypbm order by bgypbm","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">申领人</div>
              </td>
              <td width="34%"> 
                <input type="text" name="oa_lqsq_slr" size="20" maxlength="20" value="">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">申请日期 从</td>
              <td width="31%"> 
                <input type="text" name="oa_lqsq_sqrq" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%"> 
                <input type="text" name="oa_lqsq_sqrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">计划领取数量 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="oa_lqsq_jhlqsl" size="20" maxlength="8" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="oa_lqsq_jhlqsl2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right">计划领取日期 从</td>
              <td width="31%">
                <input type="text" name="oa_lqsq_jhlqrq" size="20" maxlength="10" >
              </td>
              <td width="16%" align="right">到</td>
              <td width="34%">
                <input type="text" name="oa_lqsq_jhlqrq2" size="20" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">实领取数量 从</div>
              </td>
              <td width="31%">
                <input type="text" name="oa_lqsq_slqsl" size="20" maxlength="8" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%"> 
                <input type="text" name="oa_lqsq_slqsl2" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">领取状态</div>
              </td>
              <td width="31%">
                <select name="oa_lqsq_lqzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"N+未领取&Y+已领取","");
%> 
                </select>
              </td>
              <td width="16%"> 
                <div align="right">办理人</div>
              </td>
              <td width="34%"> 
                <input type="text" name="oa_lqsq_blr" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">领取时间 从</div>
              </td>
              <td width="31%"> 
                <input type="text" name="oa_lqsq_lqsj" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
              </td>
              <td width="34%">
                <input type="text" name="oa_lqsq_lqsj2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.oa_lqsq_sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_sqrq2, "申请日期"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_jhlqsl, "计划领取数量"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_jhlqsl2, "计划领取数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_jhlqrq, "计划领取日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_jhlqrq2, "计划领取日期"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_slqsl, "实领取数量"))) {
		return false;
	}
	if(!(isNumber(FormName.oa_lqsq_slqsl2, "实领取数量"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lqsj, "领取时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.oa_lqsq_lqsj2, "领取时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
