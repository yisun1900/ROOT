<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�ձ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0">
    <tr> 
      <td colspan="2" height="64"> 
        <div align="center">��Ϣ��Դ����</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="39">ʱ�䷶Χ ��</td>
      <td width="58%" height="39"> 
        <input type="text" name="sjfw" size="20" maxlength="10" value="2004-04-20">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="40">��</td>
      <td width="58%" height="40"> 
        <input type="text" name="sjfw2" size="20" maxlength="10"  value="<%=cf.today()%>">
      </td>
    </tr>
    <tr> 
      <td align="right" width="42%" height="37">ͼ������</td>
      <td width="58%" height="37"> 
        <select name="txlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value="����ͼ">����ͼ</option>
          <option value="��ͼ">��ͼ</option>
          <option value="��״ͼ">��״ͼ</option>
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  value="ͳ��" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjfw)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw, "ʱ�䷶Χ "))) {
		return false;
	}
	if(	javaTrim(FormName.sjfw2)=="") {
		alert("������[ʱ�䷶Χ ]��");
		FormName.sjfw2.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjfw2, "ʱ�䷶Χ "))) {
		return false;
	}

	FormName.action="gctsyytjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
