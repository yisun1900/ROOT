<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%String ygbh=(String)session.getAttribute("ygbh");%>

<html>
<head>
<title>�������ѯ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="Crm_tsbxxtdList.jsp" name="selectform">
<div align="center">�������ѯ����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Ͷ�߱��޼�¼��</td> 
  <td width="35%"> 
    <input type="text" name="tsjlh" size="20" maxlength="9" >  </td>
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"><input type="text" name="khbh" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">¼����</td> 
  <td width="35%"><input type="text" name="lrr" value="<%=ygbh%>" size="20" maxlength="8" ></td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Э���ֹ�˾</td> 
  <td width="35%">
  <select name="xtfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(selectform);" >
   <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and dwlx in ('A0','F0') ","");
%> 
</select> </td>
  <td align="right" width="15%">Э������</td> 
  <td width="35%">
  <select name="xtbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
<option value=""></option>
</select> </td>
</tr>
<tr bgcolor="#99FFFF">
  <td align="right" width="15%">Э������ ��</td> 
  <td width="35%"> 
    <input type="text" name="xtrq" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="xtrq2" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FF99FF">
  <td align="right" width="15%">Э������ ��</td> 
  <td width="35%"> 
    <input type="text" name="xtfy" size="20" maxlength="17" >  </td>
  <td align="right" width="15%">��</td> 
  <td width="35%"><input type="text" name="xtfy2" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFF99">
  <td align="right" width="15%">¼��ʱ�� �� </td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%">��</td> 
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
<%
	//����Ajax
	cf.ajax(out);
%>

function changeFgs(FormName)
{
	FormName.xtbm.length=1;

	if (FormName.xtfgs.value=="")
	{
		return;
	}

//	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('F1','F2') and ssdw='"+FormName.xtfgs.value+"' order by dwbh";
	var sql="select dwbh,dwmc from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and  cxbz='N' and ssfgs='"+FormName.xtfgs.value+"' order by dwbh";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}
function getAjax(ajaxRetStr) 
{
	strToSelect(selectform.xtbm,ajaxRetStr);
}
function f_do(FormName)//����FormName:Form������
{
	if(!(isDatetime(FormName.xtrq, "Э������"))) {
		return false;
	}
	if(!(isFloat(FormName.xtfy, "Э������"))) {
		return false;
	}
	if(!(isNumber(FormName.lrr, "¼����"))) {
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}

	if(!(isDatetime(FormName.xtrq2, "Э������"))) {
		return false;
	}
	if(!(isFloat(FormName.xtfy2, "Э������"))) {
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
