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
    <td width="9%" align="center">����ϵͳ</td>
    <td height="34">
		<input name="initCallButton"  type="button" onClick="initCall()" value="ϵͳ���³�ʼ��">
		<input name="startCallButton" type="button" onClick="startCall()" value="�������ϵͳ"></td>
  </tr>
  <tr>
    <td width="9%" rowspan="3" align="center">���Ź���</td>
    <td height="34">
	<input type="button" value="ժ��" onClick="zj()">
    <input type="button" value="�һ�" onClick="gj()"></td>
  </tr>
  <tr>
    <td height="34"><input id=DialNmb type=button value=������ name=DialNmb onClick="DialNmb()">
      
���к��룺
<input name="telnum" type="text" value="13601167422" size="20" maxlength="20"></td>
  </tr>
  <tr>
    <td width="91%" height="27"> ��������ť���̣���Ҳ������һ����ʵ�֣����ǣ���ťҪʹ�ø�ѡ��ʽ(��μ�VB_API�е�VB_API.exe����) </td>
  </tr>
  <tr>
    <td rowspan="2" align="center">¼������</td>
    <td height="37"><input id=StartReadSoundCStrF type=button value=��ʼ¼�� name=StartReadSoundCStrF onClick="StartReadSoundCStrF()">
      <input id=StopReadSound type=button value=ֹͣ¼�� name=StopReadSound onClick="StopReadSound()">
¼���ļ���
<input name="filename" type="text" value="C:\tomcat\webapps\ROOT\CallCenter\aaa.wav" size="50" maxlength="50"></td>
  </tr>
  <tr>
    <td height="44">����Ҫָ��¼������·����Ĭ��·��Ϊ��C:\PhoneOcx.wav��
<br>
��ժ�������š�¼����ֹͣ¼���͹һ����ʹ��ʱ����μ�VB_API�е�VB_API.exe�����ButtonDial_Click()���Ź��̡�</td>
  </tr>
  <tr>
    <td align="center">��/д������״̬</td>
    <td><input id=GetTelStatus type=button value=��״̬ name=GetTelStatus onClick="GetTelStatus()">
      <input id=SetTelStatus type=button value=д״̬ name=SetTelStatus onClick="SetTelStatus()"></td>
  </tr>
  <tr>
    <td rowspan="2" align="center">���������</td>
    <td><input type="button" value="���������" onClick="ReadstrCallNmb()">
������룺
  <input name="callnum" type="text" size="20" maxlength="20">
  <input name="button" type="button" onClick="ldjs()" value="�����Ƿ����">
  <input name="button2" type="button" onClick="zgj()" value="�ж�ժ/�һ�״̬"></td>
  </tr>
  <tr>
    <td> ���������Զ���ȡ����μ�VB_API�е�VB_API.exe�����TelTimer_Timer()���̡� </td>
  </tr>
  <tr>
    <td rowspan="2" align="center">����</td>
    <td>
		<input type="button" value="��������" onClick="ejfy()">
		<input type="button" value="���ȷ���" onClick="lbfy()">
		<input type="button" value="�绰����" onClick="dhfy()">
		<input type="button" value="ֹͣ����" onClick="StopPlaySound()">
		�����ļ���<input name="playfile" type="text"value="d:\tomcat\webapps\ROOT\CallCenter\aaa.wav" size="50" maxlength="50">    </td>
  </tr>
  <tr>
    <td>���ȣ�������Ŀ¼�µ�"leaveword.wav"�ļ���������C:��Ŀ¼��<br>
֮�����ٰ�"����"��������ʱ���������绰�ķ���+�����������Ĳ������������������󡣵�����ͨһ���绰�󣬸ò������Ͳ������ˣ���ʱ�ڵ绰���������Ż����������ĵ绰������ </td>
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
	PhoneOcx.PickUp();//ժ��
}

function gj()
{
     PhoneOcx.PutDown();//HM�һ�
}

function DialNmb()
{
	if (PhoneOcx.CheckPutDown()==1)
	{
		PhoneOcx.TelSleep(400);//��ʱ����
		PhoneOcx.DialNmbCStr(telnum.value);//����
	}
	else{
		alert("������ժ��");
	}
}
function StartReadSoundCStrF()
{
     PhoneOcx.StartReadSoundCStrF(filename.value);//��ʼ¼��
}
function StopReadSound()
{
     PhoneOcx.StopReadSound();//ֹͣ¼��
}
function GetTelStatus()
{
     PhoneOcx.GetTelStatus();//��������״̬
}
function SetTelStatus()
{
     PhoneOcx.SetTelStatus(200 * 256);//���ý�����״̬
}

function ReadstrCallNmb()
{
	if (PhoneOcx.CheckCallStatus()==1)//=0��û����Ч������룻=1������Ч�������
	{
		var num="";
		num=PhoneOcx.ReadstrCallNmb();//���������
		callnum.value=num;
		window.open("ViewCrm_khxx.jsp?lxfs="+num);
	}
	else
	{
		alert("û�����磺");
	}
}

function initCall()
{
	alert("��ε�USB�ߣ��ز���ɳ�ʼ��");
}

function getNum()
{
//		alert("û�����磺");

	if (PhoneOcx.CheckCallStatus()==1)//=0��û����Ч������룻=1������Ч�������
	{
		var num="";
		num=PhoneOcx.ReadstrCallNmb();//���������
		callnum.value=num;
		window.open("ViewCrm_khxx.jsp?lxfs="+num);
	}

}

var timer=0;
function startCall()
{
	if (startCallButton.value=="�������ϵͳ")
	{
		var timer = setTimeout("getNum",1000);
		if (timer!=0)
		{
			startCallButton.value='ϵͳ������......�����ֹͣϵͳ��';
		}
	}
	else{
	//	clearTimeout(timer);
		clearInterval(timer);
		startCallButton.value='�������ϵͳ';
	}
}


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
     if (PhoneOcx.CheckPutDown()==1)//�ж������ͨ�绰ժ/�һ�״̬�� 0���Ѿ��һ���1���Ѿ�ժ������
     {
		 alert("�Ѿ�ժ��");
     }
	 else{
		 alert("�һ�");
	 }

}
function ejfy()
{
	if (PhoneOcx.CheckWavFileExist(playfile.value)==1)
	{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 2, 2, 0);//��������
	}
	else{
		alert("�����ļ���"+playfile.value+"��������");
	}
}
function lbfy()
{
	if (PhoneOcx.CheckWavFileExist(playfile.value)==1)
	{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 1, 2, 0);//���ȷ���
	}
	else{
		alert("�����ļ���"+playfile.value+"��������");
	}


}
function dhfy()
{
	if (PhoneOcx.CheckWavFileExist(playfile.value)==1)
	{
		PhoneOcx.StartPlaySoundCStr(playfile.value, 0, 0, 2, 0);//�绰����
	}
	else{
		alert("�����ļ���"+playfile.value+"��������");
	}

}
function StopPlaySound()
{
    PhoneOcx.StopPlaySound();//ֹͣ����
}
</SCRIPT>
