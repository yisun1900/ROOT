<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_heysxm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���հ汾��</td> 
  <td width="32%"> 
    <select name="gcysbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gcysbbh,gcysbbmc from dm_hegcysbb order by gcysbbh","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������Ŀ����</td>
  <td><input type="text" name="gcysxmbm" value="" size="20" maxlength="4" ></td>
  <td align="right"><span class="STYLE1">*</span>����˳��</td>
  <td><input name="yssx" type="text" id="yssx" value="" size="20" maxlength="4" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������Ŀ����</td> 
  <td colspan="3"> 
    <input type="text" name="gcysxmmc" value="" size="73" maxlength="100" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������Ŀ����</td> 
  <td width="32%"><select name="ysxmflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select ysxmflbm,ysxmflmc from dm_ysxmflbm where ysxmflbm='05'","05");
%>
  </select></td>
  <td align="right" width="18%">��Ӧ���̽���</td> 
  <td width="32%"><select name="dygcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ����ʩ�����ȱ�</td> 
  <td width="32%"><input type="radio" name="sfsgjdb"  value="Y">
    ��
      <input type="radio" name="sfsgjdb"  value="N">
      �� </td>
  <td align="right" width="18%">ʩ�����Ƚ��Ƚڵ�</td> 
  <td width="32%"><select name="jdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select rwbm,rwmc from gdm_rwbm  order by rwbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�ط�</td> 
  <td width="32%"><input type="radio" name="sfhf"  value="Y">
    ����
      <input type="radio" name="sfhf"  value="N">
      �� </td>
  <td align="right" width="18%">�ط�����</td> 
  <td width="32%"><select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">������������</td> 
  <td width="32%"> 
    <input type="text" name="yszxsl" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%">����������</td> 
  <td width="32%"> 
    <input type="text" name="byxsl" value="" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ǳ�������С����</td> 
  <td width="32%"> 
    <input type="text" name="fbyxzxsl" value="" size="20" maxlength="8" >  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�ۼƼ�װ�տ�ٷֱ�</td> 
  <td width="32%"><input type="text" name="ljskbfb" value="" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ŀ����</td>
  <td><%
	cf.radioToken(out, "xmlx","1+������&2+״̬��","");
%></td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ�ѡ��׹�</td>
  <td><%
	cf.radioToken(out, "sfxzjg","Y+ѡ��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ�����ս���</td>
  <td><input type="text" name="ysjj" size="20" maxlength="16"  value="" ></td>
  <td align="right"><span class="STYLE1">*</span>�������ս���</td>
  <td><input type="text" name="zgysjj" size="20" maxlength="16"  value="" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���ձ�׼˵��</td>
  <td colspan="3"><textarea name="ysbzsm" cols="72" rows="9"></textarea></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
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
	if(	javaTrim(FormName.gcysbbh)=="") {
		alert("��ѡ��[���հ汾��]��");
		FormName.gcysbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcysxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.gcysxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yssx)=="") {
		alert("������[����˳��]��");
		FormName.yssx.focus();
		return false;
	}
	if(!(isNumber(FormName.yssx, "yssx"))) {
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
		alert("��ѡ��[�Ƿ�ط�]��");
		FormName.sfhf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.xmlx)) {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmlx[0].focus();
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
	if(	!radioChecked(FormName.sfxzjg)) {
		alert("��ѡ��[�Ƿ�ѡ��׹�]��");
		FormName.sfxzjg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.ljskbfb)=="") {
		alert("��ѡ��[�ۼƼ�װ�տ�ٷֱ�]��");
		FormName.ljskbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.ljskbfb, "�ۼƼ�װ�տ�ٷֱ�"))) {
		return false;
	}

	if(	javaTrim(FormName.ysjj)=="") {
		alert("��ѡ��[Ʒ�����ս���]��");
		FormName.ysjj.focus();
		return false;
	}
	if(!(isFloat(FormName.ysjj, "Ʒ�����ս���"))) {
		return false;
	}
	if(	javaTrim(FormName.zgysjj)=="") {
		alert("��ѡ��[�������ս���]��");
		FormName.zgysjj.focus();
		return false;
	}
	if(!(isFloat(FormName.zgysjj, "�������ս���"))) {
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
