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
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertDm_sgdjscsb.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%> 
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%">
  <select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <option value="1">��һ��</option>
    <option value="2">�ڶ���</option>
    <option value="3">������</option>
    <option value="4">���Ĵ�</option>
    <option value="5">�����</option>
    <option value="6">������</option>
    <option value="7">���ߴ�</option>
    <option value="8">�ڰ˴�</option>
    <option value="9">�깤����</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td><select name="bfjs" style="FONT-SIZE:12PX;WIDTH:232PX">
    <OPTION value=""></OPTION>
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm order by jsjsbm","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="bfbl" value="" size="10" maxlength="9" >
% </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���ʩ���Ӽ������</td>
  <td><%
	cf.radioToken(out, "sgdjbxg","Y+��&N+��","");
%></td>
  <td align="right"><span class="STYLE1">*</span>�Ƿ��깤����</td>
  <td><%
	cf.radioToken(out, "sfwgjs","Y+��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td rowspan="2" align="right"><span class="STYLE1">*</span>ˮ��·���㷽ʽ</td>
  <td rowspan="2"><%
	cf.radioToken(out, "sdljsfs","1+����������<BR>&2+�����������ɸ�<BR>&3+���������ɸ�<BR>&4+�ֹ�¼�������","");
%></td>
  <td align="right">ˮ��·ȡֵ</td>
  <td><%
	cf.radioToken(out, "sdlqz","1+��ǰ&2+�ۺ�&3+ʩ���ɱ���","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ˮ��·��������</td>
  <td><input type="text" name="sdlbfbl" value="" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td rowspan="5" align="right"><font color="#FF0000">*</font>���������ʽ</td>
  <td rowspan="5"><%
	cf.radioToken(out, "zjxjffs","1+������<BR>&2+�ۼ��ۺ���������<BR>&3+�ۼ�������ʩ���ɱ�<BR>&4+�ۺ������������<BR>&5+����ʩ���ɱ�����ʩ���ɱ�<BR>&6+����ʩ���ɱ��ۺ������<BR>&7+�ۺ����������ʩ���ɱ�","");
%></td>
  <td align="right">�����������Χ</td>
  <td><%
	cf.radioToken(out, "zjxbhfw","1+����&2+������&3+���̣�������<br>&4+����(��ˮ��)&5+���̣�������(��ˮ��)","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������ʱ���</td>
  <td><%
	cf.radioToken(out, "zjxsjd","1+ȫ��&2+����ǰ&3+������","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ۼ�������ϵ��</td>
  <td><input name="ljzjxxs" type="text" value="0" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ϵ��</td>
  <td><input type="text" name="zxxs" value="0" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ϵ��</td>
  <td><input type="text" name="jxxs" value="0" size="10" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����ڷ��⳥��</td>
  <td><%
	cf.radioToken(out, "sfkyqpc","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ����</td>
  <td><%
	cf.radioToken(out, "zcsfjs","1+������&2+����������&3+�˹�¼��","");
%></td>
  <td align="right">���Ľ���ȡ��ʽ</td>
  <td><%
	cf.radioToken(out, "zcjehqfs","1+�Զ���ȡ&2+�˹�¼��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���Ľ���������޸�</td>
  <td><%
	cf.radioToken(out, "zcjsblkg","1+���޸�&2+�����޸�","");
%></td>
  <td align="right">���Ľ������</td>
  <td><input type="text" name="zcjsbl" value="0" size="10" maxlength="9" >
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" rowspan="2" align="right"><span class="STYLE1">*</span>�Ƿ���ʱ���</td> 
  <td width="32%" rowspan="2"><%
	cf.radioToken(out, "sfkzbj","Y+���ʱ���������ɸ�<BR>&M+���ʱ�������ɸ�<BR>&N+�����ʱ���","");
%></td>
  <td align="right" width="18%">���ʱ������</td> 
  <td width="32%"><input type="radio" name="kzbjjs"  value="1">
�������
  <input type="radio" name="kzbjjs"  value="2">
�����ܶ�</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���ʱ������</td>
  <td><input type="text" name="kzbjbl" value="" size="10" maxlength="9" >
%</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td> 
  <td width="32%"> 
    <input type="radio" name="sfkclk"  value="Y">��
    <input type="radio" name="sfkclk"  value="N">��  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�۹�����Ʒ</td> 
  <td width="32%"> 
    <input type="radio" name="sfkgdyp"  value="Y">��
    <input type="radio" name="sfkgdyp"  value="N">��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѹ�����</td>
  <td><input type="radio" name="sfkyfgf"  value="Y">��
      <input type="radio" name="sfkyfgf"  value="N">�� </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�۸��ķ���</td>
  <td><%
	cf.radioToken(out, "sfkclfk","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�۲����˷�</td>
  <td><%
	cf.radioToken(out, "sfkclyf","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�����Ŀۿ�</td>
  <td><%
	cf.radioToken(out, "sfkzckk","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�����Ľ���</td>
  <td><%
	cf.radioToken(out, "sfjzcjl","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�۷�����</td>
  <td><%
	cf.radioToken(out, "sfkfkje","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ӽ������</td>
  <td><%
	cf.radioToken(out, "sfjjlje","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td><%
	cf.radioToken(out, "sfjqtje","Y+�Զ���ȡ&S+�˹�¼��&N+��","");
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>������ϼưٷֱ�</td>
  <td colspan="3"><input name="lkhjbfb" type="text" value="100" size="10" maxlength="9" >
    %&nbsp;&nbsp;&nbsp;&nbsp;���Ͽ�+������Ʒ+������&lt;=��������*������ϼưٷֱ�</td>
</tr>
<tr bgcolor="#CCCCCC">
  <td height="23" colspan="4" align="center">��������</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ҫ�����㸶�����</td>
  <td><input name="fkbl" type="text" value="100" size="10" maxlength="9" >
%</td>
  <td rowspan="2" align="right"><span class="STYLE1">*</span>Ҫ�����㹤�̽���</td>
  <td rowspan="2"><select name="gcjdbm" size="5" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm where gcjdbm!='7' order by gcjdbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ���������</td>
  <td><input type="radio" name="sksh" value="Y">�����
    <input type="radio" name="sksh" value="N">�������</td>
  </tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="button3" type="button" onClick="f_lr(insertform)"  value="����������">
    <input name="button" type="button" onClick="f_lr(insertform)"  value="���ʱ������">
    <input name="button" type="button" onClick="f_jbtz(insertform)"  value="ʩ���Ӽ�����������">
    <input name="button2" type="button" onClick="f_zbjtz(insertform)"  value="�ʱ�����������">
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bfjs)=="") {
		alert("������[��������]��");
		FormName.bfjs.focus();
		return false;
	}
	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("��ѡ��[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs[0].focus();
		return false;
	}
	if (FormName.sdljsfs[0].checked)
	{
		notRadio(FormName.sdlqz);
		FormName.sdlbfbl.value="0";
	}
	else 
	{
		if(	!radioChecked(FormName.sdlqz)) {
			alert("��ѡ��[ˮ��·ȡֵ]��");
			FormName.sdlqz[0].focus();
			return false;
		}

		if(	javaTrim(FormName.sdlbfbl)=="") {
			alert("������[ˮ��·��������]��");
			FormName.sdlbfbl.focus();
			return false;
		}
		if(!(isFloat(FormName.sdlbfbl, "ˮ��·��������"))) {
			return false;
		}
	}

	if(	!radioChecked(FormName.zcsfjs)) {
		alert("��ѡ��[�����Ƿ����]��");
		FormName.zcsfjs[0].focus();
		return false;
	}

	if (FormName.zcsfjs[0].checked)
	{
		FormName.zcjehqfs[0].checked=true;
		FormName.zcjsblkg[1].checked=true;
		FormName.zcjsbl.value="0";
	}
	else if (FormName.zcsfjs[1].checked)
	{
		if(	!radioChecked(FormName.zcjehqfs)) {
			alert("��ѡ��[���Ľ���ȡ��ʽ]��");
			FormName.zcjehqfs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zcjsblkg)) {
			alert("��ѡ��[���Ľ���������޸�]��");
			FormName.zcjsblkg[0].focus();
			return false;
		}

		if(	javaTrim(FormName.zcjsbl)=="") {
			alert("������[���Ľ������]��");
			FormName.zcjsbl.focus();
			return false;
		}
		if(!(isFloat(FormName.zcjsbl, "���Ľ������"))) {
			return false;
		}
	}
	else
	{
		if(	!radioChecked(FormName.zcjehqfs)) {
			alert("��ѡ��[���Ľ���ȡ��ʽ]��");
			FormName.zcjehqfs[0].focus();
			return false;
		}

		FormName.zcjsblkg[1].checked=true;
		FormName.zcjsbl.value="0";
	}


	if(	!radioChecked(FormName.sfkzbj)) {
		alert("��ѡ��[�Ƿ���ʱ���]��");
		FormName.sfkzbj[0].focus();
		return false;
	}

	if (FormName.sfkzbj[2].checked)
	{
		notRadio(FormName.kzbjjs);
		FormName.kzbjbl.value="0";
	}
	else
	{
		if(	!radioChecked(FormName.kzbjjs)) {
			alert("��ѡ��[���ʱ������]��");
			FormName.kzbjjs[0].focus();
			return false;
		}
		if(	javaTrim(FormName.kzbjbl)=="") {
			alert("������[���ʱ������]��");
			FormName.kzbjbl.focus();
			return false;
		}
		if(!(isFloat(FormName.kzbjbl, "���ʱ������"))) {
			return false;
		}
	}


	if(	!radioChecked(FormName.sfkclk)) {
		alert("��ѡ��[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkgdyp)) {
		alert("��ѡ��[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyfgf)) {
		alert("��ѡ��[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sgdjbxg)) {
		alert("��ѡ��[�Ƿ���ʩ���Ӽ������]��");
		FormName.sgdjbxg[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.zjxjffs)) {
		alert("��ѡ��[���������ʽ]��");
		FormName.zjxjffs[0].focus();
		return false;
	}

	if (FormName.zjxjffs[0].checked)
	{
		FormName.ljzjxxs.value="0";
		FormName.zxxs.value="0";
		FormName.jxxs.value="0";
		notRadio(FormName.zjxbhfw);
		notRadio(FormName.zjxsjd);
	}
	else if (FormName.zjxjffs[1].checked || FormName.zjxjffs[2].checked)
	{
		if(	!radioChecked(FormName.zjxbhfw)) {
			alert("��ѡ��[�����������Χ]��");
			FormName.zjxbhfw[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zjxsjd)) {
			alert("��ѡ��[������ʱ���]��");
			FormName.zjxsjd[0].focus();
			return false;
		}
		if(	javaTrim(FormName.ljzjxxs)=="") {
			alert("������[�ۼ�������ϵ��]��");
			FormName.ljzjxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.ljzjxxs, "�ۼ�������ϵ��"))) {
			return false;
		}

		if (parseFloat(FormName.ljzjxxs.value)<=0)
		{
			alert("����[�ۼ�������ϵ��]�������0");
			FormName.ljzjxxs.select();
			return false;
		}

		FormName.zxxs.value="0";
		FormName.jxxs.value="0";
	}
	else if (FormName.zjxjffs[3].checked || FormName.zjxjffs[4].checked || FormName.zjxjffs[5].checked || FormName.zjxjffs[6].checked)
	{
		if(	!radioChecked(FormName.zjxbhfw)) {
			alert("��ѡ��[�����������Χ]��");
			FormName.zjxbhfw[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zjxsjd)) {
			alert("��ѡ��[������ʱ���]��");
			FormName.zjxsjd[0].focus();
			return false;
		}

		FormName.ljzjxxs.value="0";

		if(	javaTrim(FormName.zxxs)=="") {
			alert("������[����ϵ��]��");
			FormName.zxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.zxxs, "����ϵ��"))) {
			return false;
		}

		if (parseFloat(FormName.zxxs.value)<=0)
		{
			alert("����[����ϵ��]�������0");
			FormName.zxxs.select();
			return false;
		}
		if(	javaTrim(FormName.jxxs)=="") {
			alert("������[����ϵ��]��");
			FormName.jxxs.focus();
			return false;
		}
		if(!(isFloat(FormName.jxxs, "����ϵ��"))) {
			return false;
		}

		if (parseFloat(FormName.jxxs.value)<=0)
		{
			alert("����[����ϵ��]�������0");
			FormName.jxxs.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfkclfk)) {
		alert("��ѡ��[�Ƿ�۸��ķ���]��");
		FormName.sfkclfk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkclyf)) {
		alert("��ѡ��[�Ƿ�۲����˷�]��");
		FormName.sfkclyf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkzckk)) {
		alert("��ѡ��[�Ƿ�����Ŀۿ�]��");
		FormName.sfkzckk[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjzcjl)) {
		alert("��ѡ��[�Ƿ�����Ľ���]��");
		FormName.sfjzcjl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkfkje)) {
		alert("��ѡ��[�Ƿ�۷�����]��");
		FormName.sfkfkje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjjlje)) {
		alert("��ѡ��[�Ƿ�ӽ������]��");
		FormName.sfjjlje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfjqtje)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfjqtje[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkyqpc)) {
		alert("��ѡ��[�Ƿ�����ڷ��⳥��]��");
		FormName.sfkyqpc[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.sfwgjs)) {
		alert("��ѡ��[�Ƿ��깤����]��");
		FormName.sfwgjs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lkhjbfb)=="") {
		alert("������[������ϼưٷֱ�]��");
		FormName.lkhjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.lkhjbfb, "������ϼưٷֱ�"))) {
		return false;
	}
	if (parseFloat(FormName.lkhjbfb.value)<0 || parseFloat(FormName.lkhjbfb.value)>100)
	{
		alert("����[������ϼưٷֱ�]Ӧ��0��100֮��");
		FormName.lkhjbfb.focus();
		return false;
	}


	if(	javaTrim(FormName.fkbl)=="") {
		alert("������[Ҫ�����㸶�����]��");
		FormName.fkbl.focus();
		return false;
	}
	if(!(isFloat(FormName.fkbl, "Ҫ�����㸶�����"))) {
		return false;
	}
	if (parseFloat(FormName.fkbl.value)<0 || parseFloat(FormName.fkbl.value)>100)
	{
		alert("����[Ҫ�����㸶�����]Ӧ��0��100֮��");
		FormName.fkbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sksh)) {
		alert("��ѡ��[�����Ƿ���������]��");
		FormName.sksh[0].focus();
		return false;
	}

	if(	!selectChecked(FormName.gcjdbm)) {
		alert("������[Ҫ�����㹤�̽���]��");
		FormName.gcjdbm.focus();
		return false;
	}


	FormName.action="SaveInsertDm_sgdjscsb.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_kzbjbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_jbtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_jbtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_zbjtz(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("��ѡ��[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}

	FormName.action="InsertDm_zbjtjsbl.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
