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
<form method="post" action="SpxxbCxList.jsp" name="selectform">
<div align="center">请输入查询条件</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">库存项目</td>
      <td width="35%"> 
        <input type="text" name="spxxb_kcxm" size="20" maxlength="14" >
      </td>
      <td align="right" width="15%">供应商名称</td>
      <td width="35%"> 
        <input type="text" name="gysb_gysmc" size="20" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">商品名称描述</td>
      <td colspan="3"> 
        <textarea name="spxxb_spmcms" cols="72" rows="2"></textarea>
        <BR>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">询价日期从</td>
      <td width="35%"> 
        <input type="text" name="spxjxxb_xjrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到 </td>
      <td width="35%"> 
        <input type="text" name="spxjxxb_xjrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">合同号</td>
      <td width="35%"> 
        <input type="text" name="ghhtspmxb_hth" size="20" maxlength="20" >
      </td>
      <td align="right" width="15%">商品分类</td>
      <td width="35%"> 
        <input type="text" name="spxxb_spfldm" size="20" maxlength="4" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">采购日期从</td>
      <td width="35%"> 
        <input type="text" name="cghtb_qdrq" size="20" maxlength="10" >
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> 
        <input type="text" name="cghtb_qdrq2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">合同日期从</td>
      <td width="35%"> 
        <input type="text" name="ghhtb_qdrq" size="20" maxlength="10" >
        <BR>
      </td>
      <td align="right" width="15%">到</td>
      <td width="35%"> <BR>
        <input type="text" name="ghhtb_qdrq2" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.spxjxxb_xjrq, "询价日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.spxjxxb_xjrq2, "询价日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cghtb_qdrq, "签订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.cghtb_qdrq2, "签订时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ghhtb_qdrq, "签订日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.ghhtb_qdrq2, "签订日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
