<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String dwbh1=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
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

<form method="post" action="Xz_xzzlkhbCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考核时间从</div>
  </td>
  <td width="35%"> 
    <input type="text" name="xz_xzzlkhb_khsj" size="20" value=<%=cf.firstDayDate()%> maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">到</div>
  </td>
  <td width="35%"> 
  <input type="text" name="xz_xzzlkhb_khsj2" size="20" value=<%=cf.today()%> maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">考核部门</div>
  </td>
  <td width="35%"> 
    <select name="xz_xzzlkhb_khbm" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh1+"'","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">被考核部门&nbsp;</div>
  </td>
  <td width="35%"> 
    <select name="xz_xzzlkhb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dqbm='"+dqbm+"' and dwlx='F2' order by dwbh","");
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
	if(!(isDatetime(FormName.xz_xzzlkhb_khsj, "考核时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xz_xzzlkhb_khsj2, "考核时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
