<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Dm_hflxbmList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�ط����ͱ���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hflxbm" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">�ط���������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hflxmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�طô���</div>
  </td>
  <td width="35%"> 
    <select name="hfdl" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value=""></option>
	  <option value="1">��ѯ�ͻ��ط�</option>
	  <option value="2">��ʩ���̻ط�</option>
	  <option value="3">���޿ͻ��ط�</option>
	  <option value="4">Ͷ�߱��޻ط�</option>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�ط�ʱ����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sjjg" size="20" maxlength="8" >
  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">
  </td>
</tr>
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.sjjg, "�ط�ʱ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
