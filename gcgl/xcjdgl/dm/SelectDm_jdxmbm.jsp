<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getcheck.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Dm_jdxmbmList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="dm_jdxmbm_jdxmbm" size="20" maxlength="2" >
  </td>
  <td align="right" width="15%">������Ŀ����</td> 
  <td width="35%"> 
    <input type="text" name="dm_jdxmbm_jdxmmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������ͱ���</td> 
  <td width="35%"> 
    <select name="dm_jdxmbm_jdlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdlxbm,jdlxmc from dm_jdlxbm order by jdlxbm","");
%>
    </select>
  </td>
  <td align="right" width="15%">����ȷ������</td> 
  <td width="35%"> 
    <select name="dm_jdxmbm_jdqrlx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select jdqrlx,jdqrlxmc from dm_jdqrlx order by jdqrlx","");
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
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
