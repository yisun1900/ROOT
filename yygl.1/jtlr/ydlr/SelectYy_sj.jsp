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
<form method="post" action="Yy_sjList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">������</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">�ֹ�˾</td> 
  <td width="27%"> 
    <select name="yy_sj_yy_sj_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="23%">�ܿ�ԴĿ��ͻ��������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjzky_mbkh" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">�ܿ�Դ��ȡ�����������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjzky_sqdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��Ʋ���Ʒѱ��¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_sjf" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">��Ʋ�ȥ��ͬ���¶���Ʒ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_tqsjf" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��Ʋ����̲�ֵ���¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_gccz" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjsjb_tqgccz" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�ҾӲ����Ĳ�ֵ���¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjjjb_byjh" size="20" maxlength="17" >  </td>
  <td align="right" width="23%">�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjjjb_qntq" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">�г���Ŀ��ͻ��������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjscb_mbkh" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">������Ŀ��ͻ��������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjwxb_mbkh" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��������Ŀ��ͻ��������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjqtqd_mbkh" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">�г�����ȡ�����������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjscb_sqdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">��������ȡ�����������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjwxb_sqdj" size="20" maxlength="8" >  </td>
  <td align="right" width="23%">����������ȡ�����������¼ƻ�</td> 
  <td width="27%"> 
    <input type="text" name="yy_sj_yy_sjqtqd_sqdj" size="20" maxlength="8" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="yy_sj_yy_sj_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">�� </td>
  <td><input type="text" name="yy_sj_yy_sj_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="23%">¼����</td> 
  <td width="27%"><input type="text" name="yy_sj_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="23%">&nbsp;</td> 
  <td width="27%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_sj_zqs, "������"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjzky_mbkh, "�ܿ�ԴĿ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjzky_sqdj, "�ܿ�Դ��ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_sjf, "��Ʋ���Ʒѱ��¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_tqsjf, "��Ʋ�ȥ��ͬ���¶���Ʒ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_gccz, "��Ʋ����̲�ֵ���¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjsjb_tqgccz, "��Ʋ�ȥ��ͬ���¶ȹ��̲�ֵ"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjjjb_byjh, "�ҾӲ����Ĳ�ֵ���¼ƻ�"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_sj_yy_sjjjb_qntq, "�ҾӲ�ȥ��ͬ���¶����Ĳ�ֵ"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjscb_mbkh, "�г���Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjwxb_mbkh, "������Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjqtqd_mbkh, "��������Ŀ��ͻ��������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjscb_sqdj, "�г�����ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjwxb_sqdj, "��������ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(!(isNumber(FormName.yy_sj_yy_sjqtqd_sqdj, "����������ȡ�����������¼ƻ�"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sj_yy_sj_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_sj_yy_sj_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
