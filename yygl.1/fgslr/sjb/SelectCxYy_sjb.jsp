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
	String ssbm=(String)session.getAttribute("dwbh");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Yy_sjbCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><select name="yy_sjb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  </select></td>
  <td align="right">��������</td>
  <td><select name="yy_sjb_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
	else if (yhjs.equals("F0"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and cxbz='N' order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssbm+"'","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">������</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">��Ʋ�Ա������</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjb_ygmc" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">����(�Ǳ���)����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_sydjcb" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">���¼ƻ���ȡ����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_byjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�����ۼ���ȡ����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_bylj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">���ܼƻ���ȡ����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_szjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���������ȡ����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_szwc" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">����Ԥ����ȡ����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_bzyj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">�����˶���</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_bztdj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">�����ۼ��˶���</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbdj_byljtdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��Ʒѱ��¼ƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_byjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">��Ʒѱ����ۼ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_bylj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��Ʒ����ܼƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_szjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">��Ʒ��������</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_szwc" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��Ʒѱ���Ԥ��</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbsjf_bzyj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">���̲�ֵ���¼ƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_byjh" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���̲�ֵ�����ۼ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_bylj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">���̲�ֵ���ܼƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_szjh" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���̲�ֵ�������</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_szwc" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">���̲�ֵ����Ԥ��</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbgccz_bzyj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���Ĳ�ֵ���¼ƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_byjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">���Ĳ�ֵ�����ۼ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_bylj" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���Ĳ�ֵ���ܼƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_szjh" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">���Ĳ�ֵ�������</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_szwc" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">���Ĳ�ֵ����Ԥ��</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjbzccz_bzyj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">¼����</td> 
  <td width="29%"> 
    <input type="text" name="yy_sjb_yy_sjb_lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">¼��ʱ�� ��</td> 
  <td width="29%"><input type="text" name="yy_sjb_yy_sjb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="21%">�� </td>
  <td width="29%"><input type="text" name="yy_sjb_yy_sjb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isNumber(FormName.yy_sjb_zqs, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_sydjcb, "����(�Ǳ���)����"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_byjh, "���¼ƻ���ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_bylj, "�����ۼ���ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_szjh, "���ܼƻ���ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_szwc, "���������ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_bzyj, "����Ԥ����ȡ����"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_bztdj, "�����˶���"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sjb_yy_sjbdj_byljtdj, "�����ۼ��˶���"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_byjh, "��Ʒѱ��¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_bylj, "��Ʒѱ����ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_szjh, "��Ʒ����ܼƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_szwc, "��Ʒ��������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbsjf_bzyj, "��Ʒѱ���Ԥ��"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_byjh, "���̲�ֵ���¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_bylj, "���̲�ֵ�����ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_szjh, "���̲�ֵ���ܼƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_szwc, "���̲�ֵ�������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbgccz_bzyj, "���̲�ֵ����Ԥ��"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_byjh, "���Ĳ�ֵ���¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_bylj, "���Ĳ�ֵ�����ۼ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_szjh, "���Ĳ�ֵ���ܼƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_szwc, "���Ĳ�ֵ�������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sjb_yy_sjbzccz_bzyj, "���Ĳ�ֵ����Ԥ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sjb_yy_sjb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sjb_yy_sjb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
