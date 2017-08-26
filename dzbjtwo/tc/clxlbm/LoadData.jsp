<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String count=cf.executeQuery("select count(*) from jxc_fclybl ");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>导入辅材领用比例</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载EXECEL文件</b></td>
      </tr>
      <tr align="center">
        <td width="47%" height="33" align="right">数据已存在『<%=count%>』条：</td>
        <td width="53%" height="33" align="left">
			<input name="button" type="button" onClick="f_delete(loadform)"  value="删除数据">
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
            <input type="button"  value="继续" onClick="f_onclick(loadform)">
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