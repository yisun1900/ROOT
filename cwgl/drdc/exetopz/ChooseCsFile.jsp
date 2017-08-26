<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>厂商结款单－导入</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<body bgcolor="#FFFFFF">
<CENTER><B>厂商结款单－导入</B><BR><HR>
<form method="post" action="DisChooseCsFile.jsp" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center"><b>请选择上载EXECEL文件</b></td>
      </tr>
      <tr> 
        <td width="15%" height="42" align="right">&nbsp;</td>
        <td width="85%" height="42">选择 分 公司<%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:330PX\" >");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:330PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%></td>
      </tr>
      <tr> 
        <td width="15%" height="44" align="right">&nbsp;</td>
        <td width="85%" height="44">选择科目代码 
          <select name="kmdm" style="FONT-SIZE:13PX;WIDTH:330PX" >
            <option value=""></option>
            <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		cf.selectItem(out,"select kmdm,kmdm||' '||kmmc from cw_jckmdm where  fklxbm!='81' order by fgsbh,kmdm","");
	}
	else{
		cf.selectItem(out,"select kmdm,kmdm||' '||kmmc from cw_jckmdm where fgsbh='"+ssfgs+"' and fklxbm!='81' order by kmdm","");
	}
%> 
          </select>        </td>
      </tr>
      <tr> 
        <td width="15%" height="69" align="center">&nbsp; </td>
        <td width="85%" height="69"> 
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