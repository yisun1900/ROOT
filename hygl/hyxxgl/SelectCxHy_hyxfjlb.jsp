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

<form method="post" action="Hy_hyxfjlbCxList.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��Ա���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hy_hyxfjlb_hybh" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">ҵ�����</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hy_hyxfjlb_ywxh" size="20" maxlength="8" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">����ص�</div>
  </td>
  <td width="35%"> 
    <select name="hy_hyxfjlb_dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','2','3') order by  dwbh","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">����ԭ��</div>
  </td>
  <td width="35%"> 
    <select name="hy_hyxfjlb_gmyy" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select xh,gmyy from hy_gmyydmb order by xh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
  ��<input type="text" name="hy_hyxfjlb_gmrq" size="20" maxlength="10" >
  <BR>��<input type="text" name="hy_hyxfjlb_gmrq2" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">�����ܽ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hy_hyxfjlb_gmzje" size="20" maxlength="17" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <select name="hy_hyxfjlb_gmyjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gmyjbm,gmyjmc from hy_gmyjbm order by gmyjbm","");
%>
    </select>
  </td>
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hy_hyxfjlb_jbr" size="20" maxlength="16" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">ˮ�ʷ�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="hy_hyxxb_hykh" size="20" maxlength="10" >
  </td>
  <td width="15%"> 
    <div align="right">��Ա����</div>
  </td>
  <td width="35%"> 
    <select name="hy_hyxxb_hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh","");
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
	if(!(isDatetime(FormName.hy_hyxfjlb_gmrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.hy_hyxfjlb_gmrq2, "��������"))) {
		return false;
	}
	if(!(isFloat(FormName.hy_hyxfjlb_gmzje, "�����ܽ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
