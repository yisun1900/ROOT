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
String dwbh=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Crm_dzyhsqList.jsp" name="selectform">
<div align="center">打折优惠申请--修改</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">客户编号</td>
      <td width="33%"> 
        <input type="text" name="crm_dzyhsq_khbh" size="20" maxlength="20" >      </td>
      <td align="right" width="17%">客户姓名</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">房屋地址</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >      </td>
      <td align="right" width="17%">设计师</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">申请人</td>
      <td width="33%"> 
        <input type="text" name="crm_dzyhsq_sqr" size="20" maxlength="20" >      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%">申请时间 从</td>
      <td width="33%"> 
        <input type="text" name="crm_dzyhsq_sqsj" size="20" maxlength="10" >      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="crm_dzyhsq_sqsj2" size="20" maxlength="10" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">是否申请其它优惠</td>
      <td width="33%">
        <input type="radio" name="crm_dzyhsq_sfsqqtyh" value="Y">是
        <input type="radio" name="crm_dzyhsq_sfsqqtyh" value="N">否      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">审批标志</td>
      <td><%
	cf.radioToken(out, "crm_dzyhsq_spbz","1+未审批&2+已审批","");
%></td>
      <td align="right">审批结果</td>
      <td><%
	cf.radioToken(out, "crm_dzyhsq_spjg","1+同意&2+不同意","");
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">录入部门</td>
      <td width="33%"> 
        <select name="crm_dzyhsq_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>      </td>
      <td align="right" width="17%">录入人</td>
      <td width="33%">
        <input type="text" name="crm_dzyhsq_lrr" size="20" maxlength="20" >      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform)">
        <input type="reset"  value="重输">      </td>
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
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj2, "申请时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
