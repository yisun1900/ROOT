<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<HTML>
<HEAD>
<TITLE>��������</TITLE>
</HEAD>

<BODY onbeforeunload="closeDeal()"  > 

<div align="center">�������ģ�������</div>
<table width="100%" border="1" cellpadding="1" cellspacing="1">
  <tr>
    <td align="center">ժ/�һ�</td>
    <td height="52"><input type="button" value="ժ��" name="zjBT" onClick="zjHMBT()">
        <input type="button" value="�һ�" name="gjBT" onClick="gjHMBT()" disabled></td>
  </tr>
  <tr>
    <td width="15%" align="center">����</td>
    <td width="85%" height="52"> ���к��룺
      <input name="outnum" type="text" value="" size="20" maxlength="20">
        <input type="button" value="����" name="DialBT" onClick="DialNmb()" disabled>
        <input name="button2" type="button" onClick="window.open('SelectCxCrm_zxkhxx.jsp','','height=600,width=800,top=60,left=100,toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=no')" value="���ҿͻ�" ></td>
  </tr>
</table>
  


<P><br>
</P>
</BODY>
</HTML>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">

//ժ��
function zjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==0 || callMark==1 || callMark==3 || callMark==4 || callMark==5 || callMark==10)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		zjBT.disabled=true;

		parent.menu.zjHM();

		gjBT.disabled=false;
		DialBT.disabled=false;
	}
	else{
		alert("����δ�һ�������ժ��");
		return;
	}
}

//�һ�
function gjHMBT()
{
	var callMark=parent.menu.callMark;

	if (callMark==6 || callMark==7 || callMark==13)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		gjBT.disabled=true;

		parent.menu.gjHM();

		zjBT.disabled=false;
	}
	else{
		alert("���󣡲��ܹһ�");
		return;
	}
}


//����
function DialNmb()
{
	var callMark=parent.menu.callMark;

	if (outnum.value=="")
	{
		alert("������������к���");
		outnum.select();
		return;
	}
	else{
		if (callMark!=6 )//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
		{
			alert("����δժ��");
			return;
		}

		DialBT.disabled=true;

		parent.menu.DialNmb(outnum.value);


	}

}



function closeDeal()
{
	var callMark=parent.menu.callMark;

	if (callMark==6 || callMark==7 || callMark==13)//3:����δ��ͨ;4:ͨ����Է��һ�;5:ͨ���󱾻��һ�
	{
		parent.menu.gjHM();
	}
}



</SCRIPT>
