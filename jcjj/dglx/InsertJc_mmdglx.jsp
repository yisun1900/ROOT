<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
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

<form method="post" action="SaveInsertJc_mmdglx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
              <div align="right"><span class="STYLE1">*</span>ľ�Ŷ������ͱ���</div>              </td>
              <td width="33%"> 
              <input type="text" name="mmdglxbm" value="" size="20" maxlength="2" >              </td>
              <td width="17%"> 
              <div align="right"><span class="STYLE1">*</span>ľ�Ŷ�����������</div>              </td>
              <td width="33%"> 
              <input type="text" name="mmdglxmc" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1">*</span>�Ƽ۷�ʽ</td>
              <td colspan="3"><%
	cf.radioToken(out, "jjfs","11+ľ��<BR>&12+˫���ƿ�<BR>&13+˫�ڴ���<BR>&14+�����ƿ�<BR>&15+���ڴ���<BR>&21+������<BR>&22+�Ŷ���<BR>&31+��Ʈ������<BR>&32+��Ʈ��ƽ̨�Ͽ�<BR>&41+ƽ���׼Ƽ�<BR>&42+���׼Ƽ�<BR>&43+�ֶ�ƽ���׼Ƽ�<BR>&44+�ֶ����׼Ƽ�<BR>&45+�ֶΰ����ȼƼ�","");
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
              <div align="right"><span class="STYLE1">*</span>�ص��Ӽ���</div>              </td>
              <td width="33%"> 
                <input type="text" name="tdjjl" value="" size="20" maxlength="9" >
              % </td>
              <td width="17%"> 
              <div align="right"></div>              </td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">              </td>
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("������[ľ�Ŷ������ͱ���]��");
		FormName.mmdglxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxmc)=="") {
		alert("������[ľ�Ŷ�����������]��");
		FormName.mmdglxmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjfs)) {
		alert("��ѡ��[�Ƽ۷�ʽ]��");
		FormName.jjfs[0].focus();
		return false;
	}
	if(	javaTrim(FormName.tdjjl)=="") {
		alert("������[�ص��Ӽ���]��");
		FormName.tdjjl.focus();
		return false;
	}
	if(!(isFloat(FormName.tdjjl, "�ص��Ӽ���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
