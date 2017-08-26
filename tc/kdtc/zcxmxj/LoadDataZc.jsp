<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=request.getParameter("dqbm");
String count=cf.executeQuery("select count(*) from tckd_tcfgzcxmxj where dqbm='"+dqbm+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>套餐标准主材项目</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载EXECEL文件</b></td>
      </tr>
      <tr align="center">
        <td height="33" align="right">该级别报价项目已存在『<%=count%>』条：</td>
        <td height="33" align="left"><input type="button" onClick="f_delete(loadform)"  value="删除报价项目"></td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="48%">地区：</td>
        <td height="34" align="left" width="52%"> 
          <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}

	if (!confirm("注意：删除后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteBjxmZc.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.loadName)=="") {
		alert("请选择[上载文件]！");
		FormName.loadName.focus();
		return false;
	}

	FormName.target="";
	FormName.action="DisDataZc.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>