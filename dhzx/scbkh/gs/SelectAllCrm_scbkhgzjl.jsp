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
	String yhmc=(String)session.getAttribute("yhmc");
	String dwbh=(String)session.getAttribute("dwbh");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="Crm_scbkhgzjlList.jsp" name="selectform">
<div align="center">�ͻ����ټ�¼��ά��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">��¼��</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhgzjl_jlh" size="20" maxlength="10" >  </td>
  <td align="right" width="18%">�г����ͻ����</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhgzjl_scbkhbh" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�ͻ�����</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhxx_khxm" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">���ݵ�ַ</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_fwdz" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">�绰</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhxx_lxfs" size="20" maxlength="50" >  </td>
  <td align="right" width="18%">ҵ��Ա</td> 
  <td width="32%"> 
    <input type="text" name="crm_scbkhxx_ywy" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����С��</td> 
  <td width="31%"> 
    <input type="text" name="ywyssxz" size="20" maxlength="20" >  </td>
  <td align="right" width="18%">״̬</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "crm_scbkhxx_zt","1+����&2+ʧ��&3+�ƽ�","");
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����¼����</td> 
  <td width="31%"> 
    <input type="text" name="crm_scbkhgzjl_lrr" size="20" maxlength="20" value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%">����¼�벿��</td> 
  <td width="32%"><select name="crm_scbkhgzjl_lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="19%">����¼��ʱ�� ��</td> 
  <td width="31%"><input type="text" name="crm_scbkhgzjl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%">�� </td>
  <td width="32%"><input type="text" name="crm_scbkhgzjl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
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
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj, "����¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.crm_scbkhgzjl_lrsj2, "����¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
