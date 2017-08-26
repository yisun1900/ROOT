<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>优铂利家装ERP</title>
<style type="text/css">
.3dfont { FILTER: glow(color=ffffff,strength=5) shadow(color=cccccc,direction:120); POSITION: relative; WIDTH: 100% } 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=6">


<link rel="stylesheet" href="/css/default.css">

<style type="text/css">
<!--
.style1 {color: #D6D3CE}
-->
</style>
</head>  

 <%
 String macString = cf.fillNull(request.getParameter("mac")); 
 macString=cf.makejm(macString);
 macString=java.net.URLEncoder.encode(macString,"UTF-8");
 
 %>

<body bgcolor="#999999" onload="loginform.yhdlm.focus();"   >
<form  name="loginform" method="post" action="login.jsp">
  <table width="100%" border="0">
    <tr>
      <td height="71"> <span class="style1"></span>        <div align="center">
          <p>&nbsp;</p>
          <p>&nbsp;</p>
         <p>&nbsp;</p>
       	<p>&nbsp;</p>
          <p>&nbsp;</p>
          <table width="1920" height="1080" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="1920" height="1080" background="c.jpg">
                <div align="center"></div>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<table width="32%" border="1" align="center" cellspacing="0" bordercolor="#FFFFFF" >
                <tr>
                  <td width="43%"><div align="center"><strong>用户名：</strong></div></td>
                  <td width="57%"><input type="text" name=yhdlm size=18  value="" maxlength="16"  onKeyup="nextFocus(this.name)">
                  </td>
                </tr>
                <tr>
                  <td width="43%"><div align="center"><strong>密 码：</strong></div></td>
                  <td width="57%"><input type="password" name=yhkl size=18 value="" maxlength="50" onKeyup="nextFocus(this.name)">
                  </td>
                </tr>
                <tr>
                  <td width="43%" align="right">
				  
					<input TYPE="hidden" name="macAddr" value="<%=macString %>" >
				  <input type="button"  name=login value=" 登陆 " onClick="submit_onclick()">
                    </td>
                  <td width="57%">&nbsp;</td>
                </tr>
              </table>
              <div align="center"></div></td>
            </tr>
          </table>
       
          <p><font size="6"><b> </b></font></p>
          <p><b></b></p>
</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="./js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function submit_onclick()//参数FormName:Form的名称
{
	if(	loginform.yhdlm.value=="") {
		alert("请输入[用户名]！");
		loginform.yhdlm.focus();
		return false;
	}
	if(	loginform.yhkl.value=="") {
		alert("请输入[密 码]！");
		loginform.yhkl.focus();
		return false;
	}
   
	loginform.submit();
	return true;
}
function nextFocus(itemname)
{
	if (event.keyCode==13)
	{
		if (itemname=="yhdlm"){
			if(	loginform.yhdlm.value=="") {
				alert("请输入[用户名]！");
				loginform.yhdlm.focus();
				return false;
			}
			else{
				loginform.yhkl.focus();
			}
		}
		else if(itemname=="yhkl"){
			submit_onclick();
		}
	}
}
//-->
</SCRIPT>

