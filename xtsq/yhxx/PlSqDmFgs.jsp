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
<title>��Ȩ���湫˾</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String[] ygbh=request.getParameterValues("ygbh");
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"><font color="#000099"><b>��Ȩ���湫˾</b></font>      </div>    </td>
  </tr>
	
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SavePlSqDmFgs.jsp" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="50%" height="68" align="center"><strong><font color="#FF0000" size="5">
			  �ѡ����桿��ɫ��Ȩ���������桿
			  <P>
			  �ѡ��ֹ�˾���ֹ�˾���š���ɫ��Ȩ��������˾��
			  <P>
			  �ѡ��ܲ����ܲ����š���ɫ��Ȩ��ȫ����˾��
			  </font></strong></td>
            </tr>
            
            <tr> 
              <td align="center"> 
<%
	for (int i=0;i<ygbh.length ;i++ )
	{
		%>
		<input type="hidden" name="ygbh"  value="<%=ygbh[i]%>" >
		<%
	}
%>
                <input type="button"  value="����" onClick="f_do(insertform)"></td>
            </tr>
          </table>
</form>
	  </div>    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
