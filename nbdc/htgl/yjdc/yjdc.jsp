<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");
%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right">��������</td>
      <td colspan="3"><input type="text" name="wtmc" value="" size="80" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">��������</td>
      <td colspan="3"><input type="text" name="dcqs" value="" size="80" maxlength="100" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="14%">�����Ƿ����</td>
      <td width="44%"><input type="radio" name="wtsfgq"  value="Y">
        ���� 
        <input type="radio" name="wtsfgq"  value="N" checked>
        δ���� </td>
      <td align="right" width="14%">�Ƿ�ɶ�ѡ</td>
      <td width="28%"><input type="radio" name="sfkdx"  value="Y">
        �ɶ�ѡ 
        <input type="radio" name="sfkdx"  value="N">
        ��ѡ </td>
    </tr>
	
    <tr bgcolor="#FFFFFF"> 
      <td align="right">������д˵��</td>
      <td><input type="radio" name="sfyxsm"  value="Y">
        ���� 
        <input type="radio" name="sfyxsm"  value="N" checked>
        ������ </td>
      <td><div align="right">�������</div></td>
      <td><select name="wtfl"  width="40">
          <option value="">&nbsp;&nbsp;</option>
          <option  value="1" >1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
          <option  value="2">2</option>
          <option  value="3">3</option>
          <option  value="4">4</option>
        </select></td>
    </tr>
	<tr bgcolor="#FFFFFF"> 
      <td align="right" width="14%">¼����</td>
      <td width="44%"><input type="text" name="lrr" value="<%=lrr%>" size="15" readonly>
        
      <td align="right" width="14%">¼��ʱ��</td>
      <td width="28%"><input type="text" name="lrsj" size="15"  value="<%=cf.today()%>" readonly>
       </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">��ѡ��1</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">���˵��</td>
      <td colspan="3"><input type="text" name="jgsm1" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">��ѡ��2</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">���˵��</td>
      <td colspan="3"><input type="text" name="jgsm2" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">��ѡ��3</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="21" align="right">���˵��</td>
      <td colspan="3"><input type="text" name="jgsm3" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="21" align="right">��ѡ��4</td>
      <td colspan="3"><input type="text" name="kxda" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="27" align="right">���˵��</td>
      <td colspan="3"><input type="text" name="jgsm4" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="27" align="right">��ѡ��5</td>
      <td colspan="3"><input name="kxda" type="text" value="" size="80"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">���˵��</td>
      <td colspan="3"><input type="text" name="jgsm5" value="" size="80" maxlength="300" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">��ѡ��6</td>
      <td colspan="3"><input name="kxda" type="text" value="" size="80"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right">���˵��</td>
      <td colspan="3"><input type="text" name="jgsm6" value="" size="80" maxlength="300" > 
      </td>
    </tr>
	 
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="14%">����˵��</td>
      <td colspan="3"> <textarea name="xwtsm" cols="80" rows=""></textarea> </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> <input type="button" name="ww1" value="����" onClick="CheckForm(insertform)"> 
        <input type="reset"  value="����" name="reset"> </td>
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
	
	
	FormName.action="yjdc.jsp";
	FormName.target=""
	FormName.submit();
	return true;
	
}


function CheckForm(oForm)
{
	
	if(	javaTrim(oForm.wtmc)=="") {
		alert("������[��������]��");
		oForm.wtmc.focus();
		return false;
	}
	if(	javaTrim(oForm.dcqs)=="") {
		alert("������[��������]��");
		oForm.dcqs.focus();
		return false;
	}
	if(	!radioChecked(oForm.sfkdx)) {
		alert("��ѡ��[�Ƿ�ɶ�ѡ]��");
		oForm.sfkdx[0].focus();
		return false;
	}


	
	
	if(	!radioChecked(oForm.wtsfgq)) {
		alert("��ѡ��[�����Ƿ����]��");
		oForm.wtsfgq[0].focus();
		return false;
	}
	if(javaTrim(oForm.kxda[0])=="")
	{
		alert("�������ѡ�𰸣�");
		oForm.kxda[0].focus();
		return false;
	}
	if(javaTrim(oForm.kxda[1])=="")
	{
		alert("�������ѡ�𰸣�");
		oForm.kxda[1].focus();
		return false;
	}
	
	
	oForm.action="SaveInsertHd_scdcwt.jsp";
	oForm.target="_blank"
	oForm.submit();
	return true;
	
}

//-->
</SCRIPT>
