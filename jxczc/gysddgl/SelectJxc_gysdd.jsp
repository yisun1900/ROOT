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
<form method="post" action="Jxc_gysddList.jsp" name="selectform">
<div align="center">�޸Ķ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̶�������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_gysddph" size="20" maxlength="13" >  </td>
  <td align="right" width="18%">�µ���˾</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select  dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ�̱���</td>
  <td><input type="text" name="jxc_gysdd_gysbm" size="20" maxlength="8" ></td>
  <td align="right">��Ӧ������</td>
  <td><input type="text" name="jxc_gysdd_gysmc" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ɹ����</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_cglb" value="J">���Ųɹ�
	<INPUT type="radio" name="jxc_gysdd_cglb" value="D">�ط��ɹ�
  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_cllb" value="0">����
	<INPUT type="radio" name="jxc_gysdd_cllb" value="1">����
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�µ���</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_xdr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�µ����� ��</td>
  <td><input type="text" name="jxc_gysdd_xdrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_gysdd_xdrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ͷ�ʽ</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_psfs" value="1">����
	<INPUT type="radio" name="jxc_gysdd_psfs" value="2">��ȡ
	<INPUT type="radio" name="jxc_gysdd_psfs" value="3">����
  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ҫ�󵽻�ʱ�� ��</td>
  <td><input type="text" name="jxc_gysdd_yqdhsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_gysdd_yqdhsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ񷢻�</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_fhsfwc" value="N">δ����
	<INPUT type="radio" name="jxc_gysdd_fhsfwc" value="Y">�����
	<INPUT type="radio" name="jxc_gysdd_fhsfwc" value="M">���ַ���
  </td>
  <td align="right" width="18%">��Ӧ�̽�����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_gysjsr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��Ӧ�̽������� ��</td>
  <td><input type="text" name="jxc_gysdd_gysjsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_gysdd_gysjsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̷������� ��</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_gysfhrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_gysfhrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̷�����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_gysfhr" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ����</td> 
  <td width="32%"> 
    <INPUT type="radio" name="jxc_gysdd_sfjs" value="Y">�ѽ���
    <INPUT type="radio" name="jxc_gysdd_sfjs" value="N">δ����
  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_jsr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�������� ��</td>
  <td><input type="text" name="jxc_gysdd_jsrq" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_gysdd_jsrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�ֱ������깺��λ</td> 
  <td width="32%">
	<INPUT type="radio" name="jxc_gysdd_sfrksgdw" value="Y">ֱ������깺��λ
	<INPUT type="radio" name="jxc_gysdd_sfrksgdw" value="N">��
  </td>
  <td align="right" width="18%">�깺����</td> 
  <td width="32%"> 
    <input type="text" name="jxc_gysdd_sgph" size="20" maxlength="13" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����״̬</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_ddzt" style="FONT-SIZE:12PX;WIDTH:152PX">
		<option value=""></option>
		<option value="7">δ�ύ</option>
		<option value="0">�ȴ��µ�</option>
		<option value="1">���µ�</option>
		<option value="2">�ѽ���</option>
		<option value="3">���ַ���</option>
		<option value="5">����ɷ���</option>
		<option value="4">�����</option>
		<option value="6">���ڰ������</option>
		<option value="9">�ѽ���</option>
	</select>
  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="jxc_gysdd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="jxc_gysdd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="jxc_gysdd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="18%">¼�벿��</td> 
  <td width="32%"> 
    <select name="jxc_gysdd_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx order by dwbh","");
%>
    </select>  </td>
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
	if(!(isNumber(FormName.jxc_gysdd_gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_xdrq, "�µ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_xdrq2, "�µ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_yqdhsj, "Ҫ�󵽻�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_yqdhsj2, "Ҫ�󵽻�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysjsrq, "��Ӧ�̽�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysjsrq2, "��Ӧ�̽�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysfhrq, "��Ӧ�̷�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_gysfhrq2, "��Ӧ�̷�������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_jsrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_jsrq2, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.jxc_gysdd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
