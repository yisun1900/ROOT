<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
%>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Rs_fysqList.jsp" name="selectform">
<div align="center">����Ԥ���ѯ����</div>
<table width="100%" border="1" style="FONT-SIZE:12" bordercolor="#FFFFFF" bordercolorlight="#666666" bgcolor="#E0E0E0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����������</td> 
  <td width="35%"> 
    <input type="text" name="fysqbh" size="20" maxlength="10" >  </td>
  <td align="right" width="15%">����ֹ�˾</td> 
  <td width="35%"> 
    <select name="fgs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in ('A0','F0') and cxbz='N' order by ssfgs,dwlx,dwbh","");
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in ('A0','F0') and cxbz='N' order by dwlx,dwbh",ssfgs);
	}
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����ʱ�� ��</td> 
  <td width="35%"><input type="text" name="sqsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">����ʱ�� ��</td> 
  <td width="35%"> 
 <input type="text" name="sqsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>  
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"> 
    <select name="xqlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+��Ƹ��&2+��ѵ��&3+������&4+������&5+��ᱣ�շ�&6+������&7+��������","");
%>
    </select>  </td>

  <td align="right" width="15%">��;��ʽ</td> 
  <td width="35%"> 
    <input type="text" name="ytxs" size="20" maxlength="100" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"> 
    <input type="text" name="fy" size="20" maxlength="9" >  </td>
  <td align="right" width="15%">���ܱ��</td> 
  <td width="35%"> 
    <input type="text" name="hzbh" size="20" maxlength="11" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ�ɸ�</td> 
  <td width="35%"> 
    <select name="sfkg" style="FONT-SIZE:12PX;WIDTH:152PX">
	<option value="Y">�ɸ�</option>
	</select> </td>
  <td align="right" width="15%">¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"><input name="lrsj" type="text" onDblClick="JSCalendar(this)" size="20" maxlength="10" >
  <BR></td>
  <td align="right" width="15%">¼��ʱ�� �� </td>
  <td width="35%"><input type="text" name="lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.sqsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.sqsj2, "����ʱ��"))) {
		return false;
	}
	if(!(isFloat(FormName.fy, "����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
