<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_bzrwbmCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right">�������</td>
    <td><select name="dm_bzrwbm_rwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm","");
%>
      </select>    </td>
    <td align="right">ժҪ����</td>
    <td><select name="zyrwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm","");
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td width="32%"> 
    <input type="text" name="dm_bzrwbm_rwbm" size="20" maxlength="4" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="dm_bzrwbm_rwmc" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�������</td> 
  <td colspan="3"> 
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="1">��ǰ����
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="2">�º�����
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="3">��ǰ�º�����
    <INPUT type="radio" name="dm_bzrwbm_bjlb" value="9">һ���¼  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ǰ�������� ��</td>
  <td><input type="text" name="dm_bzrwbm_sqtxts" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="dm_bzrwbm_sqtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�º��������� �� </td>
  <td><input type="text" name="dm_bzrwbm_shtxts" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="dm_bzrwbm_shtxts2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�Ӱ���������</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_sfyxhxgq" value="Y">
    ��
      <input type="radio" name="dm_bzrwbm_sfyxhxgq" value="N">
      �� </td>
  <td align="right" width="18%">�Ƿ�Ӱ�츴��</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_sfyxfc" value="Y">
    ��
      <input type="radio" name="dm_bzrwbm_sfyxfc" value="N">
      �� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�������</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_sfxys" value="Y">
    ��
      <input type="radio" name="dm_bzrwbm_sfxys" value="N">
      �� </td>
  <td align="right" width="18%">�ص�������</td> 
  <td width="32%"><input type="radio" name="dm_bzrwbm_zdjkrw" value="1">
    �ص���
      <input type="radio" name="dm_bzrwbm_zdjkrw" value="2">
      ���ص��� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�Ϊ��̱�</td>
  <td><input type="radio" name="sfwlcb"  value="Y">
��
  <input type="radio" name="sfwlcb"  value="N">
�� </td>
  <td align="right">�Ƿ��漰��Ʒ��Ϣ</td>
  <td><input type="radio" name="sjcpxx"  value="Y">
��
  <input type="radio" name="sjcpxx"  value="N">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input name="rwxh" type="text" value="" size="20" maxlength="8" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr align="center"> 
  <td colspan="4"> 
    <input type="button"  value="��ѯ" onClick="f_do(selectform)">
    <input type="reset"  value="����">  </td>
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
	if(!(isNumber(FormName.dm_bzrwbm_sqtxts, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_bzrwbm_sqtxts2, "��ǰ��������"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_bzrwbm_shtxts, "�º���������"))) {
		return false;
	}
	if(!(isNumber(FormName.dm_bzrwbm_shtxts2, "�º���������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
