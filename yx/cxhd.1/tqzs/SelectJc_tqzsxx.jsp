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
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Jc_tqzsxxList.jsp" name="selectform">
<div align="center"> ��Ȩ������Ϣ��ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����ֹ�˾</td> 
  <td width="35%"> 
    <select name="jc_tqzsxx_fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
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
     </select>  
 </td>
  <td align="right" width="15%">������Ŀ</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_zsxm" size="20" maxlength="100" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������λ</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_jldw" size="20" maxlength="20" >
  </td>
  <td align="right" width="15%">�ɱ�����</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_cbdj" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�г�����</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_scdj" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">������������</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_zsslsx" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������������</td> 
  <td width="35%"> 
    <input type="text" name="jc_tqzsxx_zsslxx" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">�Ƿ�ֹͣ</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "jc_tqzsxx_sftz","Y+��&N+��","");
%>
  </td>
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
	if(!(isFloat(FormName.jc_tqzsxx_cbdj, "�ɱ�����"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tqzsxx_scdj, "�г�����"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tqzsxx_zsslsx, "������������"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tqzsxx_zsslxx, "������������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
