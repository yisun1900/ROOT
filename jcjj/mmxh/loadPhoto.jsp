<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>������Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String mmxh=request.getParameter("mmxh");
	String dqbm=request.getParameter("dqbm");
%>

<body bgcolor="#FFFFFF">

<CENTER><B>ľ���ͺţ�<%=mmxh%></B></CENTER>
<HR>

<form method="post" action="saveLoad.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ��������Ƭ</b></td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadname" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
			<input type="hidden" name="mmxh" value="<%=mmxh%>">
			<input type="hidden" name="dqbm" value="<%=dqbm%>">
            <input type="button"  value="����ͼƬ" onclick="f_onclick(loadform)">
          </p>
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_onclick(FormName)
{
	if(	javaTrim(FormName.loadname)=="") {
		alert("��ѡ��������Ƭ��");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>