<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���̿ۿ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
 <form method="post" action="" name="selectform">
  <table width="100%">
    <tr> 
      <td width="37%" height="287" > 
        <div align="center"> 
          <p>&nbsp; </p>
        </div>
      </td>
      <td width="63%" height="287" > 
        <p>&nbsp; </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p> 
          <input type="radio" name="xzlx" value="1" onclick="f_do(selectform)">
          �����ʩ�����ڷ����Ĺ�����������</p>
        <p>&nbsp;</p>
        <p> 
          <input type="radio" name="xzlx" value="2" onclick="f_do(selectform)">
          ���㵥�������깤�ͻ����㵥��</p>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="44" align="center" > 
        <input type="button" name="Button" value=" ¼ �� " onclick="f_do(selectform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//����FormName:Form������
{
	if(	!radioChecked(FormName.xzlx)) {
		alert("��ѡ��[���������㵥]��");
		FormName.xzlx[0].focus();
		return false;
	}

	if (FormName.xzlx[0].checked)
	{
		FormName.action="/gcgl/zjx/SelectCxCrm_khxx.jsp";
	}
	else{
		FormName.action="/jsgl/khjs/SelectCxCrm_khxx.jsp";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
