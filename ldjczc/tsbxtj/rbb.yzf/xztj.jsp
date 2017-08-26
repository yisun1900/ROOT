<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>日报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14">
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">投诉报修日报表</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">客户分公司</td>
      <td width="58%" height="39"> 
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> 
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">录入部门</td>
      <td width="58%" height="39"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
		  <option value=""></option>
<%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N'  order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">录入时间 从</td>
      <td width="58%" height="39"> 
        <input type="text" name="lrsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">到</td>
      <td width="58%" height="40"> 
        <input type="text" name="lrsj2" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr>
      <td align="right" width="42%" height="40">是否结案</td>
      <td width="58%" height="40">
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <option value="2">未结案</option>
          <option value="3">已结案</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">显示风格</td>
      <td width="58%" height="40"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  value="投诉报修记录" onClick="f_xzts(selectform)">
        <input type="button"  value="投诉报修回访记录" onClick="f_xzhf(selectform)">
        <input type="button"  value="未结案投诉报修报表" onClick="f_new(selectform)" >
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
function f_xzts(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间 ]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间 "))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("请输入[录入时间 ]！");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 "))) {
		return false;
	}

	FormName.action="Crm_tsjlCxList.jsp";
	FormName.submit();
	return true;
}

function f_xzhf(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间 ]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间 "))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("请输入[录入时间 ]！");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 "))) {
		return false;
	}

	FormName.action="Crm_tshfjlCxList.jsp";
	FormName.submit();
	return true;
}

function f_new(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间 ]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间 "))) {
		return false;
	}
	if(	javaTrim(FormName.lrsj2)=="") {
		alert("请输入[录入时间 ]！");
		FormName.lrsj2.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "录入时间 "))) {
		return false;
	}

	FormName.action="TsbxCxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
