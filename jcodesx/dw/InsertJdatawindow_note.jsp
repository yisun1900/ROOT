<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="txin.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��DataWindow����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJdatawindow_note.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">DataWindow����</div>
              </td>
              <td width="29%"> 
                <input type="text" name="dw_name" value="" size="20" maxlength="40" >
              </td>
              <td width="14%"> 
                <div align="right"></div>
              </td>
              <td width="36%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">DataWindow˵��</td>
              <td colspan="3"> 
                <input type="text" name="dw_note" value="" size="50" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right">DataWindow SQL</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="dw_sql" value="" size="50" maxlength="400" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="button"  value="����DataWindow" onClick="submit_onclick(insertform)">
                <input type="button"  value="ѡ���" onClick="f_xzb(insertform)">
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.dw_name)=="") {
		alert("������[DataWindow����]��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="SaveInsertJdatawindow_note.jsp";
	FormName.submit();
	return true;
}
function f_xzb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dw_name)=="") {
		alert("������[DataWindow����]��");
		FormName.dw_name.focus();
		return false;
	}
	FormName.action="ChooseTable.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
