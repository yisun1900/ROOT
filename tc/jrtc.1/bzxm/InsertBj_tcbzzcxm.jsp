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
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">¼�룭�ײͱ�׼������Ŀ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF">
    <td align="right"><font color="#FF0000">*</font>���۰汾��</td>
    <td colspan="3"><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:525PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') order by bj_dzbjbb.dqbm,sfzybb,bjbbh","");
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.sfzybb in('1','2','3') and bj_dzbjbb.dqbm='"+dqbm+"' order by bj_dzbjbb.dqbm,sfzybb,bjbbh","");
	}
%>
      </select>
    </td>
  </tr>
  
  <tr bgcolor="#E8E8FF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>����</td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm","");
	}
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font>���ۼ���</td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <option value=""></option>
        <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
	%>
      </select>    </td>
  </tr>
<tr bgcolor="#E8E8FF">
  <td width="16%" align="right"><font color="#FF0000">*</font>����</td> 
  <td width="34%"><select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td width="18%" align="right">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#E8E8FF">
  <td width="16%" align="right"><font color="#FF0000">*</font>�ṹλ��</td> 
  <td width="34%"><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc","");
%>
  </select></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>��Ʒ���</td> 
  <td width="32%"><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ��ѡ��</td>
  <td><input type="radio" name="sfbxx"  value="Y">
��
  <input type="radio" name="sfbxx"  value="N">
�� </td>
  <td align="right"><font color="#FF0000">*</font>�Ƿ�Ҫ����ͬƷ��</td>
  <td><input type="radio" name="sfyqxtpp"  value="Y">
��
  <input type="radio" name="sfyqxtpp"  value="N">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�����Ƿ��շ�</td>
  <td><input type="radio" name="sfyxsj"  value="Y">
��
  <input type="radio" name="sfyxsj"  value="N">
�� </td>
  <td align="right">�ײ���������</td>
  <td><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>������λ</td>
  <td><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>�Ƿ���������</td>
  <td>
	  <input type="radio" name="sfxzsl"  value="1">������Ӽ�
	  <input type="radio" name="sfxzsl"  value="2">���ɳ��� 
	  <input type="radio" name="sfxzsl"  value="3">����������  </td>
  <td align="right">��׼����</td>
  <td><input type="text" name="bzsl" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ɼ���</td>
  <td>
	<input type="radio" name="sfkjm"  value="1">���ɼ���
	<input type="radio" name="sfkjm"  value="2">�ɼ���  </td>
  <td align="right">�������</td>
  <td><input type="text" name="jmfl" size="20" maxlength="50"  value="" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���������λ</td>
  <td><select name="jmjldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��������������</td>
  <td><input type="text" name="yxjmzdsl" value="" size="20" maxlength="17" ></td>
  <td align="right">���ⵥ��</td>
  <td><input type="text" name="jmdj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right"><font color="#FF0000">*</font>�Ƿ�ɸ���</td>
  <td>
	<input type="radio" name="sfkgh"  value="1">���ɻ�
	<input type="radio" name="sfkgh"  value="2">�ɻ�  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFCC">
  <td align="right">�ɻ��������</td>
  <td><input type="text" name="khzdsl" value="" size="20" maxlength="17" ></td>
  <td align="right">�����ۼ�</td>
  <td><input type="text" name="ghzj" value="" size="20" maxlength="17" ></td>
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
	<input type="reset"  value="����" name="reset">      
	<input type="button" onClick="f_dr(insertform)"  value="���뱨��">
	<input type="button" onClick="f_dc(insertform)"  value="��������">
	<P>
	<A HREF="�ײͱ�׼������Ŀ.xls"><B>����Ҽ����Ϊ������Excel����ģ��</B></A>	</td>
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
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
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
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbxx)) {
		alert("��ѡ��[�Ƿ��ѡ��]��");
		FormName.sfbxx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyqxtpp)) {
		alert("��ѡ��[�Ƿ�Ҫ����ͬƷ��]��");
		FormName.sfyqxtpp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyxsj)) {
		alert("��ѡ��[�����Ƿ��շ�]��");
		FormName.sfyxsj[0].focus();
		return false;
	}

	if(	javaTrim(FormName.jldw)=="") {
		alert("������[������λ]��");
		FormName.jldw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxzsl)) {
		alert("��ѡ��[�Ƿ���������]��");
		FormName.sfxzsl[0].focus();
		return false;
	}
	if (FormName.sfxzsl[0].checked)
	{
		if(	javaTrim(FormName.bzsl)=="") {
			alert("���������������������[��׼����]��");
			FormName.bzsl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzsl, "��׼����"))) {
			return false;
		}
	}
	else
	{
		FormName.bzsl.value="";
	}

	if(	!radioChecked(FormName.sfkjm)) {
		alert("��ѡ��[�Ƿ�ɼ���]��");
		FormName.sfkjm[0].focus();
		return false;
	}
	if (FormName.sfkjm[1].checked)
	{
		if(	javaTrim(FormName.jmfl)=="") {
			alert("���󣡱�������[�������]��");
			FormName.jmfl.focus();
			return false;
		}
		if(	javaTrim(FormName.jmjldw)=="") {
			alert("���󣡱�������[���������λ]��");
			FormName.jmjldw.focus();
			return false;
		}
		if(	javaTrim(FormName.yxjmzdsl)=="") {
			alert("���󣡱�������[��������������]��");
			FormName.yxjmzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.yxjmzdsl, "��������������"))) {
			return false;
		}
		if(	javaTrim(FormName.jmdj)=="") {
			alert("���󣡱�������[���ⵥ��]��");
			FormName.jmdj.focus();
			return false;
		}
		if(!(isFloat(FormName.jmdj, "���ⵥ��"))) {
			return false;
		}
	}
	else
	{
		FormName.jmfl.value="";
		FormName.jmjldw.value="";
		FormName.yxjmzdsl.value="";
		FormName.jmdj.value="";
	}

	if(	!radioChecked(FormName.sfkgh)) {
		alert("��ѡ��[�Ƿ�ɸ���]��");
		FormName.sfkgh[0].focus();
		return false;
	}
	if (FormName.sfkgh[1].checked)
	{
		if(	javaTrim(FormName.khzdsl)=="") {
			alert("���󣡱�������[�ɻ��������]��");
			FormName.khzdsl.focus();
			return false;
		}
		if(!(isFloat(FormName.khzdsl, "�ɻ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.ghzj)=="") {
			alert("���󣡱�������[�����ۼ�]��");
			FormName.ghzj.focus();
			return false;
		}
		if(!(isFloat(FormName.ghzj, "�����ۼ�"))) {
			return false;
		}
	}
	else
	{
		FormName.khzdsl.value="";
		FormName.ghzj.value="";
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

	FormName.action="SaveInsertBj_tcbzzcxm.jsp";
	FormName.submit();
	return true;
}

function f_dr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="LoadDataZc.jsp";
	FormName.submit();
	return true;
}

function f_dc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="ExpBj_tcbzzcxm.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
