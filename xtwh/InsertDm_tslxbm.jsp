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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入数据</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertDm_tslxbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">投诉报修大类编码</div>
  </td>
              <td width="32%"> 
                <input type="text" name="tslxbm" value="" size="20" maxlength="2" >
  </td>
              <td width="18%"> 
                <div align="right">投诉报修大类名称</div>
  </td>
              <td width="32%"> 
                <input type="text" name="tslxmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">类别</div>
  </td>
              <td width="32%"> 
                <select name="tsdl" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">报修</option>
    <option value="2">投诉</option>
    </select>
  </td>
              <td width="18%"> 
                <div align="right">排序</div>
  </td>
              <td width="32%"> 
                <input type="text" name="px" value="" size="20" maxlength="8" >
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
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
	if(	javaTrim(FormName.tslxbm)=="") {
		alert("请输入[投诉报修大类编码]！");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tslxmc)=="") {
		alert("请输入[投诉报修大类名称]！");
		FormName.tslxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.tsdl)=="") {
		alert("请选择[类别]！");
		FormName.tsdl.focus();
		return false;
	}
	if(!(isNumber(FormName.px, "排序"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
