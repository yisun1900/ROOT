<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String gtxh=request.getParameter("gtxh");
String ddbh=request.getParameter("ddbh");
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_ddbjmx.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gtxh" value="<%=gtxh%>" size="20" maxlength="8" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�������</div>
              </td>
              <td width="32%"> 
                <select name="jjbjmcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jjbjmcbm,jjbjmc from jdm_jjbjmcbm order by jjbjmcbm","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="dj" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">������ȣ�mm��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="bjcd" value="" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">�����ȣ�mm��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="bjkd" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sl" value="" size="20" maxlength="8" >
              </td>
              <td width="18%"> 
                <div align="right">���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="je" value="" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
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
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}
	if(!(isNumber(FormName.gtxh, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jjbjmcbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.jjbjmcbm.focus();
		return false;
	}
	if(!(isNumber(FormName.bjcd, "������ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.bjkd, "�����ȣ�mm��"))) {
		return false;
	}
	if(!(isNumber(FormName.sl, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.dj, "����"))) {
		return false;
	}
	if(!(isNumber(FormName.je, "���"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
