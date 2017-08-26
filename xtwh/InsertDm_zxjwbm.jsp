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

<form method="post" action="" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">装修价位编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zxjwbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">装修价位名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zxjwmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">起点</div>
  </td>
  <td width="35%"> 
    <input type="text" name="qd" value="" size="20" maxlength="17" >
  </td>
  <td width="15%"> 
    <div align="right">终点</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zd" value="" size="20" maxlength="17" >
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
				  &nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="button" type="button" onClick="f_gx(insertform)"  value="更新『装修价位』信息">
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
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("请输入[装修价位编码]！");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwmc)=="") {
		alert("请输入[装修价位名称]！");
		FormName.zxjwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.qd)=="") {
		alert("请输入[起点]！");
		FormName.qd.focus();
		return false;
	}
	if(!(isFloat(FormName.qd, "起点"))) {
		return false;
	}
	if(	javaTrim(FormName.zd)=="") {
		alert("请输入[终点]！");
		FormName.zd.focus();
		return false;
	}
	if(!(isFloat(FormName.zd, "终点"))) {
		return false;
	}

	FormName.action="SaveInsertDm_zxjwbm.jsp";
	FormName.submit();
	return true;
}

function f_gx(FormName)//参数FormName:Form的名称
{
	if ( confirm("确实要继续吗?") )	
	{
		FormName.action="UpdateKhxxZxjwbm.jsp";
		FormName.submit();
		return true;
	}

}
//-->
</SCRIPT>
