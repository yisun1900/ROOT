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
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");

%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">大区签单统计</div>      </td>
    </tr>
    
    <tr> 
      <td align="right" width="30%" height="42">大区</td>
      <td height="42" colspan="3" width="70%">
	  <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm","");
%>
        </select></td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="43">签单时间</td>
      <td height="43" colspan="3" width="70%"> 从 
        <input type="text" name="sjfw" size="11" maxlength="10" value='<%=cf.firstDay(nian,yue)%>' onDblClick="JSCalendar(this)">
        ---->到 
        <input type="text" name="sjfw2" size="11" maxlength="10"  value='<%=cf.lastDay(nian,yue)%>' onDblClick="JSCalendar(this)">      </td>
    </tr>
    
    <tr> 
      <td align="right" width="30%" height="46">显示风格</td>
      <td height="46" colspan="3" width="70%"> 
        <input type="radio" name="xsfg" value="1" checked>
        网页 
        <input type="radio" name="xsfg" value="2">
        EXCEL </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <p>
          <input type="hidden" name="nian" value="<%=nian%>">
          <input type="hidden" name="yue" value="<%=yue%>">
          <input type="button"  value="家装统计" onClick="f_do(selectform)"  name="tj" >
          <input type="reset"  value="重输">
        </p>
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
	if(	javaTrim(FormName.sjfw)=="") {
		alert("请输入[签约时间 ]！");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "签约时间 "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("请输入[签约时间 ]！");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "签约时间 "))) {
		return false;
	}

	FormName.action="DqQdTj.jsp";
	FormName.target="";
	FormName.submit();
	FormName.tj.disabled=true;
	return true;
}


//-->
</SCRIPT>
