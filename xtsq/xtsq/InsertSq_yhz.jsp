<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
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
    <td width="1%">&nbsp;</td>
    <td width="98%"> 
      <div align="center"> ��¼������</div>
    </td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%" height="64">&nbsp;</td>
    <td width="98%" height="64"> 
      <div align="center">

<form method="post" action="SaveInsertSq_yhz.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�û�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhzbh" value="" size="24" maxlength="6" >
              </td>
              <td width="15%"> 
                <div align="right">�û�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yhzmc" value="" size="24" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">����</td>
              <td colspan="3">
<%
	cf.radioToken(out, "jb","1+��ͨ&9+����&2+��Ӧ��","");
%>
			  
			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" valign="top"> 
                <div align="right">�û�������</div>
              </td>
              <td colspan="3"> 
                <textarea name="yhzms" cols="60" rows="5"></textarea>
              </td>
            </tr>
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="submit_onclick(insertform)">
                  &nbsp;&nbsp;&nbsp;&nbsp; </div>
              </td>
              <td width="15%" height="2" align="left"> &nbsp;&nbsp;&nbsp;&nbsp; 
                <input type="reset"  value="����" name="reset">
              </td>
              <td width="35%" height="2">&nbsp; </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
    <td width="1%" height="64">&nbsp;</td>
  </tr>
  <tr>
    <td width="1%">&nbsp;</td>
    <td width="98%">&nbsp;</td>
    <td width="1%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function submit_onclick(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yhzbh)=="") {
		alert("������[�û�����]��");
		FormName.yhzbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yhzmc)=="") {
		alert("������[�û�������]��");
		FormName.yhzmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.jb)) {
		alert("��ѡ��[����]��");
		FormName.jb[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
