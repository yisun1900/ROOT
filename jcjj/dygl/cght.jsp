<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����ͬ��ӡ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String ddbh=request.getParameter("ddbh");
	String khbh=cf.executeQuery("select khbh from jc_cgdd where ddbh='"+ddbh+"'");
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform" target="_blank">
  <table width="100%">
    <tr> 
      <td colspan="2" height="74"> 
        <div align="center">�����ͬ��ӡ(Ԥ������ţ�<%=ddbh%>)</div>
      </td>
    </tr>
    <tr> 
      <td colspan="2" height="95"> 
        <div align="center"> 
          <input type="button" value="��ӡԤ����" onClick="f_do(selectform,'dyydd')">
        </div>
      </td>
    </tr>
    <tr> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
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

	if (lx=="dyht")
	{
		FormName.action="cgdd.jsp";
	}
	else if (lx=="dymx")
	{
		FormName.action="cgfj.jsp";
	}
	else if (lx=="dyydd")
	{
		FormName.action="dyydd.jsp?lx=cg&ddbh=<%=ddbh%>";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
