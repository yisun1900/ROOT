<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yjygbh=(String)session.getAttribute("ygbh");
%>
<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Nbyj_sjxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ʼ����</td> 
  <td width="35%"> 
    <input type="text" name="yjbh" size="20" maxlength="8" > 
	<input type="hidden" name="yjygbh" value="<%=yjygbh%>"> 
</td>
  <td align="right" width="15%">������</td> 
  <td width="35%">
  <select name="fjr" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
 <%
	cf.selectItem(out,"select ygbh,yhmc||'��'||dwmc||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.cxbz='N' and yhdlm is not null and sfzszg in('Y','N') order by yhmc","");
%>
  </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ʼ�����</td> 
  <td colspan="3"><input type="text" name="yjzt" size="60" maxlength="200" >��ģ����</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ�� ��</td> 
  <td width="35%"> 
    <input type="text" name="fssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="fssj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ʼ�����</td>
  <td>
  <input type="radio" name="yjlx" value="J" >
����
  <input type="radio" name="yjlx" value="P" >
��ͨ</td>
  <td align="right">�Ƿ��Ѷ�</td>
  <td>
  <input type="radio" name="sfyd" value="Y" >
�Ѷ�
  <input type="radio" name="sfyd" value="N" >
δ��</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ԭ��</td> 
  <td width="35%"><input type="text" name="fjym" size="20" maxlength="200" ></td>
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <input type="text" name="fjmc" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ʼ�����</td> 
  <td colspan="3"><input type="text" name="yjnr" size="60" maxlength="2000" >��ģ����</td>
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
	if(!(isNumber(FormName.fjr, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.fssj2, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
