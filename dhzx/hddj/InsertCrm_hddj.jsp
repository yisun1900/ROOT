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
String yhdlm=(String)session.getAttribute("yhdlm");
%>

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

<form method="post" action="SaveInsertCrm_hddj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��ϵ��ʽ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="lxfs" value="" size="20" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��װ�޵�ַ</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" value="" size="57" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�ص�װ�޵�ַ</td>
              <td colspan="3"> 
                <input type="text" name="cgdz" value="" size="57" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ص�ʩ����</div>
              </td>
              <td width="35%"> 
                <select name="hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh","");
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ص�����</div>
              </td>
              <td width="35%"> 
				<input name="hdsgbz" type="text" value="" maxlength="20" size="20">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ص����ʦ</div>
              </td>
              <td width="35%">
                <input type="text" name="hdsjs" value="" size="20" maxlength="20" >
              </td>
              <td width="15%"> 
                <div align="right">¼����</div>
              </td>
              <td width="35%">
                <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"></textarea>
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
	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[��װ�޵�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.cgdz)=="") {
		alert("������[�ص�װ�޵�ַ]��");
		FormName.cgdz.focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.hdsgd)=="") {
		alert("������[�ص�ʩ����]��");
		FormName.hdsgd.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
