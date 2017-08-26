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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入查询条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_khxxCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">客户编号</div>
  </td>
              <td width="33%"> 
                <input type="text" name="khbh" size="20" maxlength="7" >
  </td>
              <td width="16%"> 
                <div align="right">客户姓名</div>
  </td>
              <td width="34%"> 
                <input type="text" name="khxm" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">房屋地址</div>
  </td>
              <td width="33%"> 
                <input type="text" name="fwdz" size="20" maxlength="100" >
  </td>
              <td width="16%"> 
                <div align="right">联系方式</div>
  </td>
              <td width="34%"> 
                <input type="text" name="lxfs" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">设计师</div>
  </td>
              <td width="33%"> 
                <input type="text" name="sjs" size="20" maxlength="20" >
  </td>
              <td width="16%"> 
                <div align="right">施工队</div>
  </td>
              <td width="34%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">质检姓名</div>
  </td>
              <td width="33%"> 
                <input type="text" name="zjxm" size="20" maxlength="20" >
  </td>
              <td width="16%"> 
                <div align="right">回访类型</div>
  </td>
              <td width="34%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%> 
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="17%"> 
                <div align="right">回访日期 从</div>
  </td>
              <td width="33%"> 
                <input type="text" name="hfrq" size="20" maxlength="10" >
              </td>
              <td width="16%"> 
                <div align="right">到</div>
  </td>
              <td width="34%"> 
                <input type="text" name="hfrq2" size="20" maxlength="10" value="<%=cf.today()%>">
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
	if(!(isDatetime(FormName.hfrq, "回访日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.hfrq2, "回访日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
