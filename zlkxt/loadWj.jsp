<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>上载版库照片</title>
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
<CENTER><B>设计资料上传（客户：<%=khxm%>）</B><BR><HR>
<form method="post" action="saveLoadWj.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      
      <tr > 
        <td width="26%" height="41" align="right" ><b><span class="STYLE1">*</span>请选择上传文件</b></td>
        <td width="74%" ><input type="file" name="loadname" value="" size="60"></td>
      </tr>
      <tr > 
        <td height="95" align="right" ><strong>文件说明</strong></td>
        <td ><textarea name="wjsm" cols="68" rows="3"></textarea></td>
      </tr>
      <tr bgcolor="#999999"> 
        <td colspan="2" align="center"> 
		<input type="hidden" name="khbh" value="<%=khbh%>" >
            <input type="button"  value="开始上传" onClick="f_onclick(loadform)">
			&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" onClick="window.open('/zlkxt/EditLoadWj.jsp?khbh=<%=khbh%>')" value="查看上传文件" >
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
		alert("请选择上传文件！");
		FormName.loadname.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>