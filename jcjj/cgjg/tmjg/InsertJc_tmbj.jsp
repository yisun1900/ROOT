<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveInsertJc_tmbj.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">̨�����</div>
              </td>
              <td width="34%"> 
                <input type="text" name="tmbm" value="" size="20" maxlength="5" >
              </td>
              <td width="15%"> 
                <div align="right">Ʒ��</div>
              </td>
              <td width="35%"> 
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from jdm_ppbm order by ppbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">̨������</td>
              <td colspan="3"> 
                <input type="text" name="tmmc" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">̨��ϵ��</div>
              </td>
              <td width="34%"> 
                <select name="tmxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
                <input type="text" name="xh" value="" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right">���׼۸�</div>
              </td>
              <td width="34%"> 
                <input type="text" name="ymjg" value="0" size="20" maxlength="9" >
              </td>
              <td width="15%"> 
                <div align="right">ƽ�׼۸�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="pmjg" value="0" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��Ƭ</td>
              <td colspan="3"> 
                <input type="text" name="zp" value="" size="72" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
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
	if(	javaTrim(FormName.tmbm)=="") {
		alert("������[̨�����]��");
		FormName.tmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmmc)=="") {
		alert("������[̨������]��");
		FormName.tmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.tmxlbm)=="") {
		alert("��ѡ��[̨��ϵ��]��");
		FormName.tmxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ymjg)=="") {
		alert("������[���׼۸�]��");
		FormName.ymjg.focus();
		return false;
	}
	if(!(isFloat(FormName.ymjg, "���׼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.pmjg)=="") {
		alert("������[ƽ�׼۸�]��");
		FormName.pmjg.focus();
		return false;
	}
	if(!(isFloat(FormName.pmjg, "ƽ�׼۸�"))) {
		return false;
	}
	if(	javaTrim(FormName.ppbm)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
