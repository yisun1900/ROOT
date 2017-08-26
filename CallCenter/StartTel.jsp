<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>呼叫中心</TITLE>
</HEAD>

<BODY  onbeforeunload="return '呼叫中心，请不要随便关闭！'"> 

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
yhdlm="changgh";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String mac="";
String bjhm="";
String yhbm="";
String lywjml="";
String ssfgs="";
String ldzdly="";//来电自动录音
String qdzdly="";//去电自动录音
try {
	conn=cf.getConnection();
	ls_sql="select mac,bjhm,yhbm,ssfgs,lywjml,ldzdly,qdzdly";
	ls_sql+=" from  call_init";
	ls_sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mac=cf.fillNull(rs.getString("mac"));
		bjhm=cf.fillNull(rs.getString("bjhm"));
		yhbm=cf.fillNull(rs.getString("yhbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lywjml=cf.fillNull(rs.getString("lywjml"));
		ldzdly=cf.fillNull(rs.getString("ldzdly"));
		qdzdly=cf.fillNull(rs.getString("qdzdly"));
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


<div align="center">呼叫中心
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td height="34" colspan="2">本机号码『<%=bjhm%>』、录音文件目录『<%=lywjml%>』、员工名称『<%=yhmc%>』</td>
  </tr>
  <tr>
    <td align="center">运行状态</td>
    <td height="34"><input name="callText" type="text" id="callText" size="3" maxlength="5" readonly>
0:电话设备挂机;1:来电待摘机;2:来电摘机;3:来电未接通;4:通话后对方挂机;5:通话后本机挂机;6:电话设备摘机;7:开始录音;8:停止录音;9:开始喇叭放音;11:开始耳机放音;12:开始电话放音;10:停止放音;13:拨号</td>
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
      <input name="jsq" type="text" size="10" maxlength="20" readonly>
      <input type="button" value=查看客户详细信息  onClick="f_khxx()"></td>
  </tr>
  
  <tr>
    <td align="center">客户信息
      <input name="khbh" type="hidden" size="20" >
    <input name="xh" type="hidden" size="20" ></td>
    <td  ><table width="100%" border="0">
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
      <tr >
        <td >
			投诉报修记录号:<input type="text" name="tsjlh" readonly size="12" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td colspan="3" >
			投诉报修时间:
			  <input type="text" name="tsbxsj" readonly size="12" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
			  <input type="button"  onClick="window.open('/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh='+tsjlh.value)" value=查看投诉>		</td>
        </tr>
      <tr  >
        <td colspan="4" id="tsnr">&nbsp;</td>
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
    <td height="37">
		<input type="button" value="开始录音" name="RecBt" onClick="StartReadSoundCStrF()" disabled>
        <input type="button" value="停止录音" name="StopRecBt" onClick="StopReadSound()" disabled>
      <BR>
	  录音文件：
      <input name="filename" type="text" value="<%=lywjml%>" size="50" maxlength="50" readonly></td>
  </tr>
  <tr>
    <td align="center">放音</td>
    <td><input type="button" value="耳机放音" name="ejfyBt" onClick="ejfy()">
    <input type="button" value="喇叭放音" name="lbfyBt" onClick="lbfy()">
        <input type="button" value="电话放音" name="dhfyBt" onClick="dhfy()" disabled>
        <input type="button" value="停止放音" name="StopPlay" onClick="StopPlaySound()" disabled>
       <BR>
      放音文件：
      <input name="playfile" type="text" value="" size="50" maxlength="50" >
      <input type="button" value="查找录音文件" onClick="window.open('getRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" ></td>
  </tr>
  <tr>
    <td align="center">拨号</td>
    <td height="34"> 呼叫号码：
      <input name="outnum" type="text" value="" size="20" maxlength="20">
      <input type="button" value="拨号" name="DialBT" onClick="DialNmb()" >
      <input name="button" type="button" onClick="window.open('cxkh.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="查找客户" ></td>
  </tr>
  <tr>
    <td align="center">摘/挂机</td>
    <td height="34"><input type="button" value="摘机" name="zjBT" onClick="zjHMBT()" disabled>
        <input type="button" value="挂机" name="gjBT" onClick="gjHMBT()" disabled></td>
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

var ldzdly="<%=ldzdly%>";//来电自动录音
var qdzdly="<%=qdzdly%>";//去电自动录音


//获取来电客户信息，并显示
function getKhxx(inTelNum)
{
	var dateObj=new Date();

	var ldsj=dateObj.toLocaleTimeString();
//	alert(ldsj);
	var actionStr="getKhxx.jsp?inTelNum="+inTelNum+"&bjhm=<%=bjhm%>&ldsj="+ldsj+"&lywjml=<%=java.net.URLEncoder.encode(lywjml,"UTF-8")%>";

	czlx="1";
	
//	window.open(actionStr);
	openAjax(actionStr);

}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (czlx=="1")
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

		var khxxArr=ajaxRetStr.split("+");

		xh.value=khxxArr[0];
		khbh.value=khxxArr[1];

		khxm.value=khxxArr[2]+khxxArr[7];
		fwdz.value=khxxArr[3];
		sjs.value=khxxArr[4];
		zjxm.value=khxxArr[5];
		sgd.value=khxxArr[6];

		window.document.title ="来电:"+khxm.value+"－"+innum.value;
		opener.SetTitle("来电:"+khxm.value+"－"+innum.value);

//		alert("来电:"+khxm.value+"－"+innum.value);

		if (khxxArr[8]!="")
		{
			tsjlh.value=khxxArr[8];
			tsbxsj.value=khxxArr[9];

			document.getElementById('tsnr').innerHTML="";
			txtNode=document.createTextNode("投诉报修内容:"+khxxArr[10]);
			document.getElementById('tsnr').appendChild(txtNode);
		}
		else{
			tsjlh.value="";
			tsbxsj.value="";

			document.getElementById('tsnr').innerHTML="";
			txtNode=document.createTextNode("");
			document.getElementById('tsnr').appendChild(txtNode);
		}

		filename.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+"in-"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+khxxArr[7]+".wav";
		playfile.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+"in-"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+khxxArr[7]+".wav";
	}
	else if (czlx=="2")
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

		var khxxArr=ajaxRetStr.split("+");

		xh.value=khxxArr[0];
		khbh.value=khxxArr[1];

		khxm.value=khxxArr[2]+khxxArr[7];
		fwdz.value=khxxArr[3];
		sjs.value=khxxArr[4];
		zjxm.value=khxxArr[5];
		sgd.value=khxxArr[6];

		window.document.title ="去电:"+khxm.value+"－"+innum.value;
		opener.SetTitle("去电:"+khxm.value+"－"+innum.value);

		if (khxxArr[8]!="")
		{
			tsjlh.value=khxxArr[8];
			tsbxsj.value=khxxArr[9];

			document.getElementById('tsnr').innerHTML="";
			txtNode=document.createTextNode("投诉报修内容:"+khxxArr[10]);
			document.getElementById('tsnr').appendChild(txtNode);
		}
		else{
			tsjlh.value="";
			tsbxsj.value="";

			document.getElementById('tsnr').innerHTML="";
			txtNode=document.createTextNode("");
			document.getElementById('tsnr').appendChild(txtNode);
		}


		filename.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+"out-"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+khxxArr[7]+".wav";
		playfile.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+"out-"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+khxxArr[7]+".wav";
		
		if (qdzdly=="Y")//Y：自动录音：N：手动录音
		{
			StartReadSoundCStrF();
		}
	}

}

function initCall()
{
//	document.execCommand('Refresh')  ;
	window.location.reload(); 

//	alert("请拔掉USB线，重插完成初始化");
}


//启动监听进程
startCall();


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
		//启用时钟，1秒调用一次函数:doCall()
		timer = setInterval("doCall()",200); //setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式
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


//读取电话号码
var cs=0;
var callMark=0;//0:本机挂机;1:来电未摘机;2:来电摘机;3:来电未接听;4:来电接听后对方结束;5:来电接听后本机结束;6:本机摘机;7:开始录音;8:停止录音;;9:开始放音;10:停止放音
function doCall()
{
	cs++;
	jsq.value=cs;


	callText.value=callMark;
	if (PhoneOcx.CheckCallStatus()==1)//=0：没有有效来电号码；=1：有有效来电号码
	{
//		zjBT.disabled=true;
//		gjBT.disabled=true;

		RecBt.disabled=true;

		ejfyBt.disabled=true;
		lbfyBt.disabled=true;
		dhfyBt.disabled=true;

		DialBT.disabled=true;

		var inTelNum="";
		inTelNum=PhoneOcx.ReadstrCallNmb();//读来电号码
		innum.value=inTelNum;

//		window.opener.focus();
		self.focus();

		//获取来电客户信息，并显示
		getKhxx(inTelNum);


		if (callMark==9 || callMark==11 || callMark==12)//9:开始放音
		{
			StopPlaySound();//停止放音
		}
		else if (callMark==7)//7:开始录音
		{
			StopReadSound();//停止录音
			gjHM();//挂机
		}



		callMark=1;//1：来电未摘机

		var zt=PhoneOcx.CheckPutDown();
		if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
		{
			zjHM();//摘机
			callMark=2;//2：来电摘机
			if (ldzdly=="Y")//Y：自动录音：N：手动录音
			{
				StartReadSoundCStrF();
			}
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
			RecBt.disabled=true;
			ejfyBt.disabled=false;
			lbfyBt.disabled=false;
			dhfyBt.disabled=true;
//			zjBT.disabled=false;

			DialBT.disabled=false;

			innum.value="";
			var zt=PhoneOcx.CheckPutDown();
			if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				zjHMBT();//摘机
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

				if (ldzdly=="Y")//Y：自动录音：N：手动录音
				{
					StartReadSoundCStrF();
				}
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
			RecBt.disabled=false;

			ejfyBt.disabled=true;
			lbfyBt.disabled=true;
			dhfyBt.disabled=false;
//			zjBT.disabled=true;

			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHM();//挂机
				callMark=5;//5:来电接听后本机结束
			}
/*
			zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
			if (zt==1)//本次来电结束
			{
				gjHM();//挂机
				callMark=4;//4:通话后对方挂机
			}
*/
		}
		else if (callMark==3 || callMark==4 || callMark==5)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			RecBt.disabled=true;
			ejfyBt.disabled=false;
			lbfyBt.disabled=false;
			dhfyBt.disabled=true;
//			zjBT.disabled=false;
//			gjBT.disabled=true;

			DialBT.disabled=false;

			innum.value="";
			khxm.value="";
			fwdz.value="";
			sjs.value="";
			zjxm.value="";
			sgd.value="";
			tsjlh.value="";
			tsbxsj.value="";

			var zt=PhoneOcx.CheckPutDown();

			if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				zjHM();//摘机
				callMark=6;//6:本机摘机
			}
		}
		else if (callMark==6)//6:本机摘机
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHMBT();//挂机
				callMark=0;//0:本机挂机
			}
/*
			zt=PhoneOcx.ReadPhoneStatus();
			if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				callMark=100;//0:本机挂机
			}
*/
		}
		else if (callMark==7)//7:开始录音
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				StopReadSound();//停止录音
				gjHM();//挂机
				callMark=5;//5:来电接听后本机结束
			}

/*
			zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
			if (zt==1)//本次来电结束
			{
				StopReadSound();//停止录音
				gjHM();//挂机
				callMark=4;//4:通话后对方挂机
			}
*/
		}
		else if (callMark==8)//8:停止录音
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHM();//挂机
				callMark=5;//5:来电接听后本机结束
			}
/*
			zt=PhoneOcx.CheckCanNextCallIn();//当最后一个振铃经过nextCallDelay后，系统认为本次交换机来电过程结束
			if (zt==1)//本次来电结束
			{
				gjHM();//挂机
				callMark=4;//4:通话后对方挂机
			}
*/
		}
		else if (callMark==9 || callMark==11)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			var zt=PhoneOcx.GetWriteSoundRate();
			if (zt>=1000)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				StopPlaySound();//停止放音
			}
		}
		else if (callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			RecBt.disabled=true;
			ejfyBt.disabled=false;
			lbfyBt.disabled=false;
			dhfyBt.disabled=true;
//			zjBT.disabled=false;

			innum.value="";
			var zt=PhoneOcx.CheckPutDown();

			if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				zjHM();//摘机
				callMark=6;//6:本机摘机
			}
		}
		else if (callMark==12)//12:开始电话放音
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				StopPlaySound();//停止放音

				gjHM();//挂机
				callMark=5;//5:来电接听后本机结束
			}
			var zt=PhoneOcx.GetWriteSoundRate();
			if (zt>=1000)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				StopPlaySound();//停止放音
			}
		}
		else if (callMark==13)//13:拨号
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
			{
				gjHMBT();//挂机
				callMark=0;//0:设备挂机
			}
		}
	}
}

//读来电号码
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

function f_khxx()
{
	window.open("ViewCrm_khxx.jsp?khbh="+khbh.value);
}




//开始录音
function StartReadSoundCStrF()
{
	if (callMark==9 || callMark==11 || callMark==12)//9:开始放音
	{
		alert("错误！开始放音，不能录音");
		return;
	}
	else if (callMark==2 || callMark==8)//2:来电摘机
	{
		if (filename.value=="")
		{
			alert("错误！录音文件名称不存在");
			return;
		}

		
		var actionStr="SaveRecFile.jsp?xh="+xh.value+"&lywj="+filename.value;

		czlx="3";

	//	window.open(actionStr);
		openAjax(actionStr);

		var ret=PhoneOcx.StartReadSoundCStrF(filename.value);//开始录音
		callMark=7;//7:开始录音

		RecBt.disabled=true;
		StopRecBt.disabled=false;
	}
	else if (callMark==13)//13:拨号
	{
		var actionStr="SaveDialRecFile.jsp?xh="+xh.value+"&lywj="+filename.value;

		czlx="4";

	//	window.open(actionStr);
		openAjax(actionStr);

		if (filename.value=="")
		{
			alert("错误！录音文件名称不存在");
			return;
		}

		var ret=PhoneOcx.StartReadSoundCStrF(filename.value);//开始录音
		callMark=7;//7:开始录音

		RecBt.disabled=true;
		StopRecBt.disabled=false;
	}
	else{
		alert("错误！电话未接通，不能录音");
	}
}

//停止录音
function StopReadSound()
{
//	alert("停止录音:"+callMark);
	if (callMark==7)//7:开始录音
	{
		var ret=PhoneOcx.StopReadSound();//停止录音
		callMark=8;//8:停止录音

		StopRecBt.disabled=true;
	}
		
}


function ejfy()
{
	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		var fileName=playfile.value;

		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("错误！文件【"+fileName+"】不存在");
		}
		else{
			ejfyBt.disabled=true;
			lbfyBt.disabled=true;
			dhfyBt.disabled=true;
			StopPlay.disabled=false;

			callMark=11;//11:开始耳机放音

			PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 2, 2, 0);//耳机放音
		}
	}
	else{
		alert("错误！已摘机不许放音");
	}
}
function lbfy()
{
	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		var fileName=playfile.value;

		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("错误！文件【"+fileName+"】不存在");
		}
		else{
			ejfyBt.disabled=true;
			lbfyBt.disabled=true;
			dhfyBt.disabled=true;
			StopPlay.disabled=false;

			callMark=9;//9:开始喇叭放音
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 1, 2, 0);//喇叭放音
		}
	}
	else{
		alert("错误！已摘机不许放音");
	}

}

function dhfy()
{
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
		var fileName=playfile.value;

		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("错误！文件【"+fileName+"】不存在");
		}
		else{
			ejfyBt.disabled=true;
			lbfyBt.disabled=true;
			dhfyBt.disabled=true;

			callMark=12;//12:开始电话放音
			PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 0, 2, 0);//电话放音

			StopPlay.disabled=false;
		}
	}
}
function StopPlaySound()
{
	if (callMark==9 || callMark==11)
	{
		StopPlay.disabled=true;

		callMark=10;//10:停止放音
		PhoneOcx.StopPlaySound();//停止放音

		ejfyBt.disabled=false;
		lbfyBt.disabled=false;
	}
	else if (callMark==12)
	{
		StopPlay.disabled=true;

		callMark=2;//2:来电摘机
		PhoneOcx.StopPlaySound();//停止放音

		dhfyBt.disabled=false;
	}

}


//摘机
function zjHM()
{
	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		PhoneOcx.PickUp();//HM摘机
	}
	else{
		alert("错误！未挂机，不能摘机");
		return;
	}
}

//挂机
function gjHM()
{
	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		alert("错误！未摘机，不能挂机");
	}
	else{
		PhoneOcx.PutDown();//HM挂机
	}
}


//摘机
function zjHMBT()
{
	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
//		zjBT.disabled=true;

		zjHM();
		callMark=6;//6:设备摘机

//		gjBT.disabled=false;
		DialBT.disabled=false;
	}
	else{
		alert("错误！未挂机，不能摘机");
		return;
	}
}

//挂机
function gjHMBT()
{
	if (callMark==6 || callMark==13)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
//		gjBT.disabled=true;

		gjHM();
		callMark=0//0:设备挂机

//		zjBT.disabled=false;
	}
	else{
		alert("错误！不能挂机");
		return;
	}
}


//拨号
function DialNmb()
{
	if (outnum.value=="")
	{
		alert("错误！请输入呼叫号码");
		outnum.select();
		return;
	}
	else{
		if (callMark!=6 )//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			alert("错误！未摘机");
			return;
		}
		DialBT.disabled=true;

		callMark=13;//13:拨号


		PhoneOcx.DialNmbCStr(outnum.value);//拨号

		DialBT.disabled=false;
		RecBt.disabled=false;

		//获取来电客户信息，并显示
		dialXX(outnum.value);

	}

}


//获取来电客户信息，并显示
function dialXX(outTelNum)
{
	var dateObj=new Date();

	var ldsj=dateObj.toLocaleTimeString();
//	alert(ldsj);
	var actionStr="dialXX.jsp?outTelNum="+outTelNum+"&bjhm=<%=bjhm%>&ldsj="+ldsj+"&lywjml=<%=java.net.URLEncoder.encode(lywjml,"UTF-8")%>";

	czlx="2";
	
//	window.open(actionStr);
	openAjax(actionStr);

}

</SCRIPT>
