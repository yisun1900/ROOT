<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
String zkl=cf.executeQuery("select zkl from sq_yhxx where yhdlm='"+yhdlm+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Crm_dzyhsqSpList.jsp" name="selectform">
<div align="center">�����Ż�����--����</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td width="19%"> 
        <div align="right">�ͻ������ֹ�˾</div>
      </td>
      <td width="31%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc,ssfgs from sq_dwxx where dwlx='F2' and cxbz='N' order by ssfgs,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,crm_zxkhxx_zxdm,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
      <td width="17%"> 
        <div align="right">��ѯ����</div>
      </td>
      <td width="33%"> 
        <select name="crm_zxkhxx_zxdm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+ssfgs+"' order by dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ͻ����</td>
      <td width="31%"> 
        <input type="text" name="crm_dzyhsq_khbh" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">�ͻ�����</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_khxm" size="20" maxlength="50" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">���ݵ�ַ</td>
      <td width="31%"> 
        <input type="text" name="crm_zxkhxx_fwdz" size="20" maxlength="100" >
      </td>
      <td align="right" width="17%">���ʦ</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhxx_sjs" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������</td>
      <td width="31%"> 
        <input type="text" name="crm_dzyhsq_sqr" size="20" maxlength="20" >
      </td>
      <td align="right" width="17%">¼����</td>
      <td width="33%"> 
        <input type="text" name="crm_dzyhsq_lrr" size="20" maxlength="20" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">����ʱ�� ��</td>
      <td width="31%"> 
        <input type="text" name="crm_dzyhsq_sqsj" size="20" maxlength="10" >
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_dzyhsq_sqsj2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><b><font color="#0000CC">�����ۿ��� ��</font></b></td>
      <td width="31%"> 
        <input type="text" name="sqzkl" size="20" maxlength="10" value="<%=zkl%>" readonly>
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="sqzkl2" size="20" maxlength="10" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�Ƿ����������Ż�</td>
      <td width="31%"> 
        <input type="radio" name="crm_dzyhsq_sfsqqtyh" value="Y">
        �� 
        <input type="radio" name="crm_dzyhsq_sfsqqtyh" value="N">
        �� </td>
      <td align="right" width="17%">������־</td>
      <td width="33%"> 
        <input type="radio" name="crm_dzyhsq_spbz" value="1" checked>
        δ���� </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="��ѯ" onClick="f_do(selectform)">
        <input type="reset"  value="����">
      </td>
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
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_dzyhsq_sqsj2, "����ʱ��"))) {
		return false;
	}

	if(!(isFloat(FormName.sqzkl, "�ۿ���"))) {
		return false;
	}
	if (FormName.sqzkl.value<0 || FormName.sqzkl.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.sqzkl.select();
		return false;
	}

	if(!(isFloat(FormName.sqzkl2, "�ۿ���"))) {
		return false;
	}
	if (FormName.sqzkl2.value<0 || FormName.sqzkl2.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.sqzkl2.select();
		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
