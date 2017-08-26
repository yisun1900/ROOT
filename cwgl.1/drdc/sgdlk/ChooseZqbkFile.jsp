<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>中期拨款－导入</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<CENTER><B>中期拨款－导入</B><BR><HR>
<form method="post" action="DisChooseZqbkFile.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>请选择上载EXECEL文件</b></td>
      </tr>
      <tr> 
        <td width="15%" height="2" align="right">&nbsp;</td>
        <td width="85%" height="2">选择分公司：<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      </tr>
      <tr> 
        <td width="15%" height="49" align="right">&nbsp;</td>
        <td width="85%" height="49">科 目代 码： 
          <select name="kmdm" style="FONT-SIZE:13PX;WIDTH:330PX" >
            <option value=""></option>
            <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select kmdm,kmdm||' '||kmmc from cw_jzkmdm order by fgsbh,kmdm","115.03");
	}
	else{
		cf.selectItem(out,"select kmdm,kmdm||' '||kmmc from cw_jzkmdm where fgsbh='"+ssfgs+"' order by kmdm","115.03");
	}
%> 
          </select>
        </td>
      </tr>
      <tr> 
        <td width="15%" height="48" align="center">&nbsp;</td>
        <td width="85%" height="48">凭 证摘 要： 
          <input type="text" name="fexp" maxlength="254" size="45" value="二期拨款">
        </td>
      </tr>
      <tr>
        <td width="15%" height="45" align="center">&nbsp;</td>
        <td width="85%" height="45">操 作类 型：
          <input type="radio" name="czlx" value="1" checked>
          转为凭证、导入ERP 
          <input type="radio" name="czlx" value="2">
          只转为凭证 
          <input type="radio" name="czlx" value="3">
          只导入ERP </td>
      </tr>
      <tr> 
        <td width="15%" height="45" align="center">&nbsp; </td>
        <td width="85%" height="45"> 
          <input type="file" name="loadName" value="" size="60">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="继续" onclick="f_onclick(loadform)">
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
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("请选择[分公司]！");
		FormName.fgsbh.focus();
		return false;
	}

	if(	javaTrim(FormName.kmdm)=="") {
		alert("请选择[科目代码]！");
		FormName.kmdm.focus();
		return false;
	}

	if(	javaTrim(FormName.fexp)=="") {
		alert("请选择[凭证摘要]！");
		FormName.fexp.focus();
		return false;
	}

	if(	javaTrim(FormName.loadName)=="") {
		alert("请选择[上载文件]！");
		FormName.loadName.focus();
		return false;
	}
	FormName.submit();
	return true;
} 
//-->
</script>