<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>������Ϣ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="uio" name="insertform" >
  <table width="100%" border="0">
    <tr> 
    <td colspan="2" height="70"> 
      <div align="center">��Ϣ��ѯ</div>
    </td>
  </tr>
  <tr> 
    <td align="right" width="49%"> 
      <input type="radio" name="radiobutton" value="radiobutton">
    </td>
    <td width="51%">���ʦ</td>
  </tr>
  <tr> 
    <td align="right" width="49%"> 
      <input type="radio" name="radiobutton" value="radiobutton">
    </td>
    <td width="51%">ʩ����</td>
  </tr>
  <tr> 
    <td align="right" width="49%"> 
      <input type="radio" name="radiobutton" value="radiobutton">
    </td>
    <td width="51%">С��</td>
  </tr>
  <tr> 
    <td align="right" width="49%"> 
      <input type="radio" name="radiobutton" value="radiobutton">
    </td>
    <td width="51%">����</td>
  </tr>
  <tr> 
    <td colspan="2" height="72"> 
      <div align="center">
        <input type="submit" name="Submit" value="����">
      </div>
    </td>
  </tr>
</table>
</form>
</body>
</html>
