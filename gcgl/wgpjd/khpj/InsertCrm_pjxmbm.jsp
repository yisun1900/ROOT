<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_pjxmbm.jsp" name="insertform" target="_blank">
<div align="center">��¼������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��������Ա</td>
      <td width="31%"> 
        <select name="spjrybm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select spjrybm,spjry from crm_spjrybm order by spjrybm","");
%> 
        </select>
      </td>
      <td align="right" width="17%">��Ŀ����</td>
      <td width="33%"> 
        <select name="xmflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="pjxmbm.value=spjrybm.value+xmflbm.value" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select xmflbm,xmfl from crm_xmflbm order by xmflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������Ŀ����(6λ)</td>
      <td width="31%"> 
        <input type="text" name="pjxmbm" value="" size="20" maxlength="6" >
      </td>
      <td align="right" width="17%">���</td>
      <td width="33%"> 
        <input type="text" name="xh" value="" size="20" maxlength="8" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">������Ŀ</td>
      <td colspan="3"> 
        <input type="text" name="pjxm" value="" size="71" maxlength="40" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ʾ��ʽ</td>
      <td colspan="3"> 
        <input type="radio" name="xsfs"  value="1">
        ��Ŀ�����ѡ 
        <input type="radio" name="xsfs"  value="2">
        ��Ŀ���൥ѡ </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.spjrybm)=="") {
		alert("��ѡ��[��������Ա]��");
		FormName.spjrybm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmflbm)=="") {
		alert("��ѡ��[��Ŀ����]��");
		FormName.xmflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxmbm)=="") {
		alert("������[������Ŀ����(6λ)]��");
		FormName.pjxmbm.focus();
		return false;
	}
	if (FormName.pjxmbm.value.length!=6)
	{
		alert("[������Ŀ����]ӦΪ6λ��");
		FormName.pjxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.pjxm)=="") {
		alert("������[������Ŀ]��");
		FormName.pjxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xsfs)) {
		alert("��ѡ��[��ʾ��ʽ]��");
		FormName.xsfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
