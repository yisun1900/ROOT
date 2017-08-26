<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>设计师统计</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">转化率统计－设计师</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="22%" height="37">选择统计时间</td>
      <td height="37" width="28%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
          <%
	cf.selectToken(out,"2005+2005年&2006+2006年&2007+2007年&2008+2008年&2009+2009年&2010+2010年&2011+2011年&2012+2012年&2013+2013年&2014+2014年&2015+2015年&2016+2016年&2017+2017年&2018+2018年&2019+2019年&2020+2020年&2021+2021年&2022+2022年&2023+2023年",cf.today("YYYY"));
%> 
        </select>
        年 </td>
      <td height="37" colspan="2" width="50%"> 
        <input type="radio" name="yue" value="01">
        一月<br>
        <input type="radio" name="yue" value="02">
        二月<br>
        <input type="radio" name="yue" value="03">
        三月<br>
        <input type="radio" name="yue" value="04">
        四月<br>
        <input type="radio" name="yue" value="05">
        五月<br>
        <input type="radio" name="yue" value="06">
        六月<br>
        <input type="radio" name="yue" value="07">
        七月<br>
        <input type="radio" name="yue" value="08">
        八月<br>
        <input type="radio" name="yue" value="09">
        九月<br>
        <input type="radio" name="yue" value="10">
        十月<br>
        <input type="radio" name="yue" value="11">
        十一月<br>
        <input type="radio" name="yue" value="12">
        十二月</td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="button"  value="继续" onClick="f_do(selectform)">
        <input type="reset"  value="重输">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.nian)=="") {
		alert("请输入[年]！");
		FormName.nian.focus();
		return false;
	}
	if(	!radioChecked(FormName.yue)) {
		alert("请选择[月份]！");
		FormName.yue[0].focus();
		return false;
	}

	FormName.action="EnterZhlSjs.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
