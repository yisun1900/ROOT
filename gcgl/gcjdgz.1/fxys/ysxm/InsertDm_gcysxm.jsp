<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_gcysxm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������Ŀ����</td>
  <td width="31%"><select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="gcysxmbm.value=this.value">
    <option value=""></option>
    <%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
%>
  </select></td>
  <td width="19%" align="right"><span class="STYLE1">*</span>������Ŀ����(4λ)</td>
  <td width="31%"><input type="text" name="gcysxmbm" value="" size="20" maxlength="4" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%"><span class="STYLE1">*</span>������Ŀ����</td> 
  <td colspan="3"><input type="text" name="gcysxmmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�ط�</td>
  <td><%
		cf.radioToken(out, "sfhf","Y+��&N+��","");
%></td>
  <td align="right">�ط�����</td>
  <td><select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <option value=""></option>
    <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' order by hflxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ���̽���</td>
  <td><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:151PX">
    <option value=""></option>
    <%
		cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>�ۼƼ�װ�տ�ٷֱ�</td>
  <td><input type="text" name="ljskbfb" size="10" maxlength="8"  value="" >
  %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
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
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.ysxmflbm)=="") {
		alert("��ѡ��[������Ŀ����]��");
		FormName.ysxmflbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhf)) {
		alert("������[�Ƿ�ط�]��");
		FormName.sfhf[0].focus();
		return false;
	}
	if (FormName.sfhf[0].checked)
	{
		if(	javaTrim(FormName.hflxbm)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hflxbm.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.hflxbm)!="") {
			alert("����طã�");
			FormName.hflxbm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.ljskbfb)=="") {
		alert("��ѡ��[�ۼƼ�װ�տ�ٷֱ�]��");
		FormName.ljskbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.ljskbfb, "�ۼƼ�װ�տ�ٷֱ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
