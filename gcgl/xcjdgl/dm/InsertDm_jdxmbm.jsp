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
<form method="post" action="SaveInsertDm_jdxmbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="jdxmbm" value="" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="jdxmmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ͱ���</td> 
  <td width="35%"> 
    <select name="jdlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdlxbm,jdlxmc from dm_jdlxbm order by jdlxbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">����ȷ������</td> 
  <td width="35%"> 
    <select name="jdqrlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdqrlx,jdqrlxmc from dm_jdqrlx order by jdqrlx","");
%>
    </select>
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
	if(	javaTrim(FormName.jdxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.jdxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.jdxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jdlxbm)=="") {
		alert("��ѡ��[�������ͱ���]��");
		FormName.jdlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jdqrlx)=="") {
		alert("��ѡ��[����ȷ������]��");
		FormName.jdqrlx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>