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

<form method="post" action="SaveInsertSq_xxtxqd.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ϣ����</div>
  </td>
  <td width="35%"> 
    <select name="xxlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="01">����װ����</option>
    <option value="02">ľ�Ű�װ����</option>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�û���½��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="yhdlm" value="" size="20" maxlength="16" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ǿ����־</div>
  </td>
  <td width="35%"> 
    <select name="qdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="0">��ͨ</option>
    <option value="1">����</option>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xxlx)=="") {
		alert("��ѡ��[��Ϣ����]��");
		FormName.xxlx.focus();
		return false;
	}
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("������[�û���½��]��");
		FormName.yhdlm.focus();
		return false;
	}
	if(	javaTrim(FormName.qdbz)=="") {
		alert("��ѡ��[ǿ����־]��");
		FormName.qdbz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
