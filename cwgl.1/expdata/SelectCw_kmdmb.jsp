<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh=(String)session.getAttribute("dwbh");
//where dwbh='"+dwbh+"'
%>


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

<form method="post" action="Cw_kmdmbList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="26%"> 
                <div align="right">科目代码</div>
  </td>
              <td width="26%"> 
                <input type="text" name="cw_kmdmb_kmdm" size="20" maxlength="40" >
  </td>
              <td width="25%"> 
                <div align="right">第一个核算项目所属类别名称</div>
  </td>
              <td width="23%"> 
                <input type="text" name="cw_kmdmb_xmmc1" size="20" maxlength="80" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="26%"> 
                <div align="right">第二个核算项目所属类别名称</div>
  </td>
              <td width="26%"> 
                <input type="text" name="cw_kmdmb_xmmc2" size="20" maxlength="80" >
  </td>
              <td width="25%"> 
                <div align="right">第三个核算项目所属类别名称</div>
  </td>
              <td width="23%"> 
                <input type="text" name="cw_kmdmb_xmmc3" size="20" maxlength="80" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="26%"> 
                <div align="right">第四个核算项目所属类别名称</div>
  </td>
              <td width="26%"> 
                <input type="text" name="cw_kmdmb_xmmc4" size="20" maxlength="80" >
  </td>
              <td width="25%"> 
                <div align="right">使用单位</div>
  </td>
              <td width="23%"> 
                <select name="cw_kmdmb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<!--     <option value=""></option>
 --><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' order by dwbh","");
%>
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

