<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] ddbh=request.getParameterValues("ddbh");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">ά�������̽������</div> 
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>����Ʒ���̽������</td>
              <td><input type="text" name="fdbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td width="45%" align="right"><font color="#FF0000">*</font>�ؼ�Ʒ���̽������</td>
              <td width="55%"><input type="text" name="tjpfdbl" value="" size="10" maxlength="20"  >
%</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>��װ�ѽ������</td>
              <td><input name="azfjsbl" type="text" value="" size="10" maxlength="20"  >
                %</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>Զ�̷ѽ������</td>
              <td><input name="ycfjsbl" type="text" value="" size="10" maxlength="20"  >
                %</td>
            </tr>
            
            
            <tr> 
              <td colspan="2" height="2"> 
                <div align="center">
				<%
				for (int i=0;i<ddbh.length ;i++ )
				{
					%>
                  <input type="hidden" name="ddbh"  value="<%=ddbh[i]%>" >
					<%
				}
				%>
                  <input type="button" value="����" onClick="f_do(editform)">
                </div>              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.fdbl)=="") {
		alert("������[����Ʒ���̽������]��");
		FormName.fdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fdbl, "����Ʒ���̽������"))) {
		return false;
	}
	if(	parseFloat(FormName.fdbl.value)<0 || parseFloat(FormName.fdbl.value)>100) {
		alert("����[����Ʒ���̽������]Ӧ��0��100֮��");
		FormName.fdbl.select();
		return false;
	}

	if(	javaTrim(FormName.tjpfdbl)=="") {
		alert("������[�ؼ�Ʒ���̽������]��");
		FormName.tjpfdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.tjpfdbl, "�ؼ�Ʒ���̽������"))) {
		return false;
	}
	if(	parseFloat(FormName.tjpfdbl.value)<0 || parseFloat(FormName.tjpfdbl.value)>100) {
		alert("����[�ؼ�Ʒ���̽������]Ӧ��0��100֮��");
		FormName.tjpfdbl.select();
		return false;
	}

	if(	javaTrim(FormName.azfjsbl)=="") {
		alert("������[��װ�ѽ������]��");
		FormName.azfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.azfjsbl, "��װ�ѽ������"))) {
		return false;
	}
	if(	parseFloat(FormName.azfjsbl.value)<0 || parseFloat(FormName.azfjsbl.value)>100) {
		alert("����[��װ�ѽ������]Ӧ��0��100֮��");
		FormName.azfjsbl.select();
		return false;
	}

	if(	javaTrim(FormName.ycfjsbl)=="") {
		alert("������[Զ�̷ѽ������]��");
		FormName.ycfjsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfjsbl, "Զ�̷ѽ������"))) {
		return false;
	}
	if(	parseFloat(FormName.ycfjsbl.value)<0 || parseFloat(FormName.ycfjsbl.value)>100) {
		alert("����[Զ�̷ѽ������]Ӧ��0��100֮��");
		FormName.ycfjsbl.select();
		return false;
	}


	FormName.action="SavePlEditWhJsblJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
