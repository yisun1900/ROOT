<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��ľ�ű���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhjs=(String)session.getAttribute("yhjs");
String dqbm = request.getParameter("dqbm");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0" style="FONT-SIZE:16">
      <tr align="center"> 
        
      <td colspan="2" height="52">
        <p><b>����--ľ�ű��ۣ�����ѡ��ľ�ű���EXECEL�ļ�</b></p>
        <p><b><font color="#FF3333">ע�⣺����ǰ��ɾ���ɱ���
          <input type="button" name="Button" value="ɾ����ȫ����ľ�ű���" onClick=window.open("ChooseDel.jsp?dqbm=<%=dqbm%>")>
          </font></b></p>
      </td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="65"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr valign="middle"> 
        <td colspan="2" align="center"> 
			<input name="dqbm" type="hidden" value="<%=dqbm%>" >
          <input type="button"  value="����" onClick="f_onclick(loadform)">
        </td>
      </tr>
    </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	FormName.action="DisImpData.jsp";

	FormName.submit();
	return true;
} 
//-->
</script>