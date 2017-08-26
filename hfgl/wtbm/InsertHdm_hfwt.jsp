<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>
<%
String fbr=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">录入－回访问题</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" name="bc" value="存盘" onClick="f_do(insertform)">
        <input type="button"  value="下一个问题" name="ww2" onClick="f_do1(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>问题名称</td>
      <td colspan="3"> 
        <input type="text" name="wtmc" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>有效标志</td>
      <td width="34%"> 
        <input type="radio" name="yxbz"  value="Y" checked>
        有效 
        <input type="radio" name="yxbz"  value="N">
        无效</td>
      <td align="right" width="20%"><font color="#CC0000">*</font>是否可多选</td>
      <td width="30%"> 
        <input type="radio" name="sfkdx"  value="1">
        多选 
        <input type="radio" name="sfkdx"  value="2">
        单选
        <input type="radio" name="sfkdx"  value="3">
        写说明</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>是否允许填写说明</td>
      <td><input type="radio" name="sftxsm"  value="Y">
允许
  <input name="sftxsm" type="radio"  value="N" checked>
不允许    
      <td align="right">填写说明提示</td>
      <td><input name="txsmts" type="text"  value="" size="23" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><span class="STYLE1">发布人</span></td>
      <td width="34%"> 
        <input name="fbr" type="text" value="<%=fbr%>" size="15" maxlength="20" readonly>
      <td align="right" width="20%"><font color="#CC0000">*</font><span class="STYLE1">发布时间</span></td>
      <td width="30%"> 
        <input name="fbsj" type="text"  value="<%=cf.today()%>" size="15" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4"><b><font color="#0000CC">问题答案</font></b></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案1]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh1" value="1" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案1]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm1"  value="Y">
        允许 
        <input type="radio" name="sfyxsm1"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案1]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc1" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案2]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh2" value="2" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案2]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm2"  value="Y">
        允许 
        <input type="radio" name="sfyxsm2"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案2]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc2" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案3]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh3" value="3" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案3]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm3"  value="Y">
        允许 
        <input type="radio" name="sfyxsm3"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案3]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc3" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案4]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh4" value="4" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案4]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm4"  value="Y">
        允许 
        <input type="radio" name="sfyxsm4"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="21" align="right" width="16%">[答案4]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc4" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案5]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh5" value="5" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案5]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm5"  value="Y">
        允许 
        <input type="radio" name="sfyxsm5"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td height="27" align="right" width="16%" bgcolor="#E8E8FF">[答案5]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc5" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案6]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh6" value="6" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案6]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm6"  value="Y">
        允许 
        <input type="radio" name="sfyxsm6"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%" bgcolor="#FFFFFF">[答案6]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc6" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案7]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh7" value="7" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案7]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm7"  value="Y">
        允许 
        <input type="radio" name="sfyxsm7"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案7]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc7" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案8]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh8" value="8" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案8]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm8"  value="Y">
        允许 
        <input type="radio" name="sfyxsm8"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案8]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc8" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案9]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh9" value="9" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案9]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm9"  value="Y">
        允许 
        <input type="radio" name="sfyxsm9"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[答案9]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc9" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案10]编号</td>
      <td width="34%"> 
        <input type="text" name="dabh10" value="7" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[答案10]允许填写说明</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm10"  value="Y">
        允许 
        <input type="radio" name="sfyxsm10"  value="N" checked>
        不允许 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[答案10]名称</td>
      <td colspan="3"> 
        <input type="text" name="damc10" value="" size="80" maxlength="100" >      </td>
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
	FormName.target=""
	FormName.action="InsertHdm_hfwt.jsp";
	FormName.submit();
	return true;
	
}


function f_do(FormName)
{

	if(	javaTrim(FormName.wtmc)=="") {
		alert("请输入[问题名称]！");
		FormName.wtmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.yxbz)) {
		alert("请选择[有效标志]！");
		FormName.yxbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkdx)) {
		alert("请选择[是否可多选]！");
		FormName.sfkdx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sftxsm)) {
		alert("请选择[是否允许填写说明]！");
		FormName.sftxsm[0].focus();
		return false;
	}

	if (FormName.sfkdx[2].checked)
	{
		if (!FormName.sftxsm[0].checked)
		{
			alert("错误！应选择[允许]！");
			FormName.sftxsm[0].focus();
			return false;
		}
	}
	else{
		if (FormName.sftxsm[0].checked)
		{
			if(	javaTrim(FormName.txsmts)=="") {
				alert("请输入[填写说明提示]！");
				FormName.txsmts.focus();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.txsmts)!="") {
				alert("不能输入[填写说明提示]！");
				FormName.txsmts.select();
				return false;
			}
		}
	}


	
	if (!FormName.sfkdx[2].checked)
	{
		if(javaTrim(FormName.dabh1)=="")
		{
			alert("请输入[[答案1]编号]！");
			FormName.dabh1.focus();
			return false;
		}
		if(	!radioChecked(FormName.sfyxsm1)) {
			alert("请选择[答案1]允许填写说明]！");
			FormName.sfyxsm1[0].focus();
			return false;
		}
		if(javaTrim(FormName.damc1)=="")
		{
			alert("请输入[[答案1]名称]！");
			FormName.damc1.focus();
			return false;
		}
	}
	
	
	
	FormName.target="_blank"
	FormName.action="SaveInsertHdm_hfwt.jsp";
	FormName.submit();
	FormName.bc.disabled="true";
	return true;
	
}

//-->
</SCRIPT>
