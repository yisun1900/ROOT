<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ������Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform"  >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�����Ƿ��д���</td>
              <td colspan="3" bgcolor="#FFFFFF"><input type="radio" name="sjsfycx" value="1">
                �޴���
                <input type="radio" name="sjsfycx" value="2">
                ���������ƴ���
                <input type="radio" name="sjsfycx" value="3">
              ���������ƴ��� </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">������ʼʱ��</td>
              <td width="30%" bgcolor="#FFFFFF"><input type="text" name="cxkssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
              <td width="20%" align="right" bgcolor="#FFFFFF">��������ʱ��</td>
              <td width="30%" bgcolor="#FFFFFF"><input type="text" name="cxjssj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">�����������</td>
              <td bgcolor="#FFFFFF"><input type="text" name="cxsjcj" value="" size="20" maxlength="9" ></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="4" align="center" >
				<input type="hidden" name="chooseitem"  value="<%=chooseitem%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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
	if(	!radioChecked(FormName.sjsfycx)) {
		alert("��ѡ��[�����Ƿ��д���]��");
		FormName.sjsfycx[0].focus();
		return false;
	}

	if (FormName.sjsfycx[1].checked || FormName.sjsfycx[2].checked)
	{
		if(	javaTrim(FormName.cxsjcj)=="") {
			alert("������[�����������]��");
			FormName.cxsjcj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxsjcj, "�����������"))) {
			return false;
		}

		if(	javaTrim(FormName.cxkssj)=="") {
			alert("������[������ʼʱ��]��");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjssj)=="") {
			alert("������[��������ʱ��]��");
			FormName.cxjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjssj, "��������ʱ��"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjssj.value)
		{
			alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
			FormName.cxjssj.select();
			return false;
		}
	}
	else{
		FormName.cxsjcj.value="";
		FormName.cxkssj.value="";
		FormName.cxjssj.value="";
	}

	
	FormName.action="SavePlxgcx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
