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

<form method="post" action="SaveInsertJdm_ppbm.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">Ʒ�Ʊ���</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ppbm" value="" size="20" maxlength="2" >
  </td>
  <td width="15%"> 
    <div align="right">Ʒ������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="ppmc" value="" size="20" maxlength="50" >
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">��������</div>
  </td>
  <td width="35%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by zclb,gysmc","");
%>
    </select>
  </td>
  <td width="15%"> 
                <div align="right">�������</div>
  </td>
  <td width="35%">
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcdlbm,zcdlmc from jdm_zcdlbm  order by zcdlbm","");
%> 
                </select>
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
	if(	javaTrim(FormName.ppbm)=="") {
		alert("������[Ʒ�Ʊ���]��");
		FormName.ppbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("������[Ʒ������]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��������]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zclb)=="") {
		alert("��ѡ��[�������]��");
		FormName.zclb.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
