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
<form method="post" action="Yy_qtqdCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">������</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">�����ֹ�˾</td> 
  <td width="30%"> 
    <select name="yy_qtqd_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="20%">Ŀ��ͻ��������¼ƻ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_byjh" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">Ŀ��ͻ����������ۼ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_bylj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">Ŀ��ͻ��������ܼƻ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_szjh" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">Ŀ��ͻ������������</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_szwc" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">Ŀ��ͻ���������Ԥ��</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqdkh_bzyj" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">��ȡ�����������¼ƻ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_byjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��ȡ�������������ۼ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_bylj" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">��ȡ�����������ܼƻ�</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_szjh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��ȡ���������������</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_szwc" size="20" maxlength="8" >  </td>
  <td align="right" width="20%">��ȡ������������Ԥ��</td> 
  <td width="30%"> 
    <input type="text" name="yy_qtqd_yy_qtqddj_bzyj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="yy_qtqd_yy_qtqd_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yy_qtqd_yy_qtqd_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">¼����</td> 
  <td width="30%"><input type="text" name="yy_qtqd_yy_qtqd_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="20%">&nbsp;</td> 
  <td width="30%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_qtqd_zqs, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_byjh, "Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_bylj, "Ŀ��ͻ����������ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_szjh, "Ŀ��ͻ��������ܼƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_szwc, "Ŀ��ͻ������������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqdkh_bzyj, "Ŀ��ͻ���������Ԥ��"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_byjh, "��ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_bylj, "��ȡ�������������ۼ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_szjh, "��ȡ�����������ܼƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_szwc, "��ȡ���������������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_qtqd_yy_qtqddj_bzyj, "��ȡ������������Ԥ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_qtqd_yy_qtqd_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_qtqd_yy_qtqd_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
