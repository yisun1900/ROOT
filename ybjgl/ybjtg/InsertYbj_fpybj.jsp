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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertYbj_fpybj.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="sqbh" value="" size="20" maxlength="8" >
  </td>
  <td width="15%"> 
    <div align="right">�����</div>
  </td>
  <td width="35%"> 
    <select name="ybjbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select ybjbh,ybjmc from ybj_ybjxxb order by ybjbh","");
%>
    </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fpr" value="" size="20" maxlength="20" >
  </td>
  <td width="15%"> 
    <div align="right">����ʱ��</div>
  </td>
  <td width="35%"> 
    <input type="text" name="fpsj" value="" size="20" maxlength="10" >
  </td>
</tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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
	if(	javaTrim(FormName.sqbh)=="") {
		alert("������[������]��");
		FormName.sqbh.focus();
		return false;
	}
	if(!(isNumber(FormName.sqbh, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.ybjbh)=="") {
		alert("��ѡ��[�����]��");
		FormName.ybjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fpr)=="") {
		alert("������[������]��");
		FormName.fpr.focus();
		return false;
	}
	if(!(isDatetime(FormName.fpsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
