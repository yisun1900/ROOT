<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>youboli</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String aaa=cf.GB2Uni(request.getParameter("aaa"));
	if (cf.HaHei(aaa).equals("-1"))
	{
		return;
	}
%>
<body bgcolor="#FFFFFF">
<CENTER>
	<form method="post" action="" name="onloadform" >
    <table width="100%" border="0">
      <tr> 
        <td colspan="2" height="52" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" height="43" width="30%">表名</td>
        <td width="70%" height="43"> 
          <input type="text" name="tab1" size="60" value="jc_mmbjb">
        </td>
      </tr>
      <tr> 
        <td align="right" height="39" width="30%">TXT文件位置</td>
        <td width="70%" height="39"> 
          <input type="text" name="mu1" size="60" value="g:\tomcat\webapps\ROOT\xtsq\tsgx\jc_mmbjb.txt">
        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p>
            <input type="button"  value="删除旧报价报价" onClick="window.open('aabbcc.jsp')" name="button">
            <input type="hidden" name="aaa" value="<%=aaa%>" >
            <input type="button"  value="更新报价" onclick="f_onload(onloadform)">
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
function f_onload(FormName)
{
	if(	javaTrim(FormName.tab1)=="") {
		alert("请选择[表名]！");
		FormName.tab1.focus();
		return false;
	}
	if(	javaTrim(FormName.mu1)=="") {
		alert("请选择[位置]！");
		FormName.mu1.focus();
		return false;
	}
	FormName.action="KldsDrc.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>