<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Jxc_ppxxCxList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��Ʒ�Ʊ���</td> 
  <td width="35%"> 
    <input type="text" name="ppbm" size="20" maxlength="8" >
  </td>
  <td align="right" width="15%">��Ʒ������</td> 
  <td width="35%"> 
    <input type="text" name="ppmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">

  <td align="right" width="15%">����С��</td> 
  <td width="35%"> 
    <select name="clxl" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
	<%
	out.print("<optgroup label=\"������\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='1'  order by clxlmc","");
	out.print("<optgroup label=\"������\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='2'  order by clxlmc","");
	out.print("<optgroup label=\"ͨ����\"> </optgroup>");
	cf.selectItem(out,"select clxlmc mc,clxlmc from jxc_clxlbm,jxc_cldlbm where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_cldlbm.cldllb='3'  order by clxlmc","");
%>
  </select>
  </td>
<td align="right" width="15%">&nbsp;<!-- ��Ʒ����� --></td> 
  <td width="35%"> 
&nbsp;<!-- <select name="pplb" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
  <option value="1">ľ��</option>
  <option value="2">����</option>
  <option value="3">�Ҿ�</option>
  <option value="4">����</option>
  <option value="5" >����</option>
  </select>  -->
  </td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Ʒ������</td> 
  <td width="35%"> 
  <select name="scsmc" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value=""></option>
	 <%
	out.print("<optgroup label=\"����Ʒ��\"> </optgroup>");
	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='1' order by scsmc","");
		out.print("<optgroup label=\"����Ʒ��\"> </optgroup>");

	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='2' order by scsmc","");
		out.print("<optgroup label=\"ͨ��Ʒ��\"> </optgroup>");

	cf.selectItem(out,"select scsmc mc,scsmc from jxc_scsxx where scslb='3' order by scsmc","");

%>
  </select>
  </td>
  <td align="right" width="15%">��ע</td> 
  <td width="35%"> 
    <input type="text" name="bz" size="20" maxlength="100" >
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
	if(!(isNumber(FormName.ppbm, "��Ʒ�Ʊ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
