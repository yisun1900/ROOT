<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_zkxgjlCxList.jsp" name="selectform">
<div align="center">��ѯ���ۿ��޸ļ�¼</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="cw_zkxgjl_khbh" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�޸�ʱ�� ��</td>
  <td><input type="text" name="cw_zkxgjl_xgsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_zkxgjl_xgsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ͻ�����</td> 
  <td width="32%"> 
    <input type="text" name="cw_zkxgjl_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="19%">���ݵ�ַ</td> 
  <td width="31%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ͬ��</td> 
  <td width="32%"> 
    <input type="text" name="crm_khxx_hth" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">�����ֹ�˾</td> 
  <td width="31%"> 
    <select name="cw_zkxgjl_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�޸���</td> 
  <td width="32%"> 
    <input type="text" name="cw_zkxgjl_xgr" size="20" maxlength="20" >  </td>
  <td align="right" width="19%">�ۿ�����</td> 
  <td width="31%"> 
    <INPUT type="radio" name="cw_zkxgjl_zklx" value="1">ȫ���ۿ�

    <INPUT type="radio" name="cw_zkxgjl_zklx" value="2">�����ۿ�
</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����ǰ�ۿ���</td> 
  <td width="32%"> 
    <input type="text" name="cw_zkxgjl_gxqzkl" size="20" maxlength="9" >  </td>
  <td align="right" width="19%">���º��ۿ���</td> 
  <td width="31%"> 
    <input type="text" name="cw_zkxgjl_gxhzkl" size="20" maxlength="9" >  </td>
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
	if(!(isDatetime(FormName.cw_zkxgjl_xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_zkxgjl_xgsj2, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zkxgjl_gxqzkl, "����ǰ�ۿ���"))) {
		return false;
	}
	if(!(isFloat(FormName.cw_zkxgjl_gxhzkl, "���º��ۿ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
