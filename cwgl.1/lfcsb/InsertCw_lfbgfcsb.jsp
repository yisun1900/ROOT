<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<%
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_lfbgfcsb.jsp" name="insertform" target="_blank">
<div align="center">�����Ѳ�����¼��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"> 
    <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
		if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
		{
			out.println("<option value=\"\"></option>");
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
		}
		else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
		{
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
		}
		else{
			out.println("����δ���пͻ�������Ȩ������ϵϵͳ����Ա");
			return;
		}
	%> 
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd not in('0','B') order by gdjsjd","");
	%>
    </select></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="bfbl" value="" size="10" maxlength="9" >
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td colspan="3"><input type="radio" name="bfjs"  value="3">ʵ�տ�<BR> 
      <input type="radio" name="bfjs"  value="1">��ǰ���̷� <BR>
    <input type="radio" name="bfjs"  value="2">�ۺ󹤳̷�
    <BR><input type="radio" name="bfjs"  value="9">�ɴ������Ⱦ�����ǰ�ۺ�  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td colspan="3"> 
    <p>
      <input type="text" name="dzld" value="" size="20" maxlength="9" >  
      ��&gt;=0��&lt;=10��</p>
    <p>�ͻ��ۿ������ڡ��������ȡ���������ȡ��ǰ���ͻ��ۿ���С�ڡ��������ȡ���������ȡ�ۺ�</p></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td>
  <td><input type="radio" name="sfkclk"  value="Y">
    ��
    <input type="radio" name="sfkclk"  value="N">
    �� </td>
  <td align="right">���Ͽ���ͱ���</td>
  <td><input name="clkzdbl" type="text" id="clkzdbl" value="" size="10" maxlength="9" >
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѳ�����</td>
  <td colspan="3"><input type="radio" name="sfkybgf"  value="Y">
    ��
    <input type="radio" name="sfkybgf"  value="N">
    �� </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("������[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(!(isNumber(FormName.bfcs, "��������"))) {
		return false;
	}
	if(	!radioChecked(FormName.bfjs)) {
		alert("��ѡ��[��������]��");
		FormName.bfjs[0].focus();
		return false;
	}

	if (FormName.bfjs[3].checked)
	{
		if(	javaTrim(FormName.dzld)=="") {
			alert("������[��������]��");
			FormName.dzld.focus();
			return false;
		}
		if(!(isFloat(FormName.dzld, "��������"))) {
			return false;
		}

		if (parseFloat(FormName.dzld.value)<0 || parseFloat(FormName.dzld.value)>10)
		{
			alert("����[��������]Ӧ��0��10֮��");
			FormName.dzld.select();
			return false;
		}
	}
	else{
		FormName.dzld.value="";
	}

	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}
	if (parseFloat(FormName.bfbl.value)<0 || parseFloat(FormName.bfbl.value)>100)
	{
		alert("����[��������]Ӧ��0��100֮��");
		FormName.bfbl.select();
		return false;
	}

	if(	!radioChecked(FormName.sfkclk)) {
		alert("��ѡ��[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk[0].focus();
		return false;
	}
	if (FormName.sfkclk[0].checked)
	{
		if(	javaTrim(FormName.clkzdbl)=="") {
			alert("������[���Ͽ���ͱ���]��");
			FormName.clkzdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.clkzdbl, "���Ͽ���ͱ���"))) {
			return false;
		}

		if (parseFloat(FormName.clkzdbl.value)<0 || parseFloat(FormName.clkzdbl.value)>100)
		{
			alert("����[���Ͽ���ͱ���]Ӧ��0��100֮��");
			FormName.clkzdbl.select();
			return false;
		}
	}
	else{
		FormName.clkzdbl.value="";
	}

	if(	!radioChecked(FormName.sfkybgf)) {
		alert("��ѡ��[�Ƿ���Ѳ�����]��");
		FormName.sfkybgf[0].focus();
		return false;
	}
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
