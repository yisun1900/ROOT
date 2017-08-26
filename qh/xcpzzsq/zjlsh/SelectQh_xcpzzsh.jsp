<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
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

<form method="post" action="Qh_xcpzzshList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<!-- <tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">申请部门</div>
  </td>
  <td width="35%"> 
   <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
<option value=""></option>
 <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
  </td>
  <td width="15%"> 
    <div align="right">填表人</div>
  </td>
  <td width="35%"> 
  <input type="text" name="qh_xcpzzsh_tbr" size="20" maxlength="10" >
  </td>
</tr> -->
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <p align="right">申请时间&nbsp; 从 
  </td>
  <td width="35%"> 
    <input type="text" name="qh_xcpzzsh_sqsj"  value=<%=cf.firstDayDate()%> size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <p align="right">到
  </td>
  <td width="35%"> 
    <input type="text" name="qh_xcpzzsh_sqsj2" size="20" value=<%=cf.today()%> maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <p align="right">审核情况
  </td>
  <td width="35%"> 
    <select size="1" name="shqk" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option selected value="N">未审核</option>
      <option value="Y">已审核</option>
    </select>
  </td>
  <td width="50%" colspan="2"> 
    　
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
	if(!(isDatetime(FormName.qh_xcpzzsh_sqsj, "申请时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.qh_xcpzzsh_sqsj2, "申请时间"))) {
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
