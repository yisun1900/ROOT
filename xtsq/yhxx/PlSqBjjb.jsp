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
<title>��Ȩ���ۼ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><font color="#000099"><b>��Ȩ���ۼ���</b></font> 
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

<form method="post" action="SavePlSqBjjb.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="46%" height="68" align="right"><font color="#CC0000">*</font>���ۼ���</td>
              <td width="54%"><select name="bjjbbm" style="FONT-SIZE:12px;WIDTH:160px" size="10" multiple  >
                <%
cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","");
%>
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
	if(	!selectChecked(FormName.bjjbbm)) {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
