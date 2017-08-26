<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>

<TITLE>呼叫中心</TITLE>

</HEAD>

<%
String yhmc=(String)session.getAttribute("yhmc");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String mac="";
String bjhm="";
String yhbm="";
String lywjml="";
String ssfgs="";
try {
	conn=cf.getConnection();
	ls_sql="select mac,bjhm,yhbm,ssfgs,lywjml";
	ls_sql+=" from  call_init";
//	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mac=cf.fillNull(rs.getString("mac"));
		bjhm=cf.fillNull(rs.getString("bjhm"));
		yhbm=cf.fillNull(rs.getString("yhbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lywjml=cf.fillNull(rs.getString("lywjml"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<BODY>
<div align="center">呼叫中心
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td height="34" colspan="2">本机号码『<%=bjhm%>』、录音文件目录『<%=lywjml%>』、员工名称『<%=yhmc%>』</td>
  </tr>
  <tr>
    <td align="center">运行状态</td>
    <td height="34"><input name="callText" type="text" id="callText" size="3" maxlength="5" readonly>
0:本机挂机;1:来电待摘机;2:来电摘机;3:来电未接通;4:通话后对方挂机;5:通话后本机挂机;6:本机摘机;7:开始录音;8:停止录音</td>
  </tr>
  <tr>
    <td width="12%" align="center">启动系统</td>
    <td width="88%" height="34">
		<input name="initCallButton"  type="button" onClick="initCall()" value="系统重新初始化">
		<input name="startCallButton" type="button" onClick="startCall()" value="点击启动系统"></td>
  </tr>
  <tr>
    <td align="center">来电号码</td>
    <td><input name="innum" type="text" size="20" maxlength="20">
    <input type="button" value=查看客户详细信息  onClick="f_khxx()"></td>
  </tr>
  
  <tr>
    <td align="center">来电客户
    <input name="khbh" type="hidden" size="20" >
    <input name="xh" type="hidden" size="20" ></td>
    <td height="17"><table width="100%" border="0">
      <tr>
        <td width="37%" >姓名:
			<input type="text" name="khxm" readonly size="24" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td width="21%" >质检:
			<input type="text" name="zjxm" readonly size="10" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td width="21%" >设计师:
			<input type="text" name="sjs" readonly size="10" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td width="21%" >施工队:
			<input type="text" name="sgd" readonly size="10" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
      </tr>
      <tr>
        <td colspan="4" >房屋地址:
          <input type="text" name="fwdz" readonly  size="41" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td align="center"> 来电类型</td>
    <td height="37"><%
			cf.radioItem(out,"select ldlxbm,ldlxmc from dm_ldlxbm order by ldlxbm","ldlxbm","");
		%>    </td>
  </tr>
  <tr>
    <td align="center">录音</td>
    <td height="37"><input id="StartReadSoundCStrF" type="button" value="开始录音" name="StartReadSoundCStrF" onClick="StartReadSoundCStrF()">
        <input id="StopReadSound" type="button" value="停止录音" name="StopReadSound" onClick="StopReadSound()">
      <BR>
	  录音文件：
      <input name="filename" type="text" value="<%=lywjml%>" size="50" maxlength="50" readonly></td>
  </tr>
  <tr>
    <td align="center">放音</td>
    <td><input type="button" value="耳机放音" onClick="ejfy()">
        <input type="button" value="喇叭放音" onClick="lbfy()">
        <input type="button" value="电话放音" onClick="dhfy()">
        <input type="button" value="停止放音" onClick="StopPlaySound()">
       <BR>
      放音文件：
      <input name="playfile" type="text" value="<%=lywjml%>\aaa.wav" size="50" maxlength="50">
      <input type="button" value="查找录音文件" onClick="window.open('getRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" ></td>
  </tr>
  <tr>
    <td align="center">拨号</td>
    <td height="34"> 呼叫号码：
      <input name="outnum" type="text" size="20" maxlength="20">
        <input id=DialNmb type=button value=拨号 name=DialNmb onClick="DialNmb()">
        <input name="button" type="button" onClick="window.open('cxkh.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="查找客户" ></td>
  </tr>
  <tr>
    <td align="center">摘/挂机</td>
    <td height="34"><input type="button" value="摘机" onClick="zjHM()">
        <input type="button" value="挂机" onClick="gjHM()"></td>
  </tr>
</table>
  
<OBJECT 
 classid=clsid:780A40C6-C224-11DA-AD88-0080C75D8B26
 width="0" 
 height="0" 
 id=PhoneOcx>
</OBJECT>
  

<P><br>
</P>
</BODY>
</HTML>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">

  
<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx="";
var lylx="2";//录音类型，1：来电录音；2：去电录音


//获取来电客户信息，并显示
function doCall(inTelNum)
{
	var actionStr="doCall.jsp?inTelNum="+inTelNum+"&bjhm=<%=bjhm%>&lywjml=<%=java.net.URLEncoder.encode(lywjml,"UTF-8")%>";

	czlx="1";
	
//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (czlx!="1")
	{
		return;
	}

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

	var khxxArr=ajaxRetStr.split("+");

	xh.value=khxxArr[0];
	khbh.value=khxxArr[1];

	khxm.value=khxxArr[2];
	fwdz.value=khxxArr[3];
	sjs.value=khxxArr[4];
	zjxm.value=khxxArr[5];
	sgd.value=khxxArr[6];

/*
	document.getElementById('khxm').innerHTML="";
	txtNode=document.createTextNode("姓名:"+);
	document.getElementById('khxm').appendChild(txtNode);
*/

	filename.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+".wav";
	playfile.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+".wav";
}

startCall();

//开始录音
function StartReadSoundCStrF()
{
	if (callMark==2 || callMark==8)//2:来电摘机
	{
		var actionStr="SaveRecFile.jsp?xh="+xh.value+"&lywj="+filename.value;

		czlx="2";

	//	window.open(actionStr);
		openAjax(actionStr);

		var ret=PhoneOcx.StartReadSoundCStrF(filename.value);//开始录音
		callMark=7;//7:开始录音
	}
}

function StopReadSound()
{
	if (callMark==7)//7:开始录音
	{
		var ret=PhoneOcx.StopReadSound();//停止录音
		callMark=8;//8:停止录音
	}
		
}


function ReadstrCallNmb()
{
	try
	{
		if (PhoneOcx.CheckCallStatus()==1)//=0：没有有效来电号码；=1：有有效来电号码
		{
			var num="";
			num=PhoneOcx.ReadstrCallNmb();//读来电号码
			innum.value=num;
			window.open("ViewCrm_khxx.jsp?lxfs="+num);
		}
		else
		{
			alert("没有来电：");
		}
	}
	catch (kuku)
	{
		alert(kuku);
	}

}

function initCall()
{
//	document.execCommand('Refresh')  ;
	window.location.reload(); 

//	alert("请拔掉USB线，重插完成初始化");
}

function zjHM()
{
	PhoneOcx.PickUp();//HM摘机
}

function gjHM()
{
     PhoneOcx.PutDown();//HM挂机
}

//拨号
function DialNmb()
{
	PhoneOcx.PickUp();//摘机
	PhoneOcx.TelSleep(400);//延时函数
	PhoneOcx.DialNmbCStr(outnum.value);//拨号

	var state=PhoneOcx.CheckPutDown();//判断外接普通电话摘/挂机状态 0：已经挂机；1：已经摘机束
	alert(state);
}




//读取电话号码
var cs=0;
var callMark=0;//0:本机挂机;1:来电未摘机;2:来电摘机;3:来电未接听;4:来电接听后对方结束;5:来电接听后本机结束;6:本机摘机;7:开始录音;8:停止录音
function getNum()
{
	cs++;
	innum.value=cs;
	callText.value=callMark;
 	if (PhoneOcx.CheckCallStatus()==1)//=0：没有有效来电号码；=1：有有效来电号码
	{
		var inTelNum="";
		inTelNum=PhoneOcx.ReadstrCallNmb();//读来电号码
		innum.value=inTelNum;


		//获取来电客户信息，并显示
		doCall(inTelNum);

		callMark=1;//1：来电未摘机



		var zt=PhoneOcx.CheckPutDown();

		if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
		{
			zjHM();//摘机
			callMark=2;//2：来电摘机
		}

		zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
		if (zt==1)//本次来电结束
		{
			callMark=3;//3：来电未接听
		}
	}
	else{
		if (callMark==0)//0:本机挂机
		{
			var zt=PhoneOcx.CheckPutDown();

			if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				zjHM();//摘机
				callMark=6;//6:本机摘机
			}
		}
		else if (callMark==1)//1：来电未摘机
		{
			var zt=PhoneOcx.CheckPutDown();

			if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				zjHM();//摘机
				callMark=2;//2：来电摘机
			}
			else{
				zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
				if (zt==1)//本次来电结束
				{
					callMark=3;//3：来电未接听
				}
			}
		}
		else if (callMark==2)//2:来电摘机
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHM();//挂机
				callMark=5;//5:来电接听后本机结束
			}

			zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
			if (zt==1)//本次来电结束
			{
				gjHM();//挂机
				callMark=4;//4:来电接听后对方结束
			}

		}
		else if (callMark==6)//6:本机摘机
		{
			var zt=PhoneOcx.CheckPutDown();

			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHM();//挂机
				callMark=0;//0:本机挂机
			}
		}
		else if (callMark==7)//7:开始录音
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				StopReadSound();//停止录音
				gjHM();//挂机
			}
			zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
			if (zt==1)//本次来电结束
			{
				StopReadSound();//停止录音
				gjHM();//挂机
			}
		}
		else if (callMark==8)//8:停止录音
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHM();//挂机
				callMark=5;//5:来电接听后本机结束
			}

			zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
			if (zt==1)//本次来电结束
			{
				gjHM();//挂机
				callMark=4;//4:来电接听后对方结束
			}
		}
	}

}

function f_khxx()
{
	window.open("ViewCrm_khxx.jsp?khbh="+khbh.value);
}

var timer=0;
function startCall()
{
	var yhID=PhoneOcx.ReadCustomerID();

	if (yhID!="<%=yhbm%>")
	{
		alert("错误！未授权");
		return;
	}

	innum.value="";
	filename.value="";
	playfile.value="";


	if (startCallButton.value=="点击启动系统")
	{
		//启用时钟，1秒调用一次函数:getNum()
		timer = setInterval("getNum()",400); //setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式
		if (timer!=0)
		{
			startCallButton.value='系统已启动......《点击停止系统》';
		}
	}
	else{
		//清除时钟
		clearInterval(timer);
		startCallButton.value='点击启动系统';
	}
}

//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
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
	var zt=PhoneOcx.CheckPutDown();

	if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
	{
		alert("电话已经摘机");
	}
	else if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
	{
		alert("电话挂机");
	}

}
function ejfy()
{
	var fileName=playfile.value;

	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		alert("错误！文件【"+fileName+"】不存在");
	}
	else{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 2, 2, 0);//耳机放音
	}
}
function lbfy()
{
	var fileName=playfile.value;

	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		alert("错误！文件【"+fileName+"】不存在");
	}
	else{
		PhoneOcx.StartPlaySoundCStr(fileName, 0, 1, 2, 0);//喇叭放音
	}

}
function dhfy()
{
	var fileName=playfile.value;

	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		alert("错误！文件【"+fileName+"】不存在");
	}
	else{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 0, 2, 0);//电话放音
	}
}
function StopPlaySound()
{
    PhoneOcx.StopPlaySound();//停止放音
}
</SCRIPT>
