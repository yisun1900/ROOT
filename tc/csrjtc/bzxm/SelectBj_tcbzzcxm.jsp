<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="tc_csrjbzgcxmList.jsp" name="selectform">
<div align="center">�ײͱ�׼������Ŀ��ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><select name="tc_csrjbzgcxm_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right">���ۼ���</td>
  <td><select name="tc_csrjbzgcxm_bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where lx='2' and  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">����</td> 
  <td width="34%"><select name="tc_csrjbzgcxm_hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm","");
%>
  </select></td>
  <td align="right" width="18%">�ṹλ��</td> 
  <td width="32%"><select name="tc_csrjbzgcxm_jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzmc c1,jgwzmc cc from bdm_jgwzbm order by jgwzmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">��Ʒ���</td> 
  <td width="34%"><select name="tc_csrjbzgcxm_tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm order by clxlmc","");
%>
  </select></td>
  <td align="right" width="18%">�Ƿ��ѡ��</td> 
  <td width="32%"><input type="radio" name="sfbxx"  value="Y">
��
  <input type="radio" name="sfbxx"  value="N">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����Ƿ��շ�</td>
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
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ���������</td>
  <td>
	  <input type="radio" name="sfxzsl"  value="1">������Ӽ�
	  <input type="radio" name="sfxzsl"  value="2">���ɳ��� 
	  <input type="radio" name="sfxzsl"  value="3">���������� 
  </td>
  <td align="right">�Ƿ�Ҫ����ͬƷ��</td>
  <td><input type="radio" name="sfyqxtpp"  value="Y">
��
  <input type="radio" name="sfyqxtpp"  value="N">
�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">�Ƿ�ɼ���</td>
  <td><input type="radio" name="sfkjm"  value="1">
    ���ɼ���
    <input type="radio" name="sfkjm"  value="2">
    �ɼ��� </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������������ �� </td>
  <td><input type="text" name="yxjmzdsl" value="" size="20" maxlength="17" ></td>
  <td align="right">��</td>
  <td><input type="text" name="yxjmzdsl2" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�ɸ���</td>
  <td><input type="radio" name="sfkgh"  value="1">
    ���ɻ�
    <input type="radio" name="sfkgh"  value="2">
    �ɻ� </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ɻ�������� ��</td>
  <td><input type="text" name="khzdsl" value="" size="20" maxlength="17" ></td>
  <td align="right">��</td>
  <td><input type="text" name="khzdsl2" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� �� </td>
  <td><input type="text" name="tc_csrjbzgcxm_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">�� </td>
  <td><input type="text" name="tc_csrjbzgcxm_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="16%">¼����</td> 
  <td width="34%"><input type="text" name="tc_csrjbzgcxm_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isFloat(FormName.yxjmzdsl, "��������������"))) {
		return false;
	}
	if(!(isFloat(FormName.yxjmzdsl2, "��������������"))) {
		return false;
	}
	if(!(isFloat(FormName.khzdsl, "�ɻ��������"))) {
		return false;
	}
	if(!(isFloat(FormName.khzdsl2, "�ɻ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_csrjbzgcxm_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.tc_csrjbzgcxm_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
