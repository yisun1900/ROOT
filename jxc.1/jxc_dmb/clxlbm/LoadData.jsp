<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String count=cf.executeQuery("select count(*) from jxc_fclybl ");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>���븨�����ñ���</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr align="center">
        <td width="47%" height="33" align="right">�����Ѵ��ڡ�<%=count%>������</td>
        <td width="53%" height="33" align="left">
			<input name="button" type="button" onClick="f_delete(loadform)"  value="ɾ������">
		</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="����" onClick="f_onclick(loadform)">
          </p>        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_delete(FormName)
{
	FormName.target="_blank";
	FormName.action="deleteData.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	FormName.target="";
	FormName.action="DisData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>