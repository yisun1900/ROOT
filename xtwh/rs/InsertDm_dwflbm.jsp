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
<form method="post" action="SaveInsertDm_dwflbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��λ�������</td>
      <td width="35%"> 
        <input type="text" name="dwflbm" value="" size="20" maxlength="2" >
      </td>
      <td align="right" width="15%">��λ��������</td>
      <td width="35%"> 
        <input type="text" name="dwflmc" value="" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��λ����</td>
      <td width="35%"> 
        <input type="radio" name="dwdl"  value="1">
        ҵ������ 
        <input type="radio" name="dwdl"  value="2">
        ��ҵ������ </td>
      <td align="right" width="15%">ͳ�Ʒ���</td>
      <td width="35%">
        <select name="dwtjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwtjflbm,dwtjflmc from dm_dwtjflbm order by dwtjflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ְ��Χ</td>
      <td colspan="3"> 
        <textarea name="zzfw" cols="72" rows="12"></textarea>
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwflbm)=="") {
		alert("������[��λ�������]��");
		FormName.dwflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwflmc)=="") {
		alert("������[��λ��������]��");
		FormName.dwflmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.dwdl)) {
		alert("��ѡ��[��λ����]��");
		FormName.dwdl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dwtjflbm)=="") {
		alert("������[ͳ�Ʒ���]��");
		FormName.dwtjflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
