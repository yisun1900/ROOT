<%@ page contentType="text/html;charset=GBK" %>
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
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertDm_hflxbm.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <div align="right">�ط����ͱ���              </td>
              <td width="33%"> 
                <input type="text" name="hflxbm" value="" size="20" maxlength="2" >              </td>
              <td width="18%" align="right"> 
                <div align="right">�ط���������              </td>
              <td width="32%"> 
                <input type="text" name="hflxmc" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�Ƿ��Զ�����</td>
              <td><%
	cf.radioToken(out, "sfzdsz","1+�Զ�����&2+�ֶ�����","");
%></td>
              <td align="right">�ط�ʱ����</td>
              <td><input type="text" name="sjjg" value="" size="20" maxlength="8" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <div align="right">�طô���              </td>
              <td width="33%"> 
                <select name="hfdl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="1">��ѯ�ͻ��ط�</option>
                  <option value="2">��ʩ���̻ط�</option>
                  <option value="3">���޿ͻ��ط�</option>
                  <option value="4">Ͷ�߱��޻ط�</option>
                </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
            </tr>
        </table>
</form>
	  
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
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("������[�ط����ͱ���]��");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxmc)=="") {
		alert("������[�ط���������]��");
		FormName.hflxmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hfdl)=="") {
		alert("��ѡ��[�طô���]��");
		FormName.hfdl.focus();
		return false;
	}
	if(!(isNumber(FormName.sjjg, "�ط�ʱ����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
