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

<form method="post" action="SaveInsertCrm_khhfjh.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khbh" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">����״̬</div>
              </td>
              <td width="35%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="N">δ�ط�</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="35%"> 
                <select name="xb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <option value="M">��</option>
                  <option value="W">Ů</option>
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���ݵ�ַ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="fwdz" value="" size="20" maxlength="100" >
              </td>
              <td width="15%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�ط�����</td>
              <td width="35%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm","");
%> 
                </select>
              </td>
              <td width="15%" align="right">�ط�����</td>
              <td width="35%"> 
                <input type="text" name="xchfrq" value="" size="20" maxlength="10" >
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xchfrq)=="") {
		alert("������[�´λط�����]��");
		FormName.xchfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.xchfrq, "�´λط�����"))) {
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("��ѡ��[�ط�����]��");
		FormName.hflxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.xb)=="") {
		alert("��ѡ��[�Ա�]��");
		FormName.xb.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.clzt)=="") {
		alert("��ѡ��[����״̬]��");
		FormName.clzt.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
