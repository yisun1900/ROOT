<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ʦͳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">�ͻ���������ͳ��</div>
      </td>
    </tr>
    <tr> 
      <td align="right" width="22%" height="37">ѡ��ͳ��ʱ��</td>
      <td height="37" width="28%"> 
        <select name="nian" style="FONT-SIZE:12PX;WIDTH:80PX" >
          <%
	cf.selectToken(out,"2005+2005��&2006+2006��&2007+2007��&2008+2008��&2009+2009��&2010+2010��&2011+2011��&2012+2012��&2013+2013��&2014+2014��&2015+2015��&2016+2016��&2017+2017��&2018+2018��&2019+2019��&2020+2020��&2021+2021��&2022+2022��&2023+2023��",cf.today("YYYY"));
%> 
        </select>
        �� </td>
      <td height="37" colspan="2" width="50%"> 
        <input type="radio" name="yue" value="01">
        һ��<br>
        <input type="radio" name="yue" value="02">
        ����<br>
        <input type="radio" name="yue" value="03">
        ����<br>
        <input type="radio" name="yue" value="04">
        ����<br>
        <input type="radio" name="yue" value="05">
        ����<br>
        <input type="radio" name="yue" value="06">
        ����<br>
        <input type="radio" name="yue" value="07">
        ����<br>
        <input type="radio" name="yue" value="08">
        ����<br>
        <input type="radio" name="yue" value="09">
        ����<br>
        <input type="radio" name="yue" value="10">
        ʮ��<br>
        <input type="radio" name="yue" value="11">
        ʮһ��<br>
        <input type="radio" name="yue" value="12">
        ʮ����</td>
    </tr>
    <tr align="center"> 
      <td height="71" colspan="4"> 
        <input type="button"  value="����" onClick="f_do(selectform)">
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
	if(	javaTrim(FormName.nian)=="") {
		alert("������[��]��");
		FormName.nian.focus();
		return false;
	}
	if(	!radioChecked(FormName.yue)) {
		alert("��ѡ��[�·�]��");
		FormName.yue[0].focus();
		return false;
	}

	FormName.action="EnterKhjltj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>