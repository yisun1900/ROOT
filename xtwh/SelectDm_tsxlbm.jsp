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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �������ѯ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="Dm_tsxlbmList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="19%"> 
                <div align="right">Ͷ�߱���С�����</div>
  </td>
              <td width="31%"> 
                <input type="text" name="dm_tsxlbm_tsxlbm" size="20" maxlength="4" >
  </td>
              <td width="20%"> 
                <div align="right">Ͷ�߱���С������</div>
  </td>
              <td width="30%"> 
                <input type="text" name="dm_tsxlbm_tsxlmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="19%"> 
                <div align="right">Ͷ�߱��޴���</div>
  </td>
              <td width="31%"> 
                <select name="dm_tsxlbm_tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm order by tslxbm","");
%>
    </select>
  </td>
              <td width="20%"> 
                <div align="right">����</div>
  </td>
              <td width="30%"> 
                <input type="text" name="dm_tsxlbm_px" size="20" maxlength="8" >
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
	if(!(isNumber(FormName.dm_tsxlbm_px, "����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>