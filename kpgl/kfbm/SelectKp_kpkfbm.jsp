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

<form method="post" action="Kp_kpkfbmList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�����۷ֱ���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_kpkfbm_kpkfbm" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">�����۷�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_kpkfbm_kpkfmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�۷���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="kp_kpkfbm_kfs" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">��Ϊ0����Ŀ</div>
  </td>
  <td width="35%"> 
    <select name="kp_kpkfbm_pfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select pfxmbm,pfxmmc from kp_pfxmbm order by pfxmbm","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�۷�����</div>
  </td>
  <td width="35%"> 
    <select name="kp_kpkfbm_kflx" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectToken(out,"1+�۷�&2+ĳ�����Ϊ0","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">&nbsp;</div>
  </td>
  <td width="35%"> 
    &nbsp;
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
	if(!(isNumber(FormName.kp_kpkfbm_kfs, "�۷���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>