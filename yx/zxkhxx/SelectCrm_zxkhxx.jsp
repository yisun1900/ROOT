<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String dwlx=(String)session.getAttribute("dwlx");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
//where dwbh='"+dwbh+"'
//where dqbm='"+dqbm+"'
//and (dwlx='F1'  or dwlx='F2')
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

<form method="post" action="Crm_zxkhxxCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">量房时间从</div>
  </td>
  <td width="35%"> 
  <input type="text" name="crm_zxkhxx_lfsj" size="20" value=<%=cf.firstDayDate()%>  maxlength="10" >
  </td>
  <td width="15%"> 
    <p align="right">到
  </td>
  <td width="35%"> 
    <input type="text" name="crm_zxkhxx_lfsj2" size="20"  value=<%=cf.today()%> maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">咨询店面</div>
  </td>
  <td width="35%"> 
    <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">

<%
 String kb="";
 if (yhjs.equals("A0"))
{ 
	
    out.print("\n <OPTION  value=\""+kb+"\">"+kb+"</OPTION>");	
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ( dwlx='F2') order by dwbh","");
 }
 else if (yhjs.equals("F0")||yhjs.equals("F1"))
{ 
	
    out.print("\n <OPTION  value=\""+kb+"\">"+kb+"</OPTION>");	
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwlx='F2') and dqbm='"+dqbm+" order by dwbh'","");
 }
 else
 {

	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
 }
 %>
 </select>
  </td>
              <td width="15%">
                <div align="right">业务员</div>
              </td>
              <td width="35%"> 
                <input type="text" name="crm_zxkhxx_ywy" size="20" maxlength="10" >
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
	if(!(isDatetime(FormName.crm_zxkhxx_lfsj, "量房时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhxx_lfsj2, "量房时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
