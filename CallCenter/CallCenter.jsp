<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>

<TITLE>��������</TITLE>

</HEAD>


<BODY>
<div align="center">
  <input name="button" type="button" onClick="window.open('StartTel.jsp','callwin','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no')" value="������������" >
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
		if(win && win.open && !win.closed) ����������������������//����Ѵ��ڴ��ڣ�ֻ���ý���
			win.focus() 
		else 
		win = window.open(theURL,winName,features); ��������//�����Ĵ�����һ������
	} 

*/

function SetTitle(title)
{
	parent.document.title =title;
}

function StopPlaySound()
{
    PhoneOcx.StopPlaySound();//ֹͣ����
}
</SCRIPT>
