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
String cgbm=request.getParameter("cgbm");
String cgmc=cf.GB2Uni(request.getParameter("cgmc"));
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ��¼��ع�۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_tgjgb.jsp" name="insertform" target="_blank">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cgbm" value="<%=cgbm%>" size="20" maxlength="5" readonly>
  </td>
  <td width="15%"> 
                <div align="right">��������</div>
  </td>
              <td width="35%">
                <input type="text" name="cgmc" value="<%=cgmc%>" size="20" maxlength="50" readonly>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">�ع�߶�����</div>
  </td>
              <td width="35%">
                <select name="tggdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tggdbm,tggdmc from jdm_tggdbm order by tggdbm","");
%> 
                </select>
              </td>
  <td width="15%"> 
                <div align="right">�ع��������</div>
  </td>
              <td width="35%">
                <select name="tgjsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tgjsbm,tgjsmc from jdm_tgjsbm order by tgjsbm","");
%> 
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">���ۼ�</div>
  </td>
              <td width="35%">
                <input type="text" name="lsj" value="" size="20" maxlength="9" >
              </td>
  <td width="15%"> 
                <div align="right">�Żݼ�</div>
  </td>
  <td width="35%">
                <input type="text" name="yhj" value="" size="20" maxlength="9" >
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
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tggdbm)=="") {
		alert("��ѡ��[�ع�߶�����]��");
		FormName.tggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tgjsbm)=="") {
		alert("��ѡ��[�ع��������]��");
		FormName.tgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("������[���ۼ�]��");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("������[�Żݼ�]��");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "�Żݼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
