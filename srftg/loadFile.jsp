<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����ļ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<CENTER>
  <form method="post" action="" name="onloadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>�ļ�����</b></td>
      </tr>
      <tr> 
        <td align="right" height="2" width="30%">�����ļ����Ŀ¼</td>
        <td width="70%" height="2"> 
          <input type="text" name="path" size="60">
        </td>
      </tr>
      <tr> 
        <td width="30%" height="2" align="right">�����ļ�</td>
        <td width="70%" height="2"> 
          <input type="file" name="loadname" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="�����ļ�" onclick="f_onload(onloadform)">
          </p>
        </td>
      </tr>
    </table>
</form>

  <form method="post" action="" name="downloadform" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>�ļ�����</b></td>
      </tr>
      <tr> 
        <td width="30%" height="2" align="right">�����ļ�Ŀ¼</td>
        <td width="70%" height="2"> 
          <input type="text" name="path2" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="�����ļ�" onClick="f_download(downloadform)">
          </p>
        </td>
      </tr>
    </table>
</form>

</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onload(FormName)
{
	if(	javaTrim(FormName.path)=="") {
		alert("��ѡ��[�����ļ����Ŀ¼]��");
		FormName.path.focus();
		return false;
	}
	if(	javaTrim(FormName.loadname)=="") {
		alert("��ѡ��[�����ļ�]��");
		FormName.loadname.focus();
		return false;
	}
	FormName.action="saveloadFile.jsp";
	FormName.submit();
	return true;
} 
function f_download(FormName)
{
	if(	javaTrim(FormName.path2)=="") {
		alert("��ѡ��[�����ļ�Ŀ¼]��");
		FormName.path.focus();
		return false;
	}

	FormName.action="viewFile.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>