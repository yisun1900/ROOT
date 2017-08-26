<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <div align="center">材料统计</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">分公司</td>
      <td width="30%"><%
		if (yhjs.equals("A0") || yhjs.equals("A1"))
		{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
			out.println("        </select>");
		}
		else{
			out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
			out.println("        </select>");
		}
		%></td>
      <td align="right" width="17%">工程状态</td>
      <td width="33%"> 
        <input type="radio" name="sfwj" value="5" checked>
         已完结
        <input type="radio" name="sfwj" value="4">
        已完工 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%">统计时间 从</td>
      <td width="30%"> 
        <input type="text" name="sjwjrq" size="20" value="<%=cf.firstDay()%>" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">到</td>
      <td width="33%"> 
        <input type="text" name="sjwjrq2" size="20" value="<%=cf.lastDay()%>" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="20%" >显示风格</td>
      <td colspan="3" > 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL &nbsp;&nbsp;&nbsp;每页显示数量 
        <input type="text" name="myxssl" size="7" maxlength="13" value="100">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="材料用量统计" onClick="f_do(selectform)" name="button2">
        <input type="button"  value="客户统计" onClick="f_kh(selectform)" name="button">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjwjrq)=="") {
		alert("请选择[客户完结时间]！");
		FormName.sjwjrq.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "客户完结时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjwjrq2)=="") {
		alert("请选择[客户完结时间]！");
		FormName.sjwjrq2.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "客户完结时间"))) {
		return false;
	}

	FormName.action="clfxList.jsp";
	FormName.submit();
	return true;
}

function f_kh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.fgs)=="") {
		alert("请选择[分公司]！");
		FormName.fgs.select();
		return false;
	}
	if(	javaTrim(FormName.sjwjrq)=="") {
		alert("请选择[客户完结时间]！");
		FormName.sjwjrq.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq, "客户完结时间"))) {
		return false;
	}
	if(	javaTrim(FormName.sjwjrq2)=="") {
		alert("请选择[客户完结时间]！");
		FormName.sjwjrq2.select();
		return false;
	}
	if(!(isDatetime(FormName.sjwjrq2, "客户完结时间"))) {
		return false;
	}

	FormName.action="clfxKhList.jsp";

	FormName.submit();
	return true;
}

//-->
</SCRIPT>

