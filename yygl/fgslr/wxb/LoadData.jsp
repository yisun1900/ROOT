<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ssfgs=request.getParameter("ssfgs");
String dwbh=request.getParameter("dwbh");
String zqs=request.getParameter("zqs");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>导入</B><BR>
<HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>请选择上载EXECEL文件</b></td>
      </tr>
      
      
      <tr align="center"> 
        <td width="48%" height="33" align="right">所属分公司：</td>
        <td width="52%" height="33" align="left">
          <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
          </select>        </td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="48%">所属部门：</td>
        <td height="34" align="left" width="52%"> 
          <select name="ssbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
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
             <input type="hidden" name="zqs" value="<%=zqs%>">
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
function f_onclick(FormName)
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ssbm)=="") {
		alert("请选择[所属部门]！");
		FormName.ssbm.focus();
		return false;
	}


	FormName.target="";
	FormName.action="DisData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>