<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertTc_csrjygjmj.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>����</td> 
  <td width="32%"> 
    <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dm_dqbm.dqbm","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dm_dqbm.dqbm,dm_dqbm.dqmc from sq_dwxx,dm_dqbm where sq_dwxx.dqbm=dm_dqbm.dqbm and dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%> 
    </select>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>���ۼ���</td> 
  <td width="32%"> 
    <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��Ʒ����</td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldllb in('1','3') order by cldlmc","");
%>
  </select></td>
  <td align="right"><font color="#FF0000">*</font>��Ʒ���</td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�Ƿ�Ҫ����ͬƷ��</td> 
  <td width="32%"> 
    <input type="radio" name="sfyqxtpp"  value="Y">��
    <input type="radio" name="sfyqxtpp"  value="N">��  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font>������λ</td> 
  <td width="32%"> 
    <select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�Ƿ�ɼ���</td> 
  <td width="32%"><input type="radio" name="sfkjm"  value="1">
    ���ɼ���
      <input type="radio" name="sfkjm"  value="2">
      �ɼ��� </td>
  <td align="right" width="18%">���ⵥ��</td> 
  <td width="32%"><input type="text" name="jmdj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td colspan="3"><input type="radio" name="sfxzsl"  value="1">
    ������
    <input type="radio" name="sfxzsl"  value="2">
    ������
    <input type="radio" name="sfxzsl"  value="3">
    ���������շ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�����׼���</td>
  <td><input type="text" name="fjbzmj" value="" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>��Ӧ�¹�ƽ��</td>
  <td><input type="text" name="dyygpm" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>ÿƽ���������</td>
  <td><input type="text" name="pmzjmj" value="" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ײ��ڱ�־</td>
  <td><input type="radio" name="tcnbz"  value="Y">
    �ײ���
    <input type="radio" name="tcnbz"  value="N">
    �ײ���</td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
  <td><input type="radio" name="sfbxx"  value="Y">
    ��ѡ��
    <input type="radio" name="sfbxx"  value="N">
    ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
  <td><input type="text" name="lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
  <td><input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tccplbbm, "��Ʒ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}
	if(!(isNumber(FormName.tccpdlbm, "��Ʒ����"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("��ѡ��[�Ƿ�Ҫ����ͬƷ��]��");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ�ɼ���]��");
		FormName.sfkjm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jmdj)=="") {
		alert("������[���ⵥ��]��");
		FormName.jmdj.focus();
		return false;
	}
	if(!(isFloat(FormName.jmdj, "���ⵥ��"))) {
		return false;
	}
	if(	javaTrim(FormName.fjbzmj)=="") {
		alert("������[�����׼���]��");
		FormName.fjbzmj.focus();
		return false;
	}
	if(!(isFloat(FormName.fjbzmj, "�����׼���"))) {
		return false;
	}
	if(	javaTrim(FormName.dyygpm)=="") {
		alert("������[��Ӧ�¹�ƽ��]��");
		FormName.dyygpm.focus();
		return false;
	}
	if(!(isNumber(FormName.dyygpm, "��Ӧ�¹�ƽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.pmzjmj)=="") {
		alert("������[ÿƽ���������]��");
		FormName.pmzjmj.focus();
		return false;
	}
	if(!(isFloat(FormName.pmzjmj, "ÿƽ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfxzsl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.tcnbz)) {
		alert("��ѡ��[�ײ��ڱ�־]��");
		FormName.tcnbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
