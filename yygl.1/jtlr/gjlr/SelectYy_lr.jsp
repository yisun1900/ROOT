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
<form method="post" action="Yy_lrList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">������</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_zqs" size="20" maxlength="8" >  </td>
  <td align="right" width="21%">�ֹ�˾</td> 
  <td width="29%"> 
    <select name="yy_lr_yy_lr_fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
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
  <td align="right" width="21%">�ͻ�����ѱ���Ӧ�ձ���(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrglf_ysbl" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">�ͻ�����ѱ���ʵ����ȡ(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrglf_sjsq" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">˰����������Ӧ�ձ���(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrsj_ysbl" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">˰����������ʵ����ȡ(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrsj_sjsq" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">����ë����ȥ��ƽ��(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrgc_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">����ë���ʱ���ָ��(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrgc_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">����ë����ȥ��ƽ��(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrzc_qnpj" size="20" maxlength="17" >  </td>
  <td align="right" width="21%">����ë���ʱ���ָ��(%)</td> 
  <td width="29%"> 
    <input type="text" name="yy_lr_yy_lrzc_bzzs" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="yy_lr_yy_lr_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right">��</td>
  <td><input type="text" name="yy_lr_yy_lr_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="21%">¼����</td> 
  <td width="29%"><input type="text" name="yy_lr_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="21%">&nbsp;</td> 
  <td width="29%">&nbsp;</td>
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
	if(!(isNumber(FormName.yy_lr_zqs, "������"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrglf_ysbl, "�ͻ�����ѱ���Ӧ�ձ���(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrglf_sjsq, "�ͻ�����ѱ���ʵ����ȡ(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrsj_ysbl, "˰����������Ӧ�ձ���(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrsj_sjsq, "˰����������ʵ����ȡ(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrgc_qnpj, "����ë����ȥ��ƽ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrgc_bzzs, "����ë���ʱ���ָ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrzc_qnpj, "����ë����ȥ��ƽ��(%)"))) {
		return false;
	}
	if(!(isFloat(FormName.yy_lr_yy_lrzc_bzzs, "����ë���ʱ���ָ��(%)"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_lr_yy_lr_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.yy_lr_yy_lr_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
