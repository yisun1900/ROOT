<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<html>
<head>
<title>�Ų�����װ������Ϣϵͳ</title>
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
String ldzdly="";//�����Զ�¼��
String qdzdly="";//ȥ���Զ�¼��

%>

<%
if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
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
foldersTree = gFld('<img src=\'/images/iLocalMachine.gif\' alt="����������µ�½" onclick=parent.location=\'index.html\'> <A HREF=\"#\" onclick=parent.location=\'index.html\'>��װ������Ϣϵͳ</A>|iGeneric', '');
<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
String sql=null;
try {
	conn=cf.getConnection();   //�õ�����

	
	
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
		out.println("alert('������û���κ���Ȩ������ϵ��ϵͳ����Ա��������Ȩ')");
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
	0:�绰�豸�һ�;
	1:�����ժ��;
	2:����ժ��;
	3:����δ��ͨ;
	4:ͨ����Է��һ�;
	5:ͨ���󱾻��һ�;
	6:�绰�豸ժ��;
	7:��ʼ¼��
	8:ֹͣ¼��;
	9:��ʼ���ȷ���;
	11:��ʼ��������;
	12:��ʼ�绰����;
	10:ֹͣ����;
	13:����
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
		//����Ajax
		cf.ajax(out);
	%>

	var czlx="";
	var lylx="2";//¼�����ͣ�1������¼����2��ȥ��¼��

	var ldzdly="<%=ldzdly%>";//�����Զ�¼��
	var qdzdly="<%=qdzdly%>";//ȥ���Զ�¼��


	//������������
	startCall();


	var timer=0;
	function startCall()
	{
		var yhID=PhoneOcx.ReadCustomerID();

		if (yhID!="<%=yhbm%>")
		{
			alert("����δ��Ȩ");
			return;
		}


		PhoneOcx.PickUp();//HMժ��
		PhoneOcx.PutDown();//HM�һ�


		//����ʱ�ӣ�1�����һ�κ���:doCall()
		timer = setInterval("doCall()",200); //setInterval() �����ɰ���ָ�������ڣ��Ժ���ƣ������ú����������ʽ
		if (timer!=0)
		{
			parent.document.title ="��������������......";
		}

	}


	//��ȡ�绰����
	var callMark=0;//0:�����һ�;1:����δժ��;2:����ժ��;3:����δ����;4:���������Է�����;5:��������󱾻�����;6:����ժ��;7:��ʼ¼��;8:ֹͣ¼��;;9:��ʼ����;10:ֹͣ����
	function doCall()
	{
		if (innum.value=="")
		{
			parent.document.title="��������״̬:"+callMark;
		}
		else{
//			parent.document.title="����:"+innum.value+"����������״̬:"+callMark;
		}

		if (PhoneOcx.CheckCallStatus()==1)//=0��û����Ч������룻=1������Ч�������
		{
			var inTelNum="";
			inTelNum=PhoneOcx.ReadstrCallNmb();//���������
			innum.value=inTelNum;

			//��ȡ����ͻ���Ϣ������ʾ
			getKhxx(inTelNum);


			if (callMark==9 || callMark==11 || callMark==12)//9:��ʼ����
			{
				StopPlaySound();//ֹͣ����
			}
			else if (callMark==7)//7:��ʼ¼��
			{
				StopReadSound();//ֹͣ¼��
				gjHM();//�һ�
			}



			callMark=1;//1������δժ��

			var zt=PhoneOcx.CheckPutDown();
			if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
			{
				zjHM();//ժ��
				callMark=2;//2������ժ��
				if (ldzdly=="Y")//Y���Զ�¼����N���ֶ�¼��
				{
					StartReadSoundCStrF(xh.value,filename.value);
				}
			}

			zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
			if (zt==1)//�����������
			{
				callMark=3;//3������δ����
			}
		}
		else{
			if (callMark==0)//0:�����һ�
			{
				innum.value="";
				var zt=PhoneOcx.CheckPutDown();
				if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					zjHMBT();//ժ��
					callMark=6;//6:����ժ��
				}
			}
			else if (callMark==1)//1������δժ��
			{
				var zt=PhoneOcx.CheckPutDown();

				if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					zjHM();//ժ��
					callMark=2;//2������ժ��

					//�Ǽǽ�ͨ״̬
					var actionStr="/CallCenter/SaveLdJtzt.jsp?xh="+xh.value;
					czlx="5";
				//	window.open(actionStr);
					openAjax(actionStr);

					if (ldzdly=="Y")//Y���Զ�¼����N���ֶ�¼��
					{
						StartReadSoundCStrF(xh.value,filename.value);
					}
				}
				else{
					zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
					if (zt==1)//�����������
					{
						callMark=3;//3������δ����
					}
				}
			}
			else if (callMark==2)//2:����ժ��
			{
				var zt=PhoneOcx.CheckPutDown();
				if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					gjHM();//�һ�
					callMark=5;//5:��������󱾻�����
				}
	/*
				zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
				if (zt==1)//�����������
				{
					gjHM();//�һ�
					callMark=4;//4:ͨ����Է��һ�
				}
	*/
			}
			else if (callMark==3 || callMark==4 || callMark==5)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
			{
				innum.value="";

				var zt=PhoneOcx.CheckPutDown();

				if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					zjHM();//ժ��
					callMark=6;//6:����ժ��
				}

				//�Զ��رմ򿪴���
				if (subWin != null && subWin.open)
				{
					subWin.close();
				}

			}
			else if (callMark==6)//6:����ժ��
			{
				var zt=PhoneOcx.CheckPutDown();
				if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					gjHM();//�һ�
					callMark=0;//0:�����һ�
				}
	/*
				zt=PhoneOcx.ReadPhoneStatus();
				if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					callMark=100;//0:�����һ�
				}
	*/
			}
			else if (callMark==7)//7:��ʼ¼��
			{
				var zt=PhoneOcx.CheckPutDown();
				if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					StopReadSound();//ֹͣ¼��
					gjHM();//�һ�
					callMark=5;//5:��������󱾻�����
				}

	/*
				zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
				if (zt==1)//�����������
				{
					StopReadSound();//ֹͣ¼��
					gjHM();//�һ�
					callMark=4;//4:ͨ����Է��һ�
				}
	*/
			}
			else if (callMark==8)//8:ֹͣ¼��
			{
				var zt=PhoneOcx.CheckPutDown();
				if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					gjHM();//�һ�
					callMark=5;//5:��������󱾻�����
				}
	/*
				zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
				if (zt==1)//�����������
				{
					gjHM();//�һ�
					callMark=4;//4:ͨ����Է��һ�
				}
	*/
			}
			else if (callMark==9 || callMark==11)//9:��ʼ���ȷ���;11:��ʼ��������;
			{
				var zt=PhoneOcx.GetWriteSoundRate();
				parent.document.title="��������״̬:"+callMark+"������������:"+zt/10+"%";
				if (zt>=1000)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					StopPlaySound();//ֹͣ����
				}
			}
			else if (callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
			{
				var zt=PhoneOcx.CheckPutDown();

				if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					zjHM();//ժ��
					callMark=6;//6:����ժ��
				}
			}
			else if (callMark==12)//12:��ʼ�绰����
			{
				var zt=PhoneOcx.CheckPutDown();
				if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					StopPlaySound();//ֹͣ����

					gjHM();//�һ�
					callMark=5;//5:��������󱾻�����
				}
				var zt=PhoneOcx.GetWriteSoundRate();
				if (zt>=1000)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					StopPlaySound();//ֹͣ����
				}
			}
			else if (callMark==13)//13:����
			{
				var zt=PhoneOcx.CheckPutDown();
				if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
				{
					gjHM();//�һ�
					callMark=0;//0:�豸�һ�
				}
			}
		}
	}



//��ȡ����ͻ���Ϣ������ʾ
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
		//ȥ��ǰ��Ļ��з�
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
		parent.document.title="��"+khxxArr[2]+"������:"+innum.value+"�������ݵ�ַ��"+khxxArr[3]+"����������״̬:"+callMark;

		//�ȹرմ򿪴���
		if (subWin != null && subWin.open)
		{
			subWin.close();
		}
		subWin=window.open("/CallCenter/inCall.jsp?xh="+khxxArr[0],'callwin','height=400,width=600,top=90,left=200,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no');
	}

}


//��ʼ¼��
function StartReadSoundCStrF(xh,filename)
{
	if (callMark==9 || callMark==11 || callMark==12)//9:��ʼ����
	{
		alert("���󣡿�ʼ����������¼��");
		return;
	}
	else if (callMark==2 || callMark==8)//2:����ժ��  ������¼��
	{
		if (filename=="")
		{
			alert("����¼���ļ����Ʋ�����");
			return;
		}

		var ret=PhoneOcx.StartReadSoundCStrF(filename);//��ʼ¼��
		callMark=7;//7:��ʼ¼��
	}
	else if (callMark==13)//13:����  ��ȥ��¼��
	{

		var actionStr="SaveDialRecFile.jsp?xh="+xh+"&lywj="+filename;

		czlx="4";

		window.open(actionStr);
		openAjax(actionStr);

		if (filename=="")
		{
			alert("����¼���ļ����Ʋ�����");
			return;
		}

		var ret=PhoneOcx.StartReadSoundCStrF(filename);//��ʼ¼��
		callMark=7;//7:��ʼ¼��
	}
	else{
		alert("���󣡵绰δ��ͨ������¼��");
	}
}

//ֹͣ¼��
function StopReadSound()
{
	if (callMark==7)//7:��ʼ¼��
	{
		var ret=PhoneOcx.StopReadSound();//ֹͣ¼��
		callMark=8;//8:ֹͣ¼��
	}
		
}


function ejfy(fileName)
{
	if (callMark==7)//7:��ʼ¼��
	{
		alert("���󣡿�ʼ¼�������ܷ���");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("�����ļ���"+fileName+"��������");
		}
		else{
			callMark=11;//11:��ʼ��������
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 2, 2, 0);//��������
		}
	}
	else{
		alert("������ժ���������");
	}
}


function lbfy(fileName)
{
	if (callMark==7)//7:��ʼ¼��
	{
		alert("���󣡿�ʼ¼�������ܷ���");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("�����ļ���"+fileName+"��������");
		}
		else{
			callMark=9;//9:��ʼ���ȷ���
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 1, 2, 0);//���ȷ���
		}
	}
	else{
		alert("������ժ���������");
	}

}

function dhfy(fileName)
{
	if (callMark==7)//7:��ʼ¼��
	{
		alert("���󣡿�ʼ¼�������ܷ���");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		alert("���󣡵绰��ͨ����ܵ绰����");
	}
	else{
		if (PhoneOcx.CheckWavFileExist(fileName)!=1)
		{
			alert("�����ļ���"+fileName+"��������");
		}
		else{
			callMark=12;//12:��ʼ�绰����
			PhoneOcx.StartPlaySoundCStr(fileName, 0, 0, 2, 0);//�绰����
		}
	}
}
function StopPlaySound()
{
	if (callMark==9 || callMark==11)
	{
		callMark=10;//10:ֹͣ����
		PhoneOcx.StopPlaySound();//ֹͣ����
	}
	else if (callMark==12)
	{
		callMark=2;//2:����ժ��
		PhoneOcx.StopPlaySound();//ֹͣ����
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

//ժ��
function zjHM()
{
	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		PhoneOcx.PickUp();//HMժ��
		callMark=6;//6:�豸ժ��
	}
	else{
		alert("����δ�һ�������ժ��");
		return;
	}
}

//�һ�
function gjHM()
{
	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		alert("����δժ�������ܹһ�");
	}
	else{
		PhoneOcx.PutDown();//HM�һ�
		callMark=0//0:�豸�һ�
	}
}



//����
function DialNmb(outnum)
{
	if (outnum=="")
	{
		alert("������������к���");
		return;
	}
	else{
		if (callMark!=6 )//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
		{
			alert("����δժ��");
			return;
		}

		callMark=13;//13:����


//		PhoneOcx.DialNmbCStr(outnum);//����

		//��ȡ����ͻ���Ϣ������ʾ
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


	//��ȡ����ͻ���Ϣ������ʾ
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

