<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>��ѯ�ۿ���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx='F2' order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Cw_gckkjlCxList.jsp" name="selectform">
<div align="center">��ѯ�ۿ���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">�ֹ�˾</td>
  <td bgcolor="#FFFFCC"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(fgs,crm_khxx_dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
  <td align="right" bgcolor="#FFFFCC">ǩԼ����</td>
  <td bgcolor="#FFFFCC"><select name="crm_khxx_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
//	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    �ۿ��¼��  </td>
  <td width="33%"> 
    <input type="text" name="cw_gckkjl_kkjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="20%">&nbsp;</td>
  <td width="30%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͻ����</td>
  <td><input type="text" name="cw_gckkjl_khbh" size="20" maxlength="20" ></td>
  <td align="right">��ͬ��</td>
  <td><input type="text" name="crm_khxx_hth" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    �ͻ�����  </td>
  <td width="33%"> 
    <input type="text" name="crm_khxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="20%"> 
    ���ݵ�ַ  </td>
  <td width="30%"> 
    <input type="text" name="crm_khxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    ��ϵ��ʽ  </td>
  <td width="33%"> 
    <input type="text" name="crm_khxx_lxfs" size="20" maxlength="100" >  </td>
  <td align="right" width="20%">���ʦ</td>
  <td width="30%"><input type="text" name="crm_khxx_sjs" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ǩԼ���� ��</td>
  <td><input type="text" name="crm_khxx_qyrq" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="crm_khxx_qyrq2" size="20" maxlength="10" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    ʩ����  </td>
  <td width="33%"> 
    <select name="crm_khxx_sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
//		cf.selectItem(out,"select sgd,sgdmc from sq_sgd order by sgdmc","");
	}
	else{
		cf.selectItem(out,"select sgd,sgdmc from sq_sgd where ssfgs='"+ssfgs+"'  order by sgdmc","");
	}
%>
    </select>  </td>
  <td align="right" width="20%"> 
    �ʼ�  </td>
  <td width="30%"> 
    <input type="text" name="crm_khxx_zjxm" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">¼����</td>
  <td width="33%"><input type="text" name="cw_gckkjl_lrr" size="20" maxlength="20" ></td>
  <td align="right" width="20%">¼�벿��</td>
  <td width="30%"><select name="cw_gckkjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1') and ssfgs='"+ssfgs+"'  order by dwbh","");
	}
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼��ʱ�� ��</td>
  <td><input type="text" name="cw_gckkjl_lrsj" size="20" maxlength="10" ></td>
  <td align="right">��</td>
  <td><input type="text" name="cw_gckkjl_lrsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">����ʱ�� ��</td>
  <td width="33%"><input type="text" name="cw_gckkjl_spsj" size="20" maxlength="10" ></td>
  <td align="right" width="20%">��</td>
  <td width="30%"><input type="text" name="cw_gckkjl_spsj2" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"> 
    ������־  </td>
  <td width="33%"> 
    <select name="cw_gckkjl_spbz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"2+δ����&3+����ͨ��&4+����δͨ��","");
%>
    </select>  </td>
  <td align="right" width="20%"> 
    ������  </td>
  <td width="30%"> 
    <input type="text" name="cw_gckkjl_spr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">ʩ���ӽ����־</td>
  <td width="33%"><%
	cf.radioToken(out, "cw_gckkjl_jsbz","N+δ����&Y+�ѽ���","");
%></td>
  <td align="right" width="20%">ʩ���ӽ����¼��</td>
  <td width="30%"><input type="text" name="cw_gckkjl_jsjlh" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">���ʦ�����־</td>
  <td width="33%"><%
	cf.radioToken(out, "cw_gckkjl_sjsjsbz","N+δ����&Y+�ѽ���","");
%></td>
  <td align="right" width="20%">���ʦ�����¼��</td>
  <td width="30%"><input type="text" name="cw_gckkjl_sjsjsjlh" size="20" maxlength="9" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%">�ʼ�����־</td>
  <td width="33%"><%
	cf.radioToken(out, "cw_gckkjl_zjjsbz","N+δ����&Y+�ѽ���","");
%></td>
  <td align="right" width="20%">�ʼ�����¼��</td>
  <td width="30%"><input type="text" name="cw_gckkjl_zjjsjlh" size="20" maxlength="9" ></td>
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_khxx_qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_khxx_qyrq2, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gckkjl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gckkjl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gckkjl_spsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.cw_gckkjl_spsj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
