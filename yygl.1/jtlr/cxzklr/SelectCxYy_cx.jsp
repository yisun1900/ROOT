<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yy_cxCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">������</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="19%">�����ֹ�˾</td> 
  <td width="31%"> 
    <select name="yy_cx_yy_cx_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">ֱ���ۿ�ȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzjzk_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">ֱ���ۿ۱���ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzjzk_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��Ʒ��ȯȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzpzq_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">��Ʒ��ȯ����ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxzpzq_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">���̷���ȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxgcfx_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">���̷��ֱ���ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxgcfx_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�����ϼ�ȥ��ƽ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxrlhj_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="19%">�����ϼƱ���ָ��(%)</td> 
  <td width="31%"> 
    <input type="text" name="yy_cx_yy_cxrlhj_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="yy_cx_yy_cx_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yy_cx_yy_cx_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">¼����</td> 
  <td width="31%"><input type="text" name="yy_cx_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="19%">&nbsp;</td> 
  <td width="31%">&nbsp;</td>
</tr>
<tr bgcolor="#E8E8FF">
  <td align="right" >��ʾ���</td>
  <td colspan="3" ><input type="radio" name="xsfg" value="1" checked>
    ��ҳ
    <input type="radio" name="xsfg" value="2">
    EXCEL &nbsp;&nbsp;&nbsp;ÿҳ��ʾ����
    <input type="text" name="myxssl" size="7" maxlength="13" value="100">
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
	if(!(isNumber(FormName.yy_cx_zqs, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzjzk_qnpj, "ֱ���ۿ�ȥ��ƽ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzjzk_bzzs, "ֱ���ۿ۱���ָ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzpzq_qnpj, "��Ʒ��ȯȥ��ƽ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxzpzq_bzzs, "��Ʒ��ȯ����ָ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxgcfx_qnpj, "���̷���ȥ��ƽ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxgcfx_bzzs, "���̷��ֱ���ָ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxrlhj_qnpj, "�����ϼ�ȥ��ƽ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_cx_yy_cxrlhj_bzzs, "�����ϼƱ���ָ��(%)"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_cx_yy_cx_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_cx_yy_cx_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
