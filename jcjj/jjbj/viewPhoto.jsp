<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�鿴��Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String xcmbm=request.getParameter("xcmbm");
	String zpmc=cf.executeQuery("select zpmc from jc_bgmbj where xcmbm='"+xcmbm+"'");
%>

<body bgcolor="#FFFFFF">

<CENTER><B>�Ͳ��ű��룺<%=xcmbm%></B></CENTER>
<HR>

<form method="post" action="deletePhoto.jsp" name="editform">

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFFF"> 
	  <td width="31%"> <font color="#000099">�ļ�����</font>	 </td>
	  <td width="69%"> <font color="#000099">��Ƭ</font>	 </td>
	</tr>
	<tr align="center" bgcolor="#FFFFFF"> 
	  <td width="31%">
		<%=zpmc%>
		<input type="hidden" name="zpmc" value="<%=zpmc%>" >
	  </td>
	  <td width="69%"><img src="images/<%=zpmc%>"></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	  <td colspan="2" align="center" > 
		<input type="hidden" name="xcmbm" value="<%=xcmbm%>" >
		<input type=button value='ɾ����Ƭ' onClick="f_onclick(editform)">
	  </td>
	</tr>
</table>

</form>

</body>
</html>

<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if ( confirm("ȷʵҪ������?") )	{
		FormName.submit();
		return true;
	}
} 
//-->
</script>