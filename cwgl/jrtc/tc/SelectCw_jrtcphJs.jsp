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
<form method="post" action="Cw_jrtcphListJs.jsp" name="selectform">
<div align="center">������ɣ��޸�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"> 
    <select name="cw_jrtcph_khzq" style="FONT-SIZE:12PX;WIDTH:192PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select khzq c1,khzq||'('||TO_CHAR(khqssj,'YYYY-MM-DD')||'��'||TO_CHAR(khjzsj,'YYYY-MM-DD')||')' c2 from cw_jrkhzq order by khzq","");
%>
    </select>  </td>
  <td align="right" width="18%">�ֹ�˾</td> 
  <td width="32%"> 
    <select name="cw_jrtcph_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������</td>
  <td><input type="text" name="cw_jrtcph_spr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ʱ�� ��</td> 
  <td width="32%"><input type="text" name="cw_jrtcph_spsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">��</td> 
  <td width="32%"><input type="text" name="cw_jrtcph_spsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼��ʱ�� ��</td> 
  <td width="32%"><input type="text" name="cw_jrtcph_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td>
  <td width="32%"><input type="text" name="cw_jrtcph_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����״̬</td>
  <td colspan="3">
	<INPUT type="radio" name="cw_jrtcph_clzt" value="1" checked>����
  </td>
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
	if(!(isDatetime(FormName.cw_jrtcph_spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrtcph_spsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrtcph_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_jrtcph_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
