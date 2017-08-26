<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>呼叫中心</TITLE>
</HEAD>


<BODY onbeforeunload="closeDeal()"  > 
<div align="center">呼叫中心－－听录音
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td height="52" align="center">放音文件</td>
    <td><input name="playfile" type="text" value="" size="68" maxlength="70" >
      <BR>
      <BR>
	  <input name="cxld" type="button" onClick="window.open('getInRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="查找《来电》录音文件" >
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="cxqd" type="button" onClick="window.open('getOutRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="查找《去电》录音文件" ></td>
  </tr>
  <tr>
    <td width="15%" height="51" align="center">放音</td>
    <td width="85%"><input type="button" value="耳机放音" name="ejfyBt" onClick="ejfy()">
    <input type="button" value="喇叭放音" name="lbfyBt" onClick="lbfy()">
        <input type="button" value="电话放音" name="dhfyBt" onClick="dhfy()" disabled>
        <input type="button" value="停止放音" name="StopPlay" onClick="StopPlaySound()" disabled></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">


function ejfy()
{
	var fileName=playfile.value;

	if (fileName=="")
	{
		alert("错误！文件名为空");
		return;
	}
	else if (parent.menu.isFile(fileName)==false)
	{
		alert("错误！文件不存在");
		return;
	}

	var callMark=parent.menu.callMark;

	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{

		ejfyBt.disabled=true;
		lbfyBt.disabled=true;
		dhfyBt.disabled=true;
		StopPlay.disabled=false;

		cxld.disabled=true;
		cxqd.disabled=true;

		parent.menu.ejfy(fileName);
	}
	else{
		alert("错误！已摘机不许放音");
	}
}
function lbfy()
{

	var fileName=playfile.value;

	if (fileName=="")
	{
		alert("错误！文件名为空");
		return;
	}
	else if (parent.menu.isFile(fileName)==false)
	{
		alert("错误！文件不存在");
		return;
	}

	var callMark=parent.menu.callMark;


	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{

		ejfyBt.disabled=true;
		lbfyBt.disabled=true;
		dhfyBt.disabled=true;
		StopPlay.disabled=false;

		cxld.disabled=true;
		cxqd.disabled=true;

		parent.menu.lbfy(fileName);
	}
	else{
		alert("错误！已摘机不许放音");
	}


}

function dhfy()
{
	var fileName=playfile.value;

	if (fileName=="")
	{
		alert("错误！文件名为空");
		return;
	}
	else if (parent.menu.isFile(fileName)==false)
	{
		alert("错误！文件不存在");
		return;
	}

	var callMark=parent.menu.callMark;

	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		alert("错误！电话接通后才能电话放音");
	}
	else{
		ejfyBt.disabled=true;
		lbfyBt.disabled=true;
		dhfyBt.disabled=true;

		cxld.disabled=true;
		cxqd.disabled=true;


		parent.menu.dhfy(fileName);

		StopPlay.disabled=false;
	}
}


function StopPlaySound()
{
	var callMark=parent.menu.callMark;

	if (callMark==9 || callMark==11)
	{
		StopPlay.disabled=true;

		parent.menu.StopPlaySound();//停止放音

		ejfyBt.disabled=false;
		lbfyBt.disabled=false;

		cxld.disabled=false;
		cxqd.disabled=false;
	}
	else if (callMark==12)
	{
		StopPlay.disabled=true;

		parent.menu.StopPlaySound();//停止放音

		dhfyBt.disabled=false;

		cxld.disabled=false;
		cxqd.disabled=false;
	}
	else
	{
		StopPlay.disabled=true;
		ejfyBt.disabled=false;
		lbfyBt.disabled=false;

		cxld.disabled=false;
		cxqd.disabled=false;
	}

}


function closeDeal()
{
	var callMark=parent.menu.callMark;

	if (callMark==9 || callMark==11)
	{
		parent.menu.StopPlaySound();//停止放音
	}
	else if (callMark==12)
	{
		parent.menu.StopPlaySound();//停止放音
	}
}


</SCRIPT>
