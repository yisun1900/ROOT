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
<form method="post" action="Nblt_ftglList.jsp" name="selectform">
<div align="center">����ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ӱ��</td> 
  <td width="32%"> 
    <input type="text" name="nblt_ftgl_tzbh" size="20" maxlength="11" >  </td>
  <td align="right" width="18%">��������</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_ftzt" size="20" maxlength="200" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�����</td> 
  <td width="32%"> 
    <input type="text" name="nblt_ftgl_bkbh" size="20" maxlength="2" >  </td>
  <td align="right" width="18%">�������</td> 
  <td width="32%"><input type="text" name="nblt_bkgl_bkmc" size="20" maxlength="50" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">����ʱ���</td>
  <td><input type="text" name="nblt_ftgl_ftsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="nblt_ftgl_ftsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����޸�ʱ���</td>
  <td><input type="text" name="nblt_ftgl_zhxgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="nblt_ftgl_zhxgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���������</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_djcs" size="20" maxlength="8" ></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_djcs2" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ظ�������</td>
  <td><input type="text" name="nblt_ftgl_hfcs" size="20" maxlength="8" ></td>
  <td align="right">��</td>
  <td><input type="text" name="nblt_ftgl_hfcs2" size="20" maxlength="8" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ��ö�</td> 
  <td width="32%">
	<INPUT type="radio" name="nblt_ftgl_sfzd" value="Y">�ö�
	<INPUT type="radio" name="nblt_ftgl_sfzd" value="N">��ͨ
  </td>
  <td align="right" width="18%">�Ƿ񾫻���</td> 
  <td width="32%">
	<INPUT type="radio" name="nblt_ftgl_sfjht" value="Y">������
	<INPUT type="radio" name="nblt_ftgl_sfjht" value="N">��
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ƿ�����ظ�</td> 
  <td width="32%">
	<INPUT type="radio" name="nblt_ftgl_sfyxhf" value="Y">����ظ�
	<INPUT type="radio" name="nblt_ftgl_sfyxhf" value="N">��
  </td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><input type="text" name="nblt_ftgl_ftr" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <input type="text" name="nblt_ftgl_fjmc" size="20" maxlength="200" >  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
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
	if(!(isDatetime(FormName.nblt_ftgl_ftsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.nblt_ftgl_ftsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.nblt_ftgl_zhxgsj, "����޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.nblt_ftgl_zhxgsj2, "����޸�ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_djcs, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_djcs2, "�������"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_hfcs, "�ظ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.nblt_ftgl_hfcs2, "�ظ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
