<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>

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

<form method="post" action="Jdatawindow_noteList.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">DataWindow����</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dw_name" size="20" maxlength="40" >
              </td>
              <td width="18%"> 
                <div align="right">DataWindow˵��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dw_note" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">DataWindow SQL</div>
              </td>
              <td width="33%"> 
                <input type="text" name="dw_sql" size="20" maxlength="400" >
              </td>
              <td width="18%"> 
                <div align="right">WhereSQL</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dw_wheresql" size="20" maxlength="400" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="��ѯ" onClick="submit_onclick(selectform)">
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
function submit_onclick(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
