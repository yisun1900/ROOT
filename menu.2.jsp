<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>优铂利家装管理信息系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK HREF='/js/menu.css' REL='stylesheet' TYPE='text/css'>
</head>
<%
String kkbbz=(String)session.getAttribute("kkbbz");
String yhdlm=(String)session.getAttribute("yhdlm");
//out.println(yhdlm);


String mac="";
String bjhm="";
String yhbm="";
String lywjml="";
String ssfgs="";
String ldzdly="";//来电自动录音
String qdzdly="";//去电自动录音

%>

<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5 >
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
else{
	%>
	<BODY CLASS='nav' TEXT="#333333" LINK="#003399" VLINK="#003399" ALINK="#cc9900" LEFTMARGIN=3 TOPMARGIN=5 oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>

<SCRIPT SRC="/js/menu.js"></SCRIPT>
<SCRIPT SRC="/js/menu_functions.js"></SCRIPT>

<script>
foldersTree = gFld('<img src=\'/images/iLocalMachine.gif\' alt="点击进行重新登陆" onclick=parent.location=\'index.html\'> <A HREF=\"#\" onclick=parent.location=\'index.html\'>家装管理信息系统</A>|iGeneric', '');
<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //得到连接

	
	
	int count=0;
	sql="select cdbh,cdxsmc,glurl,fcdbh,sfmjcd,cdsm,cdxh";
	sql+=" from v_sqxx";
	sql+=" where  yhdlm='"+yhdlm+"'";
	sql+="  order by cdbh,cdxh";
//	out.println(sql);
	ps=conn.prepareStatement(sql);
	rs=ps.executeQuery();
	String cdbh=null;
	String cdxsmc=null;
	String glurl=null;
	String fcdbh=null;
	String sfmjcd=null;
	String cdsm=null;
	int cdxh=0;
	String fatherName=null;
	String thisName=null;
	while (rs.next())
	{
		cdbh=rs.getString("cdbh");
		cdxsmc=rs.getString("cdxsmc");
		glurl=rs.getString("glurl");
		fcdbh=rs.getString("fcdbh").trim();
		sfmjcd=rs.getString("sfmjcd");
		cdsm=rs.getString("cdsm");
		cdxh=rs.getInt("cdxh");

		count++;

		thisName="cdbh"+cdbh;
		if (fcdbh.equals("0"))
		{
			fatherName="foldersTree";
		}
		else{
			fatherName="cdbh"+fcdbh;
		}
		if (sfmjcd.equals("Y"))
		{
			out.println("insDoc("+fatherName+", gLnk(2, \""
								 +cdxsmc+"\", \""
								 +glurl+"?www.youboli.com="+cf.makejm(cdbh,yhdlm)+"\"));");
		}
		else{
			out.println(thisName+" = insFld("+fatherName
			                    +", gFld(\"<B>"+cdxsmc+"</B>\", \"\"));");
		}
	}

	rs.close();
	ps.close();
	if (count==0)
	{
		out.println("alert('错误！您没有任何授权，请联系【系统管理员】进行授权')");
	}


	sql="select mac,bjhm,yhbm,ssfgs,lywjml,ldzdly,qdzdly";
	sql+=" from  call_init";
	sql+=" where yhdlm='"+yhdlm+"'";
	ps= conn.prepareStatement(sql);
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
catch(Exception e){
	out.println("Exception:"+e);
	return;
}
finally{
	if (rs!=null) rs.close();
	if (ps!=null) ps.close();
	if (conn != null) cf.close(conn); 
}
%>			
</SCRIPT>

<script language="JavaScript">
	parent.main.location="content.jsp";
	initializeDocument()
</SCRIPT>
<br><br>

</body>
</html>


<%
if (!yhbm.equals(""))
{
	/*
	0:电话设备挂机;
	1:来电待摘机;
	2:来电摘机;
	3:来电未接通;
	4:通话后对方挂机;
	5:通话后本机挂机;
	6:电话设备摘机;
	7:开始录音
	8:停止录音;
	9:开始喇叭放音;
	11:开始耳机放音;
	12:开始电话放音;
	10:停止放音;
	13:拨号
	*/

	%>
	<OBJECT 
	 classid=clsid:780A40C6-C224-11DA-AD88-0080C75D8B26
	 width="0" 
	 height="0" 
	 id=PhoneOcx>
	</OBJECT>

	<input name="innum" type="hidden"  >
	<input name="filename" type="hidden"  >
	<input name="xh" type="hidden"  >



	<SCRIPT LANGUAGE="JavaScript">

	var subWin = null; 
	  
	<%
		//启用Ajax
		cf.ajax(out);
	%>

	var czlx="";
	var lylx="2";//录音类型，1：来电录音；2：去电录音

	var ldzdly="<%=ldzdly%>";//来电自动录音
	var qdzdly="<%=qdzdly%>";//去电自动录音


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


		PhoneOcx.PickUp();//HM摘机
		PhoneOcx.PutDown();//HM挂机


		//启用时钟，1秒调用一次函数:doCall()
		timer = setInterval("doCall()",200); //setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式
		if (timer!=0)
		{
			parent.document.title ="呼叫中心已启动......";
		}

	}


	//读取电话号码
	var callMark=0;//0:本机挂机;1:来电未摘机;2:来电摘机;3:来电未接听;4:来电接听后对方结束;5:来电接听后本机结束;6:本机摘机;7:开始录音;8:停止录音;;9:开始放音;10:停止放音
	function doCall()
	{
		if (innum.value=="")
		{
			parent.document.title="呼叫中心状态:"+callMark;
		}
		else{
//			parent.document.title="来电:"+innum.value+"－呼叫中心状态:"+callMark;
		}

		if (PhoneOcx.CheckCallStatus()==1)//=0：没有有效来电号码；=1：有有效来电号码
		{
			var inTelNum="";
			inTelNum=PhoneOcx.ReadstrCallNmb();//读来电号码
			innum.value=inTelNum;

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
					StartReadSoundCStrF(xh.value,filename.value);
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

					//登记接通状态
					var actionStr="/CallCenter/SaveLdJtzt.jsp?xh="+xh.value;
					czlx="5";
				//	window.open(actionStr);
					openAjax(actionStr);

					if (ldzdly=="Y")//Y：自动录音：N：手动录音
					{
						StartReadSoundCStrF(xh.value,filename.value);
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
				innum.value="";

				var zt=PhoneOcx.CheckPutDown();

				if (zt==1)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
				{
					zjHM();//摘机
					callMark=6;//6:本机摘机
				}

				//自动关闭打开窗口
				if (subWin != null && subWin.open)
				{
					subWin.close();
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
			else if (callMark==9 || callMark==11)//9:开始喇叭放音;11:开始耳机放音;
			{
				var zt=PhoneOcx.GetWriteSoundRate();
				parent.document.title="呼叫中心状态:"+callMark+"－－放音进度:"+zt/10+"%";
				if (zt>=1000)//判断外接普通电话摘/挂机状态： 0：已经挂机；1：已经摘机结束
				{
					StopPlaySound();//停止放音
				}
			}
			else if (callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
			{
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
					gjHM();//挂机
					callMark=0;//0:设备挂机
				}
			}
		}
	}



//获取来电客户信息，并显示
function getKhxx(inTelNum)
{
	var dateObj=new Date();

	var ldsj=dateObj.toLocaleTimeString();
//	alert(ldsj);
	var actionStr="/CallCenter/getKhxm.jsp?inTelNum="+inTelNum+"&bjhm=<%=bjhm%>&ldsj="+ldsj+"&lywjml=<%=java.net.URLEncoder.encode(lywjml,"UTF-8")%>";

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
		filename.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+"in-"+khxxArr[0]+"-"+khxxArr[1]+"-"+khxxArr[2]+".wav";
/*
		khbh.value=khxxArr[1];

		khxm.value=khxxArr[2]+khxxArr[7];
		fwdz.value=khxxArr[3];
		sjs.value=khxxArr[4];
		zjxm.value=khxxArr[5];
		sgd.value=khxxArr[6];
*/
		parent.document.title="【"+khxxArr[2]+"】来电:"+innum.value+"、【房屋地址】"+khxxArr[3]+"－呼叫中心状态:"+callMark;

		//先关闭打开窗口
		if (subWin != null && subWin.open)
		{
			subWin.close();
		}
		subWin=window.open("/CallCenter/inCall.jsp?xh="+khxxArr[0],'callwin','height=400,width=600,top=90,left=200,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no');
	}

}


//开始录音
function StartReadSoundCStrF(xh,filename)
{
	if (callMark==9 || callMark==11 || callMark==12)//9:开始放音
	{
		alert("错误！开始放音，不能录音");
		return;
	}
	else if (callMark==2 || callMark==8)//2:来电摘机  ，来电录音
	{
		if (filename=="")
		{
			alert("错误！录音文件名称不存在");
			return;
		}

		var ret=PhoneOcx.StartReadSoundCStrF(filename);//开始录音
		callMark=7;//7:开始录音
	}
	else if (callMark==13)//13:拨号  ，去电录音
	{

		var actionStr="SaveDialRecFile.jsp?xh="+xh+"&lywj="+filename;

		czlx="4";

		window.open(actionStr);
		openAjax(actionStr);

		if (filename=="")
		{
			alert("错误！录音文件名称不存在");
			return;
		}

		var ret=PhoneOcx.StartReadSoundCStrF(filename);//开始录音
		callMark=7;//7:开始录音
	}
	else{
		alert("错误！电话未接通，不能录音");
	}
}

//停止录音
function StopReadSound()
{
	if (callMark==7)//7:开始录音
	{
		var ret=PhoneOcx.StopReadSound();//停止录音
		callMark=8;//8:停止录音
	}
		
}


function ejfy(fileName)
{
	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("错误！文件【"+fileName+"】不存在");
		}
		else{
			callMark=11;//11:开始耳机放音
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 2, 2, 0);//耳机放音
		}
	}
	else{
		alert("错误！已摘机不许放音");
	}
}


function lbfy(fileName)
{
	if (callMark==7)//7:开始录音
	{
		alert("错误！开始录音，不能放音");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("错误！文件【"+fileName+"】不存在");
		}
		else{
			callMark=9;//9:开始喇叭放音
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 1, 2, 0);//喇叭放音
		}
	}
	else{
		alert("错误！已摘机不许放音");
	}

}

function dhfy(fileName)
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
		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("错误！文件【"+fileName+"】不存在");
		}
		else{
			callMark=12;//12:开始电话放音
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 0, 2, 0);//电话放音
		}
	}
}
function StopPlaySound()
{
	if (callMark==9 || callMark==11)
	{
		callMark=10;//10:停止放音
		PhoneOcx.StopPlaySound();//停止放音
	}
	else if (callMark==12)
	{
		callMark=2;//2:来电摘机
		PhoneOcx.StopPlaySound();//停止放音
	}

}


function isFile(fileName)
{
	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		return false;
	}
	else{
		return true;
	}
}

//摘机
function zjHM()
{
	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
	{
		PhoneOcx.PickUp();//HM摘机
		callMark=6;//6:设备摘机
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
		callMark=0//0:设备挂机
	}
}



//拨号
function DialNmb(outnum)
{
	if (outnum=="")
	{
		alert("错误！请输入呼叫号码");
		return;
	}
	else{
		if (callMark!=6 )//3:来电未接通;4:通话后对方挂机;5:通话后本机挂机
		{
			alert("错误！未摘机");
			return;
		}

		callMark=13;//13:拨号


//		PhoneOcx.DialNmbCStr(outnum);//拨号

		//获取来电客户信息，并显示
//		dialXX(outnum);
		var dateObj=new Date();

		var ldsj=dateObj.toLocaleTimeString();
	//	alert(ldsj);
		var actionStr="outRec.jsp?outTelNum="+outnum+"&bjhm=<%=bjhm%>&ldsj="+ldsj+"&lywjml=<%=java.net.URLEncoder.encode(lywjml,"UTF-8")%>";

		czlx="12";
		
		window.open(actionStr);
		openAjax(actionStr);

	}

}


	//获取来电客户信息，并显示
	function dialXX(outnum)
	{
		var dateObj=new Date();

		var ldsj=dateObj.toLocaleTimeString();
	//	alert(ldsj);
		var actionStr="outRec.jsp?outTelNum="+outnum+"&bjhm=<%=bjhm%>&ldsj="+ldsj+"&lywjml=<%=java.net.URLEncoder.encode(lywjml,"UTF-8")%>";

		czlx="12";
		
	//	window.open(actionStr);
		openAjax(actionStr);

	}



	</SCRIPT>
	<%
}
%>

