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

<form method="post" action="SaveInsertJdm_ppbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">品牌编码</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ppbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">品牌名称</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ppmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">生产厂家</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by zclb,gysmc","");
%>
    </select>
  </td>
  <td width="15%"> 
                <div align="right">主材类别</div>
  </td>
  <td width="35%">
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm  order by zcdlbm","");
%> 
                </select>
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
	if(	javaTrim(FormName.ppbm)=="") {
		alert("请输入[品牌编码]！");
		FormName.ppbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请输入[品牌名称]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[生产厂家]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zclb)=="") {
		alert("请选择[主材类别]！");
		FormName.zclb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
