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
%>
<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14" >
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p>�������ѯ������<font color="#FF0000">ע�⣺ֻ��ɾ���յ����ţ���ֻ��ɾ���Լ������ţ�</font></p>
        </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Crm_lrphScList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">¼������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrph" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">¼����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" value="<%=yhdlm%>" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">¼��ʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">����������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="zdxh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sl" size="20" maxlength="8" value="0" readonly>
  </td>
  <td width="15%"> 
    <div align="right">����</div>
  </td>
  <td width="35%"> 
    <select name="lx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+��������&2+���ڿ�&3+�깤����&4+�蹤�̵���&5+�깤�ط�","");
%>
    </select>
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

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(!(isNumber(FormName.lrph, "¼������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.zdxh, "����������"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "��������"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>


