<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010218")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<html>
<head>
<title>��ɫ������Ȩ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><font color="#000099"><b>��ɫ����������Ȩ</b></font> 
      </div>
    </td>
  </tr>
	<tr> 
	  <td colspan="2" align="center"> 
		<input type="button"  value="����" onClick="f_do(insertform)">
		<input type="reset"  value="����" name="reset">
	  </td>
	</tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SavePlSqJs.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="50%" height="68" align="right"><font color="#CC0000">*</font>�û���ɫ</td>
              <td width="50%">
			  <select name="yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <option value="A0">�ܲ�</option>
                <option value="A1">�ܲ�������</option>
                <option value="F0">�ֹ�˾</option>
                <option value="F1">�ֹ�˾������</option>
                <option value="F2">����</option>
                <option value="F3">����С��</option>
                <option value="J0">������</option>
              </select></td>
            </tr>
            
            <tr> 
              <td colspan="2" align="center"> 
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh"  value="<%=ygbh[i]%>" >
		<%
	}
%>
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
	if(	javaTrim(FormName.yhjs)=="") {
		alert("��ѡ��[�û���ɫ]��");
		FormName.yhjs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
