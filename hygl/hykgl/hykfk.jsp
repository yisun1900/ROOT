<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>


<%
String dwbh=request.getParameter("dwbh");
%>

<html>
<head>
<title>�ޱ����ĵ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="fk_save.jsp">
  <table width="100%" border="0">
    <tr> 
      <td width="94%"> 
        <center>
          ˮ�ʷ��������� 
        </center>
      </td>
    </tr>
    <tr> 
      <td width="94%"> 
        <table width="100%" border="1" cellpadding="1" cellspacing="1" align="center" style="FONT-SIZE:12">
          <tr> 
            <td width="42%"> 
              <div align="right">�տ���λ</div>
            </td>
            <td width="58%"> 
        <select name="dwbh" style="FONT-SIZE:12px;WIDTH:152px" >
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
        </select>
            </td>
          </tr>
          <tr> 
            <td width="42%" align="right">����ǰ׺</td>
            <td width="58%"> 
              <input type="text" name="khqz" maxlength="10" value=""  size="20">
            </td>
          </tr>
          <tr>
            <td width="42%" align="right">���ų���</td>
            <td width="58%">
              <input type="text" name="khcd" maxlength="10" size="20">
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">������ʼֵ</div>
            </td>
            <td width="58%"> 
              <input type="text" name="qsh" maxLength="5">
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">������ֵֹ</div>
            </td>
            <td width="58%"> 
              <input type="text" name="zzh" maxLength="5">
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">�������</div>
            </td>
            <td width="58%"> 
              <select name="kdlb" style="FONT-SIZE:12px;WIDTH:152px">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
%> 
              </select>
            </td>
          </tr>
          <tr> 
            <td width="42%"> 
              <div align="right">&nbsp;</div>
            </td>
            <td width="58%"> 
              <center>
                <input type="button" name="Submit" value="����" onClick="isValid(form1)">
              </center>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript" src="/js/validate.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
function isValid(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khqz)=="") {
		alert("������[����ǰ׺]��");
		FormName.khqz.focus();
		return false;
	}
	if(	javaTrim(FormName.khcd)=="") {
		alert("������[���ų���]��");
		FormName.khcd.focus();
		return false;
	}
	if(!(isNumber(FormName.khcd, "���ų���"))) {
		return false;
	}

	if(javaTrim(FormName.qsh)==""){
		alert("������[������ʼֵ]��");
		FormName.qsh.focus();
		return false;
	}
	if(!(isNumber(FormName.qsh, "������ʼֵ"))) {
		return false;
	}

	if(javaTrim(FormName.zzh)==""){
		alert("������[������ֵֹ]��");
		FormName.zzh.focus();
		return false;
	}
	if(!(isNumber(FormName.zzh, "������ֵֹ"))) {
		return false;
	}

	if(parseInt(FormName.qsh.value)>parseInt(FormName.zzh.value)){
		alert("��ʼ���벻�ܴ�����ֹ����");
		FormName.qsh.value="";
		FormName.zzh.value="";
		FormName.qsh.focus();
		return false;
	}
	if(javaTrim(FormName.kdlb)==""){
		alert("������[�������]��");
		FormName.kdlb.focus();
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>