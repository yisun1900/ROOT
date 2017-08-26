<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>工程扣款审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
 <form method="post" action="" name="selectform">
  <table width="100%">
    <tr> 
      <td width="37%" height="287" > 
        <div align="center"> 
          <p>&nbsp; </p>
        </div>
      </td>
      <td width="63%" height="287" > 
        <p>&nbsp; </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p> 
          <input type="radio" name="xzlx" value="1" onclick="f_do(selectform)">
          调换产品--修改（调换产品未完成）</p>
        <p>&nbsp;</p>
        <p> 
          <input type="radio" name="xzlx" value="2" onclick="f_do(selectform)">
          结算单--修改（调换产品已完成）</p>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="44" align="center" > 
        <input type="button" name="Button" value=" 修 改 " onclick="f_do(selectform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.xzlx)) {
		alert("请选择[调换产品或结算单]！");
		FormName.xzlx[0].focus();
		return false;
	}

	if (FormName.xzlx[0].checked)
	{
		FormName.action="/gcgl/zjx/SelectCrm_zjxdj.jsp";
	}
	else{
		FormName.action="/jsgl/khjs/SelectCrm_zjxdj.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
