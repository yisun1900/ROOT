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
<form method="post" action="Ybj_stybjglCxList.jsp" name="selectform">
<div align="center">ʵ��������ѯ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
    <input type="text" name="ybj_stybjgl_ybjbh" size="20" maxlength="20" >  </td>
  <td align="right" width="15%">�����ֹ�˾</td> 
  <td width="35%"><select name="ybj_stybjgl_ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����</td> 
  <td width="35%"><%
	cf.radioToken(out, "ybj_stybjgl_lx","1+�����&2+��������","");
%></td>
  <td align="right" width="15%">״̬</td> 
  <td width="35%"><%
	cf.radioToken(out, "ybj_stybjgl_clzt","1+��ʹ��&2+����","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><input type="text" name="ybj_stybjgl_lrr" size="20" maxlength="20" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼��ʱ�� ��</td> 
  <td width="35%"><input type="text" name="ybj_stybjgl_lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="ybj_stybjgl_lrsj2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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
	if(!(isDatetime(FormName.ybj_stybjgl_lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.ybj_stybjgl_lrsj2, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
