<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="ghsxdList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�깺����</td> 
  <td width="35%"> 
    <input type="text" name="sgph" size="20" maxlength="11" >
  </td>
   <td align="right" width="15%">�깺״̬</td> 
  <td width="35%"> 
	<select name="sgzt" style="FONT-SIZE:12PX;WIDTH:152PX">
	  <option value="5">�������</option>
	</select>
  </td>
 
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ֹ�˾</td> 
  <td width="35%"> 
     <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\"> ");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%>
  </td>
   <td align="right" width="15%">&nbsp;</td>   
  <td width="35%"> &nbsp;
  </td>
</tr>
<tr bgcolor="#FFFFFF"> 
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >
  </td>
   <td align="right" width="15%">һ�������</td>   
  <td width="35%">  <input type="text" name="zbshr" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�깺������ ��</td> 
  <td width="35%"> 
  <input type="text" name="sgzsl" size="20" maxlength="17" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> <input type="text" name="sgzsl2" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj2" size="20" maxlength="10" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">һ�����ʱ�� ��</td> 
  <td width="35%"> 
 <input type="text" name="zbshsj" size="20" maxlength="10" >
  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"> 
    <input type="text" name="zbshsj2" size="20" maxlength="10" >
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
	if(!(isFloat(FormName.sgzsl, "�깺������"))) {
		return false;
	}
	if(!(isFloat(FormName.sgzsl2, "�깺������"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zbshsj, "һ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zbshsj2, "һ�����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
