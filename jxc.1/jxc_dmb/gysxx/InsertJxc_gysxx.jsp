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
<%
	String dqbm=(String)session.getAttribute("dqbm");
	String yhjs=(String)session.getAttribute("yhjs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_gysxx.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ӧ������</td> 
  <td colspan="3"><input type="text" name="gysmc" value="" size="50" maxlength="50" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ����</td> 
  <td><%
	cf.radioToken(out,"sfhz","Y+����&N+������","");
%></td>
  <td align="right"><span class="STYLE1">*</span>��Ӧ��������</td>
  <td><%
	cf.radioToken(out,"cllx","1+����&2+����&3+���ļ�����","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where  dqbm='"+dqbm+"'","");
	}
%> 
  </select></td>
  <td align="right"><span class="STYLE1">*</span>��Ӧ������</td>
  <td><select name="gyslx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
	<option value="0">����Ʒ������</option>
	<option value="1">��湩����</option>
	<option value="2">���ù�����</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̸�����</td> 
  <td width="32%"><input type="text" name="gysfzr" value="" size="20" maxlength="20" ></td>
  <td align="right" width="18%">��Ӧ�̵绰</td> 
  <td width="32%"><input type="text" name="gysdh" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̵�ַ</td> 
  <td colspan="3"><input type="text" name="gysdz" value="" size="50" maxlength="100" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������</td>
  <td><input type="text" name="cwdm" value="" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̴���</td> 
  <td width="32%"> 
    <input type="text" name="gyscz" value="" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">E-Mail</td> 
  <td width="32%"> 
    <input type="text" name="email" value="" size="20" maxlength="50" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>  </td>
</tr>
<tr bgcolor="#FFFFCC" align="center">
  <td colspan="4">ϵͳ��Ȩ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ɵ�½ϵͳ��־</td>
  <td><%
	cf.radioToken(out,"kdlxtbz","Y+�ɵ�½&N+���ɵ�½","");
%></td>
  <td width="18%" rowspan="7" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
  <td width="32%" rowspan="7"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="13" multiple>
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' and cxbz='N' order by cxbz,dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx='F0' and cxbz='N' and dqbm='"+dqbm+"' order by cxbz,dwbh","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�û���¼��</td> 
  <td width="32%"> 
    <input type="text" name="yhdlm" value="" size="20" maxlength="16" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�û�����</td>
  <td><input type="text" name="yhkl" value="" size="20" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�û�����</td> 
  <td width="32%"> 
    <input type="text" name="yhmc" value="" size="20" maxlength="20" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�����</td> 
  <td width="32%"><%
	cf.radioToken(out,"sfsd","Y+������&N+δ����","");
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����ʹ������</td>
  <td><input type="text" name="mmsyzq" value="" size="20" maxlength="8" >
�� </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����½ʧ�ܴ���</td> 
  <td width="32%"><input type="text" name="yxdlsbcs" value="" size="20" maxlength="8" ></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="button"  value="¼����ϵ��" onClick="f_lr(editform)" name="lr" >
    <input type="button"  value="�鿴��ϵ��" onClick="f_ck(editform)" name="ck" >
	<input name="sq" disabled type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="�û���Ȩ" ></td>
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
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[��Ӧ������]��");
		FormName.gysmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfhz)) {
		alert("��ѡ��[�Ƿ����]��");
		FormName.sfhz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cllx)) {
		alert("��ѡ��[��Ӧ��������]��");
		FormName.cllx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gyslx)=="") {
		alert("������[��Ӧ������]��");
		FormName.gyslx.focus();
		return false;
	}
	if(!(isNumber(FormName.mmsyzq, "����ʹ������"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "�����½ʧ�ܴ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfsd)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfsd[0].focus();
		return false;
	}
	if(	!selectChecked(FormName.ssfgs)) {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}

	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("��ѡ��[�ɵ�½ϵͳ��־]��");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(FormName.kdlxtbz[0].checked) 
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("������[�û���¼��]��");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhmc.focus();
			return false;
		}
	}
	else{
		FormName.yhdlm.value="";
		FormName.yhkl.value="";
		FormName.yhmc.value="";
	}

	FormName.submit();
	FormName.sq.disabled=false;
	return true;
}
//-->
</SCRIPT>
