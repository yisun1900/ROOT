<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />


<html>
<head>
<title>工程服务评价表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {font-family: "隶书"}
-->
</style>
</head>

<body bgcolor="#FFFFFF">

    <table width="100%" border="0" style="FONT-SIZE:68" bgcolor="#999999" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFFFFF">
        <td width="28%"><span lang=EN-US><img src="/images/tubiao111.jpg" v:shapes="_x0000_i1025" width="100"></span></td>
        <td width="72%"><span class="STYLE3">工程服务评价表</span></td>
      </tr>
    </table>

    <table width="100%" border="0" style="FONT-SIZE:48" bgcolor="#999999" cellpadding="0" cellspacing="0">
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">尊敬的客户：</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right">&nbsp;</td>
        <td><span class="STYLE3">&nbsp;&nbsp;&nbsp;&nbsp;您好！衷心感谢您的信任，选择松下亿达</span></td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">家装设计中心为您提供家居装饰装修服务</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">，施工中给您带来的不便，敬请谅解！诚</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">恳地希望您对我们的工作和管理做出评价</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">，提出您的宝贵意见或建议，感谢您的支</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" height="68">
        <td align="right" width="5%">&nbsp;</td>
        <td width="91%"><span class="STYLE3">持！</span></td>
        <td width="4%">&nbsp;</td>
      </tr>
    </table>

</form>
</body>
</html>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


startCall();


var timer=0;
function startCall()
{
	//启用时钟，1秒调用一次函数:doCall()
	timer = setInterval("doCall()",2000); //setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式
}


function doCall()
{
	var dateObj=new Date();
	var ldsj=dateObj.toLocaleTimeString();
	var actionStr="getKhxx.jsp?cmpbh=FBJ01&ldsj="+ldsj;


//	alert(actionStr);

	
//	window.open(actionStr);
	openAjax(actionStr);
}


<%
	//启用Ajax
	cf.ajax(out);
%>


function getAjax(ajaxRetStr) 
{
	//去除前面的换行符
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	if (ajaxRetStr!="")
	{
		document.location="InsertCmp_khpjb.jsp?khbh="+ajaxRetStr;
	}


}

//-->
</SCRIPT>
