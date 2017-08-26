<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>请选择客户类型</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="0">
    <tr> 
      <td height="55" colspan="2"> 
        <div align="center">请选择类型</div>      </td>
    </tr>
    <tr> 
      <td width="16%" height="34" align="right" valign="top">&nbsp;</td>
      <td height="34" width="38%" valign="middle"> 
        <table width="100%" border="0" bgcolor="#FFFFCC"  id="xllb" >
          <tr> 
		  <td > 
          <input type="radio" name="zt" value="2" checked>
          签家装合同客户
			<p> 
          <input type="radio" name="zt" value="4">
          非家装客户      </td>
    </tr>
  </table>      </td>
    </tr>
    <tr> 
      <td height="48" colspan="2"> 
        <div align="center"> 
          <input type="button"  value="继续" onClick="f_do(selectform)">
        </div>      </td>
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

	if(	!radioChecked(FormName.zt)) {
		alert("请选择[客户类型]！");
		FormName.zt[0].focus();
		return false;
	}

	if (FormName.zt[0].checked)
	{
		FormName.action="SelectCxCrm_khxx.jsp";
	}
	else{
		FormName.action="SelectCxCrm_zxkhxx.jsp";
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
