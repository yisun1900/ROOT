<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���ذ����Ƭ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
String khxm=cf.GB2Uni(cf.getParameter(request,"khxm"));
%>
<body bgcolor="#FFFFFF" onload="wjsm.value=''">
<CENTER><B>��������ϴ����ͻ���<%=khxm%>��</B><BR><HR>
<form method="post" action="saveLoadWj.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      
      <tr > 
        <td width="26%" height="41" align="right" ><b><span class="STYLE1">*</span>��ѡ���ϴ��ļ�</b></td>
        <td width="74%" ><input type="file" name="loadname" value="" size="60"></td>
      </tr>
      <tr > 
        <td height="95" align="right" ><strong>�ļ�˵��</strong></td>
        <td ><textarea name="wjsm" cols="68" rows="3"></textarea></td>
      </tr>
      <tr bgcolor="#999999"> 
        <td colspan="2" align="center"> 
		<input type="hidden" name="khbh" value="<%=khbh%>" >
            <input type="button"  value="��ʼ�ϴ�" onClick="f_onclick(loadform)">
			&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" onClick="window.open('/zlkxt/EditLoadWj.jsp?khbh=<%=khbh%>')" value="�鿴�ϴ��ļ�" >
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
		alert("��ѡ���ϴ��ļ���");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>