<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String gysbm=request.getParameter("gysbm");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertJxc_ppgysdzb.jsp" name="insertform" >
<div align="center">
  <p>���ģ���Ʒ�ƹ�Ӧ�̶��ձ�¼��</p>
  <p class="STYLE1"><strong>�밴˳��ѡ�񣺷ֹ�˾ -> ��Ʒ�� -> ��Ӧ��</strong></p>
</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֹ�˾</td> 
  <td width="32%"><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
	}
	else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','F0') and dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ��</td>
  <td colspan="3"><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:522PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
		cf.selectItem(out,"select jxc_ppxx.ppbm,jxc_ppxx.ppmc from jxc_ppxx where jxc_ppxx.pplb='2' order by ppmc","");
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ӧ��</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
    <%
	cf.selectItem(out,"select jxc_gysxx.gysbm,jxc_gysxx.gysmc||DECODE(jxc_gysxx.sfhz,'Y','��������','N','����������') from jxc_gysxx where gysbm="+gysbm,gysbm);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFCC" align="center">
  <td colspan="4">ϵͳ��Ȩ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ɵ�½ϵͳ��־</td>
  <td><%
	cf.radioToken(out,"kdlxtbz","Y+�ɵ�½&N+���ɵ�½","");
%></td>
  <td align="right">�û�����</td>
  <td><input type="text" name="yhmc" value="" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�û���¼��</td>
  <td><input type="text" name="yhdlm" value="" size="20" maxlength="16" >
  </td>
  <td align="right">�û�����</td>
  <td><input type="text" name="yhkl" value="" size="20" maxlength="50" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����</td>
  <td><%
	cf.radioToken(out,"sfsd","Y+������&N+δ����","");
%></td>
  <td align="right">����ʹ������</td>
  <td><input type="text" name="mmsyzq" value="" size="16" maxlength="8" >
    �� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�����½ʧ�ܴ���</td>
  <td><input type="text" name="yxdlsbcs" value="" size="20" maxlength="8" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input name="sq" disabled type="button" onClick="window.open('/xtsq/xtsq/grouptouserGys.jsp?yhdlm='+yhdlm.value)"  value="�û���Ȩ" ></td>
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("������[��Ʒ��]��");
		FormName.ppbm.focus();
		return false;
	}
	if(!(isNumber(FormName.ppbm, "��Ʒ��"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ��]��");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ��"))) {
		return false;
	}

	if(!(isNumber(FormName.mmsyzq, "����ʹ������"))) {
		return false;
	}
	if(!(isNumber(FormName.yxdlsbcs, "�����½ʧ�ܴ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfsd)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfsd[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("��ѡ��[�ɵ�½ϵͳ��־]��");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(FormName.kdlxtbz[0].checked) 
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("������[�û���¼��]��");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
		if(	javaTrim(FormName.yhmc)=="") {
			alert("��ѡ��[�û�����]��");
			FormName.yhmc.focus();
			return false;
		}
	}
	else{
		FormName.yhdlm.value="";
		FormName.yhkl.value="";
		FormName.yhmc.value="";
	}

	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
