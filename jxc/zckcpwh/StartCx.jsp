<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String[] clbm = request.getParameterValues("clbm");
	String dqbm=request.getParameter("dqbm");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ������Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�Ƿ��д���</td>
              <td width="30%"> 
                <INPUT type="radio" name="sfycx" value="Y" checked>
                �д��� </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">�������޸Ĺ�ʽ��</td>
              <td colspan="3"> 
                <select name="fh">
                  <option value=""></option>
                  <option value="(">(</option>
                  <option value=")">)</option>
                  <option value="*">��</option>
                  <option value="/">��</option>
                  <option value="+">+</option>
                  <option value="-">-</option>
                  <option value="cbj">�����</option>
                  <option value="lsj">�г����</option>
                  <option value="xsj">���ۼ�</option>
                  <option value="cxj">������</option>
                </select>
                <input type="text" name="xs" size="14">
                <input type="button"  value="����" onClick="gs.value+=fh.value+xs.value" name="button">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">������= </td>
              <td colspan="3"> 
                <input type="text" name="gs" size="30" readonly="true">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="20%" align="right">���������</td>
              <td width="30%"> 
                <input type="text" name="cxcbj" value="" size="20" maxlength="9" >
              </td>
              <td width="20%" align="right">�����ڼ�������</td>
              <td width="30%"> 
                <input type="text" name="lscxhdbl" value="" size="12" maxlength="9" >
                % <font color="#0000CC">���ٷֱȣ�</font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">������ʼʱ��</td>
              <td width="30%"> 
                <input type="text" name="cxkssj" value="<%=cf.today()%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
              <td width="20%" align="right">��������ʱ��</td>
              <td width="30%"> 
                <input type="text" name="cxjzsj" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> <%
	for (int i=0;i<clbm.length ;i++ )
	{
		out.println("<input type=\"hidden\" name=\"clbm\"  value=\""+clbm[i]+"\">");
	}
%> 
				<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                </div>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gs)=="") {
		alert("������[�������޸Ĺ�ʽ]��");
		FormName.gs.focus();
		return false;
	}

	if(	javaTrim(FormName.cxcbj)=="") {
		alert("������[���������]��");
		FormName.cxcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cxcbj, "���������"))) {
		return false;
	}
	if(	javaTrim(FormName.lscxhdbl)=="") {
		alert("������[�����ڼ�������]��");
		FormName.lscxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.lscxhdbl, "�����ڼ�������"))) {
		return false;
	}
	if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
	{
		alert("����[�����ڼ�������]Ӧ��0��100֮��");
		FormName.lscxhdbl.focus();
		return false;
	}
	if(	javaTrim(FormName.cxkssj)=="") {
		alert("������[������ʼʱ��]��");
		FormName.cxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxkssj, "������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cxjzsj)=="") {
		alert("������[��������ʱ��]��");
		FormName.cxjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cxjzsj, "��������ʱ��"))) {
		return false;
	}
	if (FormName.cxkssj.value>FormName.cxjzsj.value)
	{
		alert("[������ʼʱ��]���ܴ���[��������ʱ��]��");
		FormName.cxjzsj.select();
		return false;
	}

	
	FormName.action="SaveStartCx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
