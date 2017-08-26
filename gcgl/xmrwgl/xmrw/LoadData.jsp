<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<%
String khbh=request.getParameter("khbh");
String count=cf.executeQuery("select count(*) from crm_xmrwgl where khbh='"+khbh+"'");
String jjrksg=cf.executeQuery("select jjrksg from crm_khxx where khbh='"+khbh+"'");
if (jjrksg==null)
{
	jjrksg="1";//1：节、假日不可施工；2：节日不可施工； 9：不限制
}
%>


<body bgcolor="#FFFFFF">
<CENTER><B>导入项目计划（客户编号：<%=khbh%>）</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" >
			<A HREF="CSH15-导入项目计划.xls"><B>下载【标准】模板</B></A>
			<BR>
			<BR>
			<A HREF="boloni进度导入模板.xls"><B>下载【boloni】模板</B></A>
			<BR>
			<BR>
			<A HREF="钛马赫进度导入模板.xls"><B>下载【钛马赫】模板</B></A>
			<BR>
			<BR> 
			<b>请选择上载EXECEL文件</b>
			<BR>
			<BR> 
		
		</td>
      </tr>
      <tr align="center">
        <td width="48%" height="33" align="right">已选择任务『<%=count%>』个：</td>
        <td width="52%" height="33" align="left"><input name="button" type="button" onClick="f_delete(loadform)"  value="删除"></td>
      </tr>
      <tr align="center">
        <td height="33" align="right"><span class="STYLE1">*</span>选择节假日可施工</td>
        <td height="33" align="left">
          <INPUT type="radio" name="jjrksg" value="1" <%if (jjrksg.equals("1")) out.println("CHECKED");%> >
          节、假日不可施工
		  <BR>
          <INPUT type="radio" name="jjrksg" value="2" <%if (jjrksg.equals("2")) out.println("CHECKED");%>  >
          节日不可施工
 		  <BR>
         <INPUT type="radio" name="jjrksg" value="9" <%if (jjrksg.equals("9")) out.println("CHECKED");%> >
          不限制</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="71"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
		<input type="hidden" name="khbh" value="<%=khbh%>">
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
	if(	javaTrim(FormName.khbh)=="") {
		alert("请选择[客户编号]！");
		FormName.khbh.focus();
		return false;
	}


	if (!confirm("注意：删除后不可恢复，确实要继续吗？") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteXm.jsp?khbh=<%=khbh%>";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请选择[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.jjrksg)) {
		alert("请选择[节假日可施工]！");
		FormName.jjrksg[0].focus();
		return false;
	}
	if(	javaTrim(FormName.loadName)=="") {
		alert("请选择[上载EXECEL文件]！");
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