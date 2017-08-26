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

<form method="post" action="Kp_kpjlList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">考评记录号</div>
  </td>
              <td width="33%"> 
                <input type="text" name="kpjlh" size="20" maxlength="8" >
  </td>
              <td width="17%"> 
                <div align="right">考评起始时间</div>
  </td>
              <td width="33%"> 
                <input type="text" name="qssj" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">考评截止时间</div>
  </td>
              <td width="33%"> 
                <input type="text" name="jzsj" size="20" maxlength="10" >
  </td>
              <td width="17%"> 
                <div align="right">录入人</div>
  </td>
              <td width="33%"> 
                <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">录入时间 从</div>
  </td>
              <td width="33%"> 
                <input type="text" name="lrsj" size="20" maxlength="10" >
              </td>
              <td width="17%"> 
                <div align="right">到</div>
  </td>
              <td width="33%"> 
                <input type="text" name="lrsj2" size="20" maxlength="10" >
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
	if(!(isNumber(FormName.kpjlh, "考评记录号"))) {
		return false;
	}
	if(!(isDatetime(FormName.qssj, "考评起始时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "考评截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
