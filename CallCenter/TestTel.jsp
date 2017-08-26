<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>

<TITLE></TITLE>

</HEAD>

<BODY>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td width="9%" align="center">启动系统</td>
    <td height="34">
		<input name="initCallButton"  type="button" onClick="initCall()" value="系统重新初始化">
		<input name="startCallButton" type="button" onClick="startCall()" value="点击启动系统"></td>
  </tr>
  <tr>
    <td width="9%" rowspan="3" align="center">拨号过程</td>
    <td height="34">
	<input type="button" value="摘机" onClick="zj()">
    <input type="button" value="挂机" onClick="gj()"></td>
  </tr>
  <tr>
    <td height="34"><input id=DialNmb type=button value=拨号码 name=DialNmb onClick="DialNmb()">
      
呼叫号码：
<input name="telnum" type="text" value="13601167422" size="20" maxlength="20"></td>
  </tr>
  <tr>
    <td width="91%" height="27"> 这两个按钮过程，您也可以在一个中实现，但是，按钮要使用复选方式(请参见VB_API中的VB_API.exe程序) </td>
  </tr>
  <tr>
    <td rowspan="2" align="center">录音过程</td>
    <td height="37"><input id=StartReadSoundCStrF type=button value=开始录音 name=StartReadSoundCStrF onClick="StartReadSoundCStrF()">
      <input id=StopReadSound type=button value=停止录音 name=StopReadSound onClick="StopReadSound()">
录音文件：
<input name="filename" type="text" value="C:\tomcat\webapps\ROOT\CallCenter\aaa.wav" size="50" maxlength="50"></td>
  </tr>
  <tr>
    <td height="44">您需要指定录音保存路径，默认路径为：C:\PhoneOcx.wav。
<br>
将摘机、拨号、录音、停止录音和挂机组合使用时，请参见VB_API中的VB_API.exe程序的ButtonDial_Click()拨号过程。</td>
  </tr>
  <tr>
    <td align="center">读/写适配器状态</td>
    <td><input id=GetTelStatus type=button value=读状态 name=GetTelStatus onClick="GetTelStatus()">
      <input id=SetTelStatus type=button value=写状态 name=SetTelStatus onClick="SetTelStatus()"></td>
  </tr>
  <tr>
    <td rowspan="2" align="center">读来电号码</td>
    <td><input type="button" value="读来电号码" onClick="ReadstrCallNmb()">
来电号码：
  <input name="callnum" type="text" size="20" maxlength="20">
  <input name="button" type="button" onClick="ldjs()" value="来电是否结束">
  <input name="button2" type="button" onClick="zgj()" value="判断摘/挂机状态"></td>
  </tr>
  <tr>
    <td> 来电号码的自动读取，请参见VB_API中的VB_API.exe程序的TelTimer_Timer()过程。 </td>
  </tr>
  <tr>
    <td rowspan="2" align="center">放音</td>
    <td>
		<input type="button" value="耳机放音" onClick="ejfy()">
		<input type="button" value="喇叭放音" onClick="lbfy()">
		<input type="button" value="电话放音" onClick="dhfy()">
		<input type="button" value="停止放音" onClick="StopPlaySound()">
		放音文件：<input name="playfile" type="text"value="d:\tomcat\webapps\ROOT\CallCenter\aaa.wav" size="50" maxlength="50">    </td>
  </tr>
  <tr>
    <td>首先，您将本目录下的"leaveword.wav"文件，拷贝到C:根目录下<br>
之后，您再按"放音"按键，这时您会听到电话的放音+交换机送来的拨号音！这是正常现象。当您拨通一个电话后，该拨号音就不存在了，此时在电话放音，您才会听到正常的电话放音。 </td>
  </tr>
</table>
  
    <OBJECT 
     classid=clsid:780A40C6-C224-11DA-AD88-0080C75D8B26
     width="0" 
     height="0" 
     id=PhoneOcx>
    </OBJECT>
  

<P>&nbsp;</P>
</BODY>
</HTML>


<SCRIPT LANGUAGE="JavaScript">

function zj()
{
	PhoneOcx.PickUp();//摘机
}

function gj()
{
     PhoneOcx.PutDown();//HM挂机
}

function DialNmb()
{
	if (PhoneOcx.CheckPutDown()==1)
	{
		PhoneOcx.TelSleep(400);//延时函数
		PhoneOcx.DialNmbCStr(telnum.value);//拨号
	}
	else{
		alert("错误！请摘机");
	}
}
function StartReadSoundCStrF()
{
     PhoneOcx.StartReadSoundCStrF(filename.value);//开始录音
}
function StopReadSound()
{
     PhoneOcx.StopReadSound();//停止录音
}
function GetTelStatus()
{
     PhoneOcx.GetTelStatus();//读接入器状态
}
function SetTelStatus()
{
     PhoneOcx.SetTelStatus(200 * 256);//设置接入器状态
}

function ReadstrCallNmb()
{
	if (PhoneOcx.CheckCallStatus()==1)//=0：没有有效来电号码；=1：有有效来电号码
	{
		var num="";
		num=PhoneOcx.ReadstrCallNmb();//读来电号码
		callnum.value=num;
		window.open("ViewCrm_khxx.jsp?lxfs="+num);
	}
	else
	{
		alert("没有来电：");
	}
}

function initCall()
{
	alert("请拔掉USB线，重插完成初始化");
}

function getNum()
{
//		alert("没有来电：");

	if (PhoneOcx.CheckCallStatus()==1)//=0：没有有效来电号码；=1：有有效来电号码
	{
		var num="";
		num=PhoneOcx.ReadstrCallNmb();//读来电号码
		callnum.value=num;
		window.open("ViewCrm_khxx.jsp?lxfs="+num);
	}

}

var timer=0;
function startCall()
{
	if (startCallButton.value=="点击启动系统")
	{
		var timer = setTimeout("getNum",1000);
		if (timer!=0)
		{
			startCallButton.value='系统已启动......《点击停止系统》';
		}
	}
	else{
	//	clearTimeout(timer);
		clearInterval(timer);
		startCallButton.value='点击启动系统';
	}
}


function ldjs()
{
     if (PhoneOcx.CheckCanNextCallIn()==1)//判断本次来电是否结束: 0：本次来电未结束；=1：本次来电结束
     {
		 alert("来电结束");
     }
	 else{
		 alert("来电未结束");
	 }

}

function zgj()
{
     if (PhoneOcx.CheckPutDown()==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
     {
		 alert("已经摘机");
     }
	 else{
		 alert("挂机");
	 }

}
function ejfy()
{
	if (PhoneOcx.CheckWavFileExist(playfile.value)==1)
	{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 2, 2, 0);//耳机放音
	}
	else{
		alert("错误！文件【"+playfile.value+"】不存在");
	}
}
function lbfy()
{
	if (PhoneOcx.CheckWavFileExist(playfile.value)==1)
	{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 1, 2, 0);//喇叭放音
	}
	else{
		alert("错误！文件【"+playfile.value+"】不存在");
	}


}
function dhfy()
{
	if (PhoneOcx.CheckWavFileExist(playfile.value)==1)
	{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 0, 2, 0);//电话放音
	}
	else{
		alert("错误！文件【"+playfile.value+"】不存在");
	}

}
function StopPlaySound()
{
    PhoneOcx.StopPlaySound();//停止放音
}
</SCRIPT>
