<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 客户分类查询</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="41%"> 
                <div align="right">分公司</div>
              </td>
              <td width="59%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right">店面</td>
              <td width="59%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
//		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right">统计时间</td>
              <td width="59%">从 
                <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay()%>' onDblClick="JSCalendar(this)">
                ----&gt; 到 
                <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay()%>' onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%"> 
                <div align="right">客户分类</div>
              </td>
              <td width="59%"> 
                <input type="radio" name="khfl" value="01">
                新登记咨询客户（未签单）<BR>
                <input type="radio" name="khfl" value="03">
                交订金客户（未签单）<BR>
                <input type="radio" name="khfl" value="05">
                量房客户（未签单）<BR>
                <input type="radio" name="khfl" value="07">
                出图客户（未签单）<BR>
                <input type="radio" name="khfl" value="09">
                做报价客户（未签单）<BR>
                <input type="radio" name="khfl" value="11">
                签单客户（签单）<BR>
                <input type="radio" name="khfl" value="13">
                开工客户（签单）<BR>
                <input type="radio" name="khfl" value="15">
                完工客户（签单）<BR>
                <input type="radio" name="khfl" value="17">
                保修客户（售后）<BR>
                <input type="radio" name="khfl" value="19">
                过保客户（售后） </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="41%" align="right">显示风格</td>
              <td width="59%"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL &nbsp;&nbsp;&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="41%" align="right">每页显示数量</td>
              <td width="59%">
                <input type="text" name="myxssl" size="7" maxlength="13" value="30">
              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围"))) {
		return false;
	}
	if(	!radioChecked(FormName.khfl)) {
		alert("请选择[客户分类]！");
		FormName.khfl[0].focus();
		return false;
	}

	if (FormName.khfl[0].checked)
	{
		FormName.action="Crm_zxkhxxTypeNewList.jsp"
	}
	else if (FormName.khfl[1].checked)
	{
		FormName.action="Crm_zxkhxxTypeDjList.jsp"
	}
	else if (FormName.khfl[2].checked)
	{
		FormName.action="Crm_zxkhxxTypeLfList.jsp"
	}
	else if (FormName.khfl[3].checked)
	{
		FormName.action="Crm_zxkhxxTypeCtList.jsp"
	}
	else if (FormName.khfl[4].checked)
	{
		FormName.action="Crm_zxkhxxTypeBjList.jsp"
	}
	else if (FormName.khfl[5].checked)
	{
		FormName.action="Crm_khxxTypeQdList.jsp"
	}
	else if (FormName.khfl[6].checked)
	{
		FormName.action="Crm_khxxTypeKgList.jsp"
	}
	else if (FormName.khfl[7].checked)
	{
		FormName.action="Crm_khxxTypeWgList.jsp"
	}
	else if (FormName.khfl[8].checked)
	{
		FormName.action="Crm_khxxTypeBxList.jsp"
	}
	else if (FormName.khfl[9].checked)
	{
		FormName.action="Crm_khxxTypeGbList.jsp"
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
