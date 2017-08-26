<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveInsertCw_kmdmb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="25%"> 
                <div align="right">科目代码</div>
  </td>
              <td width="26%"> 
                <input type="text" name="kmdm" value="" size="20" maxlength="40" >
  </td>
              <td width="24%"> 
                <div align="right">第一个核算项目所属类别名称
</div>
  </td>
              <td width="25%"> 
                <input type="text" name="xmmc1" value="" size="20" maxlength="80" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="25%"> 
                <div align="right">第二个核算项目所属类别名称
</div>
  </td>
              <td width="26%"> 
                <input type="text" name="xmmc2" value="" size="20" maxlength="80" >
  </td>
              <td width="24%"> 
                <div align="right">第三个核算项目所属类别名称
</div>
  </td>
              <td width="25%"> 
                <input type="text" name="xmmc3" value="" size="20" maxlength="80" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="25%"> 
                <div align="right">第四个核算项目所属类别名称
</div>
  </td>
              <td width="26%"> 
                <input type="text" name="xmmc4" value="" size="20" maxlength="80" >
  </td>
              <td width="24%"> 
                <div align="right">使用单位</div>
  </td>
              <td width="25%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<!--     <option value=""></option>
 --><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
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
	if(	javaTrim(FormName.kmdm)=="") {
		alert("请输入[科目代码]！");
		FormName.kmdm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmmc1)=="") {
		alert("请输入[项目名称1]！");
		FormName.xmmc1.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[使用单位]！");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

