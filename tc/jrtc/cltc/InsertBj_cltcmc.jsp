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
<form method="post" action="SaveInsertBj_cltcmc.jsp" name="insertform" target="_blank">
<div align="center">¼�룭�����ײ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ײ�����</td> 
  <td colspan="3"><input type="text" name="tcmc" value="" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ײͼ۸�</td> 
  <td width="32%"><input type="text" name="tcjg" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ���ѡ��</td>
  <td><input type="radio" name="zcsfxxz" value="1">
�Զ�ѡ��
  <input type="radio" name="zcsfxxz" value="2">
�˹�ѡ�� </td>
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input name="lx" type="radio" value="1" checked>
�����ײ�</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="lr" type="button" onClick="f_lrmx(insertform)"  value="¼�뷿������" disabled>
	<input name="ck" type="button" onClick="f_ckmx(insertform)"  value="�鿴��������" >
	<input type="reset"  value="����" name="reset"></td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcjg)=="") {
		alert("������[�ײͼ۸�]��");
		FormName.tcjg.focus();
		return false;
	}
	if(!(isFloat(FormName.tcjg, "�ײͼ۸�"))) {
		return false;
	}
	if(	!radioChecked(FormName.zcsfxxz)) {
		alert("��ѡ��[�����Ƿ���ѡ��]��");
		FormName.zcsfxxz[0].focus();
		return false;
	}
/*
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
*/
	FormName.action="SaveInsertBj_cltcmc.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}
function f_lrmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="InsertBj_cltcfjsl.jsp";
	FormName.submit();
	return true;
}



function f_ckmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	FormName.action="Bj_cltcfjslList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
