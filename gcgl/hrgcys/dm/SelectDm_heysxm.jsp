<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_heysxmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">���հ汾��</td> 
  <td width="30%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>
  </td>
  <td align="right" width="20%">������Ŀ����</td> 
  <td width="30%"> 
    <input type="text" name="gcysxmbm" size="20" maxlength="4" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">������Ŀ����</td> 
  <td width="30%"> 
    <input type="text" name="gcysxmmc" size="20" maxlength="100" >
  </td>
  <td align="right" width="20%">������Ŀ����</td> 
  <td width="30%"> 
    <select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm order by ysxmflbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��Ӧ���̽���</td> 
  <td width="30%"> 
    <select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
    </select>
  </td>
  <td align="right" width="20%">�Ƿ����ʩ�����ȱ�</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "sfsgjdb","Y+��&N+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">ʩ�����Ƚ��Ƚڵ�</td> 
  <td width="30%"> 
    <select name="jdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm  order by rwbm","");
%>
    </select>
  </td>
  <td align="right" width="20%">�Ƿ�ط�</td> 
  <td width="30%"> 
<%
	cf.radioToken(out, "sfhf","Y+����&N+��","");
%>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�ط�����</td> 
  <td width="30%"> 
    <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%>
    </select>
  </td>
  <td align="right" width="20%">�ۼƼ�װ�տ�ٷֱ�</td> 
  <td width="30%"> 
    <input type="text" name="ljskbfb" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">������������</td> 
  <td width="30%"> 
    <input type="text" name="yszxsl" size="20" maxlength="8" >
  </td>
  <td align="right" width="20%">����������</td> 
  <td width="30%"> 
    <input type="text" name="byxsl" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">�Ǳ�������С����</td> 
  <td width="30%"> 
    <input type="text" name="fbyxzxsl" size="20" maxlength="8" >
  </td>
  <td align="right" width="20%">&nbsp;  </td>
  <td width="30%">&nbsp;  </td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="button" onClick="window.open('EnterCopyXm.jsp')"  value="����������Ŀ">
    <input type="reset"  value="����">
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
	if(!(isFloat(FormName.ljskbfb, "�ۼƼ�װ�տ�ٷֱ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yszxsl, "������������"))) {
		return false;
	}
	if(!(isNumber(FormName.byxsl, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.fbyxzxsl, "�Ǳ�������С����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
