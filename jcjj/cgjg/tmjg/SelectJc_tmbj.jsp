<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="Jc_tmbjList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">̨�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_tmbj_tmbm" size="20" maxlength="5" >
  </td>
  <td width="15%"> 
    <div align="right">̨������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_tmbj_tmmc" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">̨��ϵ��</div>
  </td>
  <td width="35%"> 
    <select name="jc_tmbj_tmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select tmxlbm,tmxlmc from jdm_tmxlbm order by tmxlbm","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">�ͺ�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_tmbj_xh" size="20" maxlength="20" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">���׼۸�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_tmbj_ymjg" size="20" maxlength="9" >
  </td>
  <td width="15%"> 
    <div align="right">ƽ�׼۸�</div>
  </td>
  <td width="35%"> 
    <input type="text" name="jc_tmbj_pmjg" size="20" maxlength="9" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">Ʒ��</div>
  </td>
  <td width="35%"> 
    <select name="jc_tmbj_ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ppbm,ppmc from jdm_ppbm order by ppbm","");
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
	if(!(isFloat(FormName.jc_tmbj_ymjg, "���׼۸�"))) {
		return false;
	}
	if(!(isFloat(FormName.jc_tmbj_pmjg, "ƽ�׼۸�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
