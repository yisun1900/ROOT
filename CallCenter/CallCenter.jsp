<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>

<TITLE>呼叫中心</TITLE>

</HEAD>


<BODY>
<div align="center">
  <input name="button" type="button" onClick="window.open('StartTel.jsp','callwin','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no')" value="启动呼叫中心" >
</div>

  

<P><br>
</P>
</BODY>
</HTML>


<SCRIPT LANGUAGE="JavaScript">

/*
	var win =null 
	function MM_openBrWindow(theURL,winName,features) 
	{ //v2.0 
		if(win && win.open && !win.closed) 　　　　　　　　　　　//如果已存在窗口，只需获得焦点
			win.focus() 
		else 
		win = window.open(theURL,winName,features); 　　　　//弹出的窗口命一个名称
	} 

*/

function SetTitle(title)
{
	parent.document.title =title;
}

function StopPlaySound()
{
    PhoneOcx.StopPlaySound();//停止放音
}
</SCRIPT>
