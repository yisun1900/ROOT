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
<form method="post" action="Dx_yfdxCxList.jsp" name="selectform">
  <div align="center">短信发送记录查询</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">手机号码</td>
      <td width="35%">
        <input type="text" name="jshm" size="20" maxlength="11" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">发出时间 从 </td>
      <td width="35%">
        <input type="text" name="fcsj" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="15%">到 </td>
      <td width="35%">
        <input type="text" name="fcsj2" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">发送人</td>
      <td width="35%">
        <input type="text" name="fsr" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%">是否成功</td>
      <td width="35%"> 
        <input type="radio" name="sfcg" value="Y">
        成功 
        <input type="radio" name="sfcg" value="N">
        失败 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">发送方式</td>
      <td width="35%"> 
        <select name="fsfs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">人工发送</option>
          <option value="0">定时发送</option>
        </select>
      </td>
      <td align="right" width="15%">发送结果 </td>
      <td width="35%"> 
        <select name="fsjg" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <option value="1">成功发送</option>
          <option value="-100">发送失败</option>
          <option value="-2">参数不完整</option>
          <option value="-3">用户名或密码不正确</option>
          <option value="-4">用户账号余额不足</option>
          <option value="8">未知原因失败</option>
          <option value="9">无返回值</option>
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
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.fcsj, "发出时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.fcsj2, "发出时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
