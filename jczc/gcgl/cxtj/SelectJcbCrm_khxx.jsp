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
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请输入统计条件</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">分公司</td>
              <td width="32%"> 
                <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(fgs,dwbh,<%=dwstr%>)">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
                </select>
              </td>
              <td width="15%" align="right">签约店面</td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
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
              <td width="18%"> 
                <div align="right">统计日期 从</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tjrq" size="20" maxlength="10" value="<%=cf.firstDay()%>" onKeyUp="keyGo(tjrq2)">
              </td>
              <td width="15%"> 
                <div align="right">到 </div>
              </td>
              <td width="35%"> 
                <input type="text" name="tjrq2" size="20" maxlength="10" value="<%=cf.today()%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">显示风格</td>
              <td colspan="3"> 
                <input type="radio" name="xsfg" value="1" checked>
                网页 
                <input type="radio" name="xsfg" value="2">
                EXCEL </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="统计表" onClick="f_do(selectform)">
                <input type="button"  value="工程进度跟踪" onClick="f_do1(selectform)" name="button">
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
	if(	javaTrim(FormName.tjrq)=="") {
		alert("请选择[统计日期]！");
		FormName.tjrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq, "统计日期"))) {
		return false;
	}
	if(	javaTrim(FormName.tjrq2)=="") {
		alert("请选择[统计日期]！");
		FormName.tjrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq2, "统计日期"))) {
		return false;
	}

	FormName.action="Crm_khxxJcb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tjrq)=="") {
		alert("请选择[统计日期]！");
		FormName.tjrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq, "统计日期"))) {
		return false;
	}
	if(	javaTrim(FormName.tjrq2)=="") {
		alert("请选择[统计日期]！");
		FormName.tjrq2.focus();
		return false;
	}
	if(!(isDatetime(FormName.tjrq2, "统计日期"))) {
		return false;
	}

	FormName.action="ViewGcjdmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
