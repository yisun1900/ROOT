<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gyslxr.jsp" name="insertform" target="_blank">
<div align="center">请录入数据</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">供应商</td> 
  <td colspan="3">
  <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
  <option value=""></option>
	<%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx  order by gysmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">联系人姓名</td> 
  <td width="32%"><input type="text" name="lxrxm" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%">是否离职</td> 
  <td width="32%"><select name="sflz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="Y">离职</option>
    <option value="N">在职</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">职务</td>
  <td colspan="3"><input type="text" name="zw" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">手机</td>
  <td colspan="3"><input type="text" name="sj" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">办公电话</td>
  <td colspan="3"><input type="text" name="bgdh" value="" size="73" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">传真</td>
  <td colspan="3"><input type="text" name="cz" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
     <textarea name="bz" cols="71" rows="3"></textarea>      </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("请输入[供应商编码]！");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "供应商编码"))) {
		return false;
	}
	if(	javaTrim(FormName.lxrxm)=="") {
		alert("请输入[联系人姓名]！");
		FormName.lxrxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("请输入[职务]！");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.sflz)=="") {
		alert("请输入[是否离职]！");
		FormName.sflz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
