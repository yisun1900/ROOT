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

<form method="post" action="Xz_pcsqShList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr>
  <td width="15%" bgcolor="#FFFFFF"> 
    <div align="right">申请日期从</div>
  </td>
  <td width="35%" bgcolor="#FFFFFF"> 
  <input type="text" name="xz_pcsq_sqrq" size="20" value=<%=cf.firstDayDate()%> maxlength="10" >
  </td>
  <td width="15%" bgcolor="#FFFFFF"> 
    <div align="right">到</div>
  </td>
  <td width="35%" bgcolor="#FFFFFF"> 
  <input type="text" name="xz_pcsq_sqrq2" size="20" value=<%=cf.today()%>  maxlength="10" >
  </td>
</tr>
<tr>
  <td width="15%" bgcolor="#FFFFFF"> 
    <p align="right">用车时间从
  </td>
  <td width="35%" bgcolor="#FFFFFF"> 
  <input type="text" name="xz_pcsq_ycsj" size="20" value=<%=cf.firstDayDate()%>&nbsp;<%="00:00"%> maxlength="20" >
  </td> 
  <td width="15%" bgcolor="#FFFFFF"> 
    <p align="right">到
  </td>
  <td width="35%" bgcolor="#FFFFFF"> 
  <input type="text" name="xz_pcsq_ycsj2" size="20" value=<%=cf.today()%>&nbsp;<%="24:00"%>   maxlength="16" >
  </td>
</tr>
<tr>
  <td width="15%" bgcolor="#FFFFFF"> 
    <p align="right">是否已审核
  </td>
  <td width="35%" bgcolor="#FFFFFF"> 
  <select size="1" name="SFYSH" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option selected value="N">否</option>
    <option value="Y">是</option>
  </select>
  </td> 
  <td width="15%" bgcolor="#FFFFFF"> 
    　
  </td>
  <td width="35%" bgcolor="#FFFFFF"> 
  　
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
	if(!(isDatetime(FormName.xz_pcsq_sqrq, "申请日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_pcsq_sqrq2, "申请日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
