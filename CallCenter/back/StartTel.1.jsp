<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>

<TITLE>��������</TITLE>

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
	out.print("<BR>����:" + e);
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
<div align="center">��������
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td height="34" colspan="2">�������롺<%=bjhm%>����¼���ļ�Ŀ¼��<%=lywjml%>����Ա�����ơ�<%=yhmc%>��</td>
  </tr>
  <tr>
    <td align="center">����״̬</td>
    <td height="34"><input name="callText" type="text" id="callText" size="3" maxlength="5" readonly>
0:�����һ�;1:�����ժ��;2:����ժ��;3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�;6:����ժ��;7:��ʼ¼��;8:ֹͣ¼��</td>
  </tr>
  <tr>
    <td width="12%" align="center">����ϵͳ</td>
    <td width="88%" height="34">
		<input name="initCallButton"  type="button" onClick="initCall()" value="ϵͳ���³�ʼ��">
		<input name="startCallButton" type="button" onClick="startCall()" value="�������ϵͳ"></td>
  </tr>
  <tr>
    <td align="center">�������</td>
    <td><input name="innum" type="text" size="20" maxlength="20">
    <input type="button" value=�鿴�ͻ���ϸ��Ϣ  onClick="f_khxx()"></td>
  </tr>
  
  <tr>
    <td align="center">����ͻ�
    <input name="khbh" type="hidden" size="20" >
    <input name="xh" type="hidden" size="20" ></td>
    <td height="17"><table width="100%" border="0">
      <tr>
        <td width="37%" >����:
			<input type="text" name="khxm" readonly size="24" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td width="21%" >�ʼ�:
			<input type="text" name="zjxm" readonly size="10" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td width="21%" >���ʦ:
			<input type="text" name="sjs" readonly size="10" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
        <td width="21%" >ʩ����:
			<input type="text" name="sgd" readonly size="10" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">		</td>
      </tr>
      <tr>
        <td colspan="4" >���ݵ�ַ:
          <input type="text" name="fwdz" readonly  size="41" value="" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td align="center"> ��������</td>
    <td height="37"><%
			cf.radioItem(out,"select ldlxbm,ldlxmc from dm_ldlxbm order by ldlxbm","ldlxbm","");
		%>    </td>
  </tr>
  <tr>
    <td align="center">¼��</td>
    <td height="37"><input id="StartReadSoundCStrF" type="button" value="��ʼ¼��" name="StartReadSoundCStrF" onClick="StartReadSoundCStrF()">
        <input id="StopReadSound" type="button" value="ֹͣ¼��" name="StopReadSound" onClick="StopReadSound()">
      <BR>
	  ¼���ļ���
      <input name="filename" type="text" value="<%=lywjml%>" size="50" maxlength="50" readonly></td>
  </tr>
  <tr>
    <td align="center">����</td>
    <td><input type="button" value="��������" onClick="ejfy()">
        <input type="button" value="���ȷ���" onClick="lbfy()">
        <input type="button" value="�绰����" onClick="dhfy()">
        <input type="button" value="ֹͣ����" onClick="StopPlaySound()">
       <BR>
      �����ļ���
      <input name="playfile" type="text" value="<%=lywjml%>\aaa.wav" size="50" maxlength="50">
      <input type="button" value="����¼���ļ�" onClick="window.open('getRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" ></td>
  </tr>
  <tr>
    <td align="center">����</td>
    <td height="34"> ���к��룺
      <input name="outnum" type="text" size="20" maxlength="20">
        <input id=DialNmb type=button value=���� name=DialNmb onClick="DialNmb()">
        <input name="button" type="button" onClick="window.open('cxkh.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="���ҿͻ�" ></td>
  </tr>
  <tr>
    <td align="center">ժ/�һ�</td>
    <td height="34"><input type="button" value="ժ��" onClick="zjHM()">
        <input type="button" value="�һ�" onClick="gjHM()"></td>
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
	//����Ajax
	cf.ajax(out);
%>

var czlx="";
var lylx="2";//¼�����ͣ�1������¼����2��ȥ��¼��


//��ȡ����ͻ���Ϣ������ʾ
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
	khbh.value=khxxArr[1];

	khxm.value=khxxArr[2];
	fwdz.value=khxxArr[3];
	sjs.value=khxxArr[4];
	zjxm.value=khxxArr[5];
	sgd.value=khxxArr[6];

/*
	document.getElementById('khxm').innerHTML="";
	txtNode=document.createTextNode("����:"+);
	document.getElementById('khxm').appendChild(txtNode);
*/

	filename.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+".wav";
	playfile.value="<%=cf.replace(lywjml,"\\","\\\\")%>\\"+xh.value+"-"+khbh.value+"-"+khxxArr[2]+".wav";
}

startCall();

//��ʼ¼��
function StartReadSoundCStrF()
{
	if (callMark==2 || callMark==8)//2:����ժ��
	{
		var actionStr="SaveRecFile.jsp?xh="+xh.value+"&lywj="+filename.value;

		czlx="2";

	//	window.open(actionStr);
		openAjax(actionStr);

		var ret=PhoneOcx.StartReadSoundCStrF(filename.value);//��ʼ¼��
		callMark=7;//7:��ʼ¼��
	}
}

function StopReadSound()
{
	if (callMark==7)//7:��ʼ¼��
	{
		var ret=PhoneOcx.StopReadSound();//ֹͣ¼��
		callMark=8;//8:ֹͣ¼��
	}
		
}


function ReadstrCallNmb()
{
	try
	{
		if (PhoneOcx.CheckCallStatus()==1)//=0��û����Ч������룻=1������Ч�������
		{
			var num="";
			num=PhoneOcx.ReadstrCallNmb();//���������
			innum.value=num;
			window.open("ViewCrm_khxx.jsp?lxfs="+num);
		}
		else
		{
			alert("û�����磺");
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

//	alert("��ε�USB�ߣ��ز���ɳ�ʼ��");
}

function zjHM()
{
	PhoneOcx.PickUp();//HMժ��
}

function gjHM()
{
     PhoneOcx.PutDown();//HM�һ�
}

//����
function DialNmb()
{
	PhoneOcx.PickUp();//ժ��
	PhoneOcx.TelSleep(400);//��ʱ����
	PhoneOcx.DialNmbCStr(outnum.value);//����

	var state=PhoneOcx.CheckPutDown();//�ж������ͨ�绰ժ/�һ�״̬ 0���Ѿ��һ���1���Ѿ�ժ����
	alert(state);
}




//��ȡ�绰����
var cs=0;
var callMark=0;//0:�����һ�;1:����δժ��;2:����ժ��;3:����δ����;4:���������Է�����;5:��������󱾻�����;6:����ժ��;7:��ʼ¼��;8:ֹͣ¼��
function getNum()
{
	cs++;
	innum.value=cs;
	callText.value=callMark;
 	if (PhoneOcx.CheckCallStatus()==1)//=0��û����Ч������룻=1������Ч�������
	{
		var inTelNum="";
		inTelNum=PhoneOcx.ReadstrCallNmb();//���������
		innum.value=inTelNum;


		//��ȡ����ͻ���Ϣ������ʾ
		doCall(inTelNum);

		callMark=1;//1������δժ��



		var zt=PhoneOcx.CheckPutDown();

		if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
		{
			zjHM();//ժ��
			callMark=2;//2������ժ��
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
			var zt=PhoneOcx.CheckPutDown();

			if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
			{
				zjHM();//ժ��
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

			zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
			if (zt==1)//�����������
			{
				gjHM();//�һ�
				callMark=4;//4:���������Է�����
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
		}
		else if (callMark==7)//7:��ʼ¼��
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
			{
				StopReadSound();//ֹͣ¼��
				gjHM();//�һ�
			}
			zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
			if (zt==1)//�����������
			{
				StopReadSound();//ֹͣ¼��
				gjHM();//�һ�
			}
		}
		else if (callMark==8)//8:ֹͣ¼��
		{
			var zt=PhoneOcx.CheckPutDown();
			if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
			{
				gjHM();//�һ�
				callMark=5;//5:��������󱾻�����
			}

			zt=PhoneOcx.CheckCanNextCallIn();//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
			if (zt==1)//�����������
			{
				gjHM();//�һ�
				callMark=4;//4:���������Է�����
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
		alert("����δ��Ȩ");
		return;
	}

	innum.value="";
	filename.value="";
	playfile.value="";


	if (startCallButton.value=="�������ϵͳ")
	{
		//����ʱ�ӣ�1�����һ�κ���:getNum()
		timer = setInterval("getNum()",400); //setInterval() �����ɰ���ָ�������ڣ��Ժ���ƣ������ú����������ʽ
		if (timer!=0)
		{
			startCallButton.value='ϵͳ������......�����ֹͣϵͳ��';
		}
	}
	else{
		//���ʱ��
		clearInterval(timer);
		startCallButton.value='�������ϵͳ';
	}
}

//�����һ�����徭��nextCallDelay��ϵͳ��Ϊ���ν�����������̽���
function ldjs()
{
     if (PhoneOcx.CheckCanNextCallIn()==1)//�жϱ��������Ƿ����: 0����������δ������=1�������������
     {
		 alert("�������");
     }
	 else{
		 alert("����δ����");
	 }

}

function zgj()
{
	var zt=PhoneOcx.CheckPutDown();

	if (zt==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
	{
		alert("�绰�Ѿ�ժ��");
	}
	else if (zt==0)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
	{
		alert("�绰�һ�");
	}

}
function ejfy()
{
	var fileName=playfile.value;

	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		alert("�����ļ���"+fileName+"��������");
	}
	else{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 2, 2, 0);//��������
	}
}
function lbfy()
{
	var fileName=playfile.value;

	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		alert("�����ļ���"+fileName+"��������");
	}
	else{
		PhoneOcx.StartPlaySoundCStr(fileName, 0, 1, 2, 0);//���ȷ���
	}

}
function dhfy()
{
	var fileName=playfile.value;

	if (PhoneOcx.CheckWavFileExist(fileName)!=1)
	{
		alert("�����ļ���"+fileName+"��������");
	}
	else{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 0, 2, 0);//�绰����
	}
}
function StopPlaySound()
{
    PhoneOcx.StopPlaySound();//ֹͣ����
}
</SCRIPT>
