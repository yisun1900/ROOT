<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ĺ�ͬ��ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String zjxbh=request.getParameter("zjxbh");

%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">�����������ӡ(�������ţ�<%=zjxbh%>)</div>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
          <input type="button" value="��ӡ����-�ͻ�" onClick="f_do(selectform,'dymx')">
          <input type="button" value="��ӡ����-����" onClick="f_do(selectform,'dycs')">
        </div>
      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName,lx)//����FormName:Form������
{

	if (lx=="dymx")
	{
		FormName.action="zcfjzjx.jsp";
	}
	else if (lx=="dycs")
	{
		FormName.action="gyszcfjzjx.jsp";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
