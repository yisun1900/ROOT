<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">请录入数据</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right">问题名称</td>
      <td colspan="3"><input type="text" name="wtmc" value="" size="80" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">调查期数</td>
      <td colspan="3"><input type="text" name="dcqs" value="" size="80" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="14%">问题是否过期</td>
      <td width="44%"><input type="radio" name="wtsfgq"  value="Y">
        过期 
        <input type="radio" name="wtsfgq"  value="N" checked>
        未过期 </td>
      <td align="right" width="14%">是否可多选</td>
      <td width="28%"><input type="radio" name="sfkdx"  value="Y">
        可多选 
        <input type="radio" name="sfkdx"  value="N">
        单选 </td>
    </tr>
	
    <tr bgcolor="#FFFFFF"> 
      <td align="right">允许填写说明</td>
      <td><input type="radio" name="sfyxsm"  value="Y">
        允许 
        <input type="radio" name="sfyxsm"  value="N" checked>
        不允许 </td>
      <td><div align="right">问题分类</div></td>
      <td><select name="wtfl"  width="40">
          <option value="">&nbsp;&nbsp;</option>
          <option  value="1" >1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
          <option  value="2">2</option>
          <option  value="3">3</option>
          <option  value="4">4</option>
        </select></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td align="right" width="14%">录入人</td>
      <td width="44%"><input type="text" name="lrr" value="<%=lrr%>" size="15" readonly>
        
      <td align="right" width="14%">录入时间</td>
      <td width="28%"><input type="text" name="lrsj" size="15"  value="<%=cf.today()%>" readonly>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">可选答案1</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm1" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">可选答案2</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm2" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">可选答案3</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="21" align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm3" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="21" align="right">可选答案4</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="27" align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm4" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="27" align="right">可选答案5</td>
      <td colspan="3"><input name="kxda" type="text" value="" size="80"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm5" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">可选答案6</td>
      <td colspan="3"><input name="kxda" type="text" value="" size="80"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">结果说明</td>
      <td colspan="3"><input type="text" name="jgsm6" value="" size="80" maxlength="300" > 
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="14%">问题说明</td>
      <td colspan="3"> <textarea name="xwtsm" cols="80" rows=""></textarea> </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> <input type="button" name="ww1" value="存盘" onClick="CheckForm(insertform)"> 
        <input type="reset"  value="重输" name="reset"> </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do1(FormName)//参数FormName:Form的名称
{
	
	
	FormName.action="yjdc.jsp";
	FormName.target=""
	FormName.submit();
	return true;
	
}


function CheckForm(oForm)
{
	
	if(	javaTrim(oForm.wtmc)=="") {
		alert("请输入[问题名称]！");
		oForm.wtmc.focus();
		return false;
	}
	if(	javaTrim(oForm.dcqs)=="") {
		alert("请输入[调查期数]！");
		oForm.dcqs.focus();
		return false;
	}
	if(	!radioChecked(oForm.sfkdx)) {
		alert("请选择[是否可多选]！");
		oForm.sfkdx[0].focus();
		return false;
	}


	
	
	if(	!radioChecked(oForm.wtsfgq)) {
		alert("请选择[问题是否过期]！");
		oForm.wtsfgq[0].focus();
		return false;
	}
	if(javaTrim(oForm.kxda[0])=="")
	{
		alert("请输入可选答案！");
		oForm.kxda[0].focus();
		return false;
	}
	if(javaTrim(oForm.kxda[1])=="")
	{
		alert("请输入可选答案！");
		oForm.kxda[1].focus();
		return false;
	}
	
	
	oForm.action="SaveInsertHd_scdcwt.jsp";
	oForm.target="_blank"
	oForm.submit();
	return true;
	
}

//-->
</SCRIPT>
