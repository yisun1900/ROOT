<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>��������</TITLE>
</HEAD>


<BODY onbeforeunload="closeDeal()"  > 
<div align="center">�������ģ�����¼��
</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td height="52" align="center">�����ļ�</td>
    <td><input name="playfile" type="text" value="" size="68" maxlength="70" >
      <BR>
      <BR>
	  <input name="cxld" type="button" onClick="window.open('getInRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="���ҡ����硷¼���ļ�" >
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="cxqd" type="button" onClick="window.open('getOutRecFile.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="���ҡ�ȥ�硷¼���ļ�" ></td>
  </tr>
  <tr>
    <td width="15%" height="51" align="center">����</td>
    <td width="85%"><input type="button" value="��������" name="ejfyBt" onClick="ejfy()">
    <input type="button" value="���ȷ���" name="lbfyBt" onClick="lbfy()">
        <input type="button" value="�绰����" name="dhfyBt" onClick="dhfy()" disabled>
        <input type="button" value="ֹͣ����" name="StopPlay" onClick="StopPlaySound()" disabled></td>
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
		alert("�����ļ���Ϊ��");
		return;
	}
	else if (parent.menu.isFile(fileName)==false)
	{
		alert("�����ļ�������");
		return;
	}

	var callMark=parent.menu.callMark;

	if (callMark==7)//7:��ʼ¼��
	{
		alert("���󣡿�ʼ¼�������ܷ���");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
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
		alert("������ժ���������");
	}
}
function lbfy()
{

	var fileName=playfile.value;

	if (fileName=="")
	{
		alert("�����ļ���Ϊ��");
		return;
	}
	else if (parent.menu.isFile(fileName)==false)
	{
		alert("�����ļ�������");
		return;
	}

	var callMark=parent.menu.callMark;


	if (callMark==7)//7:��ʼ¼��
	{
		alert("���󣡿�ʼ¼�������ܷ���");
		return;
	}
	else if (callMark==0 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
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
		alert("������ժ���������");
	}


}

function dhfy()
{
	var fileName=playfile.value;

	if (fileName=="")
	{
		alert("�����ļ���Ϊ��");
		return;
	}
	else if (parent.menu.isFile(fileName)==false)
	{
		alert("�����ļ�������");
		return;
	}

	var callMark=parent.menu.callMark;

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

		parent.menu.StopPlaySound();//ֹͣ����

		ejfyBt.disabled=false;
		lbfyBt.disabled=false;

		cxld.disabled=false;
		cxqd.disabled=false;
	}
	else if (callMark==12)
	{
		StopPlay.disabled=true;

		parent.menu.StopPlaySound();//ֹͣ����

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
		parent.menu.StopPlaySound();//ֹͣ����
	}
	else if (callMark==12)
	{
		parent.menu.StopPlaySound();//ֹͣ����
	}
}


</SCRIPT>
