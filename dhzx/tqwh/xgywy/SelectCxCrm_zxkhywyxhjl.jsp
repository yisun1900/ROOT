<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_zxkhywyxhjlCxList.jsp" name="selectform">
<div align="center">��ѯ�޸ļ�¼</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">�ͻ����</td> 
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_khbh" size="20" maxlength="20" >
  </td>
      <td align="right" width="17%">�����ֹ�˾</td> 
      <td width="33%"> 
        <select name="crm_zxkhywyxhjl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
		<%
			if (kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh","");
			}
			else if (kfgssq.equals("5"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh","");
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
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">�ͻ�����</td> 
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_khxm" size="20" maxlength="50" >
  </td>
      <td align="right" width="17%">ԭҵ��Ա</td> 
      <td width="33%"> 
        <input type="text" name="crm_zxkhywyxhjl_oldywy" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">��ҵ��Ա</td> 
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_newywy" size="20" maxlength="20" >
  </td>
      <td align="right" width="17%">�޸���</td> 
      <td width="33%"> 
        <input type="text" name="crm_zxkhywyxhjl_xgr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
      <td align="right" width="18%">�޸�ʱ�� ��</td>
      <td width="32%"> 
        <input type="text" name="crm_zxkhywyxhjl_xgsj" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="17%">��</td>
      <td width="33%"> 
        <input type="text" name="crm_zxkhywyxhjl_xgsj2" size="20" maxlength="10" ondblclick="JSCalendar(this)">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.crm_zxkhywyxhjl_xgsj, "�޸�ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_zxkhywyxhjl_xgsj2, "�޸�ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
