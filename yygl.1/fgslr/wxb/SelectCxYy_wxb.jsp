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
<form method="post" action="Yy_wxbCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right">�����ֹ�˾</td>
  <td><select name="yy_wxb_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td><select name="yy_wxb_ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
    <input type="text" name="yy_wxb_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">������Ա������</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxb_ygmc" size="20" maxlength="20" >  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">Ŀ��ͻ��������¼ƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_byjh" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">Ŀ��ͻ����������ۼ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_bylj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">Ŀ��ͻ��������ܼƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_szjh" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">Ŀ��ͻ������������</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_szwc" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">Ŀ��ͻ���������Ԥ��</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbkh_bzyj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">��ȡ�����������¼ƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_byjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��ȡ�������������ۼ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_bylj" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">��ȡ�����������ܼƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_szjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">��ȡ���������������</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_szwc" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">��ȡ�����������ܼƻ�</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxbdj_bzjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="yy_wxb_yy_wxb_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yy_wxb_yy_wxb_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">¼����</td> 
  <td width="29%"> 
    <input type="text" name="yy_wxb_yy_wxb_lrr" size="20" maxlength="20" >  </td>
  <td align="right" width="21%">&nbsp;</td> 
  <td width="29%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_wxb_zqs, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_byjh, "Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_bylj, "Ŀ��ͻ����������ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_szjh, "Ŀ��ͻ��������ܼƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_szwc, "Ŀ��ͻ������������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbkh_bzyj, "Ŀ��ͻ���������Ԥ��"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_byjh, "��ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_bylj, "��ȡ�������������ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_szjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_szwc, "��ȡ���������������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_wxb_yy_wxbdj_bzjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_wxb_yy_wxb_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_wxb_yy_wxb_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
