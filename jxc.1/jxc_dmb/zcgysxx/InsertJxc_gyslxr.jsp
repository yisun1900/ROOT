<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String gysbm=request.getParameter("gysbm");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼����ϵ����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJxc_gyslxr.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font>������Ӧ��</td>
              <td width="35%"> 
                <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx where gysbm='"+gysbm+"'","");
%> 
                </select>
              </td>
              <td width="15%" align="right"><font color="#FF0000">*</font>��ϵ������</td>
              <td width="35%"> 
                <input type="text" name="lxrxm" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>ְ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zw" value="" size="20" maxlength="50" >
              </td>
              <td width="15%"> 
                <div align="right"><font color="#FF0000">*</font>�ֻ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font>�칫�绰</td>
              <td colspan="3"> 
                <input type="text" name="bgdh" value="" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#FF0000">*</font>�Ƿ���ְ</td>
              <td width="35%"> 
                <input type="radio" name="sflz"  value="Y">
                �� 
                <input type="radio" name="sflz"  value="N" checked>
                �� </td>
              <td width="15%" align="right">����</td>
              <td width="35%"> 
                <input type="text" name="cz" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ������]��");
		FormName.gysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxrxm)=="") {
		alert("������[��ϵ������]��");
		FormName.lxrxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	!radioChecked(FormName.sflz)) {
		alert("��ѡ��[�Ƿ���ְ]��");
		FormName.sflz[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
