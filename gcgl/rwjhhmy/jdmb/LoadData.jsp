<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String mbbm=request.getParameter("mbbm");
String count=cf.executeQuery("select count(*) from gdm_mbsjjd where mbbm='"+mbbm+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>模版时间节点</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载EXECEL文件</b></td>
      </tr>
      <tr align="center">
        <td height="33" align="right">该模版已存在『<%=count%>』条：</td>
        <td height="33" align="left"><input type="button" onClick="f_delete(loadform)"  value="删除"></td>
      </tr>
      <tr align="center"> 
        <td width="48%" height="33" align="right">模版</td>
        <td width="52%" height="33" align="left">
          <select name="mbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
	cf.selectItem(out,"select mbbm,mbmc from gdm_sgjdmb where mbbm='"+mbbm+"'",mbbm);
%> 
          </select>        </td>
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
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请选择[模版]！");
		FormName.mbbm.focus();
		return false;
	}

	if (!confirm("注意：删除后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteBjxm.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.mbbm)=="") {
		alert("请选择[模版]！");
		FormName.mbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.loadName)=="") {
		alert("请选择[上载文件]！");
		FormName.loadName.focus();
		return false;
	}

	FormName.target="";
	FormName.action="DisData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>