<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>

<html>
<head>
<title>请输入查询条件</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 
        <p align="center"> 
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="jjrb.jsp" name="selectform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="2" height="48">查询日期
			  <BR>
                <b><font color="#CC0000" size="4">注意：该统计表会较慢，可能要几分钟时间</font></b> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="42%" align="right">分公司</td>
              <td width="58%"><%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"fgsbh\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="42%" align="right">录入时间 从</td>
              <td width="58%"> 
                <input type="text" name="cxrq" size="20" value="<%=cf.firstDay()%>" maxlength="10" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="42%" align="right">到</td>
              <td width="58%"> 
                <input type="text" name="cxrq2" size="20" value="<%=cf.today()%>" maxlength="10" >
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="2" height="66"> 
                <input type="button"  value="查询" onClick="f_do(selectform)">
                <input type="reset"  value="重输">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(!(isDatetime(FormName.cxrq, "查询日期"))) {
		return false;
	}
	if(!(isDatetime(FormName.cxrq2, "查询日期"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
