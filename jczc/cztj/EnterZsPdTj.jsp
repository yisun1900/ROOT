<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">施工队接单统计－直属</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">分公司</td>
      <td width="58%" height="39"> 
        <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
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
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">派单时间 从</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="<%=cf.firstDay()%>" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">到</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.lastDay()%>" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">显示风格</td>
      <td width="58%" height="37"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  value="施工队接单统计" onClick="f_pdje(selectform,'sgd')">
        <input type="button"  value="班长接单统计" onClick="f_pdje(selectform,'sgbz')" >
		<P>
        <input type="button"  value="施工队接单统计-按月" onClick="f_pdje(selectform,'sgd1')">
        <input type="button"  value="班长接单统计-按月" onClick="f_pdje(selectform,'sgbz1')" >
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
function f_pdje(FormName,lx)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "时间范围 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[时间范围 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "时间范围 "))) {
		return false;
	}

	if (lx=="sgd")
	{
		FormName.action="PdZsTjb.jsp";
	}
	else if (lx=="sgbz")
	{
		FormName.action="BzPdZsTjb.jsp";
	}
	else if (lx=="sgd1")
	{
		FormName.action="PdZsTjbYue.jsp";
	}
	else if (lx=="sgbz1")
	{
		FormName.action="BzPdZsTjbYue.jsp";
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
