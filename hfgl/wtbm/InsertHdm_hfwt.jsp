<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/khhdpt/checklogin.jsp" %>
<%
String fbr=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
  <div align="center">¼�룭�ط�����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button" name="bc" value="����" onClick="f_do(insertform)">
        <input type="button"  value="��һ������" name="ww2" onClick="f_do1(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>��������</td>
      <td colspan="3"> 
        <input type="text" name="wtmc" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>��Ч��־</td>
      <td width="34%"> 
        <input type="radio" name="yxbz"  value="Y" checked>
        ��Ч 
        <input type="radio" name="yxbz"  value="N">
        ��Ч</td>
      <td align="right" width="20%"><font color="#CC0000">*</font>�Ƿ�ɶ�ѡ</td>
      <td width="30%"> 
        <input type="radio" name="sfkdx"  value="1">
        ��ѡ 
        <input type="radio" name="sfkdx"  value="2">
        ��ѡ
        <input type="radio" name="sfkdx"  value="3">
        д˵��</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#CC0000">*</font>�Ƿ�������д˵��</td>
      <td><input type="radio" name="sftxsm"  value="Y">
����
  <input name="sftxsm" type="radio"  value="N" checked>
������    
      <td align="right">��д˵����ʾ</td>
      <td><input name="txsmts" type="text"  value="" size="23" maxlength="50" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><span class="STYLE1">������</span></td>
      <td width="34%"> 
        <input name="fbr" type="text" value="<%=fbr%>" size="15" maxlength="20" readonly>
      <td align="right" width="20%"><font color="#CC0000">*</font><span class="STYLE1">����ʱ��</span></td>
      <td width="30%"> 
        <input name="fbsj" type="text"  value="<%=cf.today()%>" size="15" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4"><b><font color="#0000CC">�����</font></b></td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��1]���</td>
      <td width="34%"> 
        <input type="text" name="dabh1" value="1" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��1]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm1"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm1"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��1]����</td>
      <td colspan="3"> 
        <input type="text" name="damc1" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��2]���</td>
      <td width="34%"> 
        <input type="text" name="dabh2" value="2" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��2]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm2"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm2"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��2]����</td>
      <td colspan="3"> 
        <input type="text" name="damc2" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��3]���</td>
      <td width="34%"> 
        <input type="text" name="dabh3" value="3" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��3]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm3"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm3"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��3]����</td>
      <td colspan="3"> 
        <input type="text" name="damc3" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��4]���</td>
      <td width="34%"> 
        <input type="text" name="dabh4" value="4" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��4]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm4"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm4"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="21" align="right" width="16%">[��4]����</td>
      <td colspan="3"> 
        <input type="text" name="damc4" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��5]���</td>
      <td width="34%"> 
        <input type="text" name="dabh5" value="5" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��5]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm5"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm5"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td height="27" align="right" width="16%" bgcolor="#E8E8FF">[��5]����</td>
      <td colspan="3"> 
        <input type="text" name="damc5" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��6]���</td>
      <td width="34%"> 
        <input type="text" name="dabh6" value="6" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��6]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm6"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm6"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%" bgcolor="#FFFFFF">[��6]����</td>
      <td colspan="3"> 
        <input type="text" name="damc6" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��7]���</td>
      <td width="34%"> 
        <input type="text" name="dabh7" value="7" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��7]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm7"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm7"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��7]����</td>
      <td colspan="3"> 
        <input type="text" name="damc7" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��8]���</td>
      <td width="34%"> 
        <input type="text" name="dabh8" value="8" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��8]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm8"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm8"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��8]����</td>
      <td colspan="3"> 
        <input type="text" name="damc8" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��9]���</td>
      <td width="34%"> 
        <input type="text" name="dabh9" value="9" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��9]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm9"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm9"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="16%">[��9]����</td>
      <td colspan="3"> 
        <input type="text" name="damc9" value="" size="80" maxlength="100" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��10]���</td>
      <td width="34%"> 
        <input type="text" name="dabh10" value="7" size="15" maxlength="8" >      </td>
      <td width="20%" align="right">[��10]������д˵��</td>
      <td width="30%"> 
        <input type="radio" name="sfyxsm10"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm10"  value="N" checked>
        ������ </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%">[��10]����</td>
      <td colspan="3"> 
        <input type="text" name="damc10" value="" size="80" maxlength="100" >      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do1(FormName)//����FormName:Form������
{
	FormName.target=""
	FormName.action="InsertHdm_hfwt.jsp";
	FormName.submit();
	return true;
	
}


function f_do(FormName)
{

	if(	javaTrim(FormName.wtmc)=="") {
		alert("������[��������]��");
		FormName.wtmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.yxbz)) {
		alert("��ѡ��[��Ч��־]��");
		FormName.yxbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkdx)) {
		alert("��ѡ��[�Ƿ�ɶ�ѡ]��");
		FormName.sfkdx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sftxsm)) {
		alert("��ѡ��[�Ƿ�������д˵��]��");
		FormName.sftxsm[0].focus();
		return false;
	}

	if (FormName.sfkdx[2].checked)
	{
		if (!FormName.sftxsm[0].checked)
		{
			alert("����Ӧѡ��[����]��");
			FormName.sftxsm[0].focus();
			return false;
		}
	}
	else{
		if (FormName.sftxsm[0].checked)
		{
			if(	javaTrim(FormName.txsmts)=="") {
				alert("������[��д˵����ʾ]��");
				FormName.txsmts.focus();
				return false;
			}
		}
		else{
			if(	javaTrim(FormName.txsmts)!="") {
				alert("��������[��д˵����ʾ]��");
				FormName.txsmts.select();
				return false;
			}
		}
	}


	
	if (!FormName.sfkdx[2].checked)
	{
		if(javaTrim(FormName.dabh1)=="")
		{
			alert("������[[��1]���]��");
			FormName.dabh1.focus();
			return false;
		}
		if(	!radioChecked(FormName.sfyxsm1)) {
			alert("��ѡ��[��1]������д˵��]��");
			FormName.sfyxsm1[0].focus();
			return false;
		}
		if(javaTrim(FormName.damc1)=="")
		{
			alert("������[[��1]����]��");
			FormName.damc1.focus();
			return false;
		}
	}
	
	
	
	FormName.target="_blank"
	FormName.action="SaveInsertHdm_hfwt.jsp";
	FormName.submit();
	FormName.bc.disabled="true";
	return true;
	
}

//-->
</SCRIPT>
