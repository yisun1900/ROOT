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
<form method="post" action="Cw_sjxgjlCxList.jsp" name="selectform">
<div align="center">��ѯ���޸�˰���¼</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�޸ļ�¼��</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_xgjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">�ͻ����</td> 
  <td width="31%"> 
    <input type="text" name="cw_sjxgjl_khbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="19%">�����ֹ�˾</td> 
  <td width="31%"> 
    <select name="cw_sjxgjl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ԭ����</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_wdzgce" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">ǩԼ��</td> 
  <td width="31%"> 
    <input type="text" name="cw_sjxgjl_qye" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ۺ�����</td> 
  <td width="32%"> 
    <input type="text" name="cw_sjxgjl_guanlif" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">��ͬ��</td> 
  <td width="31%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ʦ</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_sjs" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="cw_sjxgjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_sjxgjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">¼����</td> 
  <td width="32%"><input type="text" name="cw_sjxgjl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
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
	if(!(isFloat(FormName.cw_sjxgjl_wdzgce, "����ԭ����"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjxgjl_qye, "ǩԼ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_sjxgjl_guanlif, "�ۺ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjxgjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_sjxgjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
