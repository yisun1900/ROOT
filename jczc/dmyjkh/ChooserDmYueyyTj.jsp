<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>月报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
String dwbh=(String)session.getAttribute("dwbh");
String jzbm=(String)session.getAttribute("jzbm");
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");

String nian=request.getParameter("nian");
String yue=request.getParameter("yue");


%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="4" height="64"> 
        <div align="center">店面月运营统计</div>
      </td>
    </tr>
    <tr>
      <td align="right" width="30%" height="42">年</td>
      <td height="42" colspan="3" width="70%">
        <input type="text" name="nian" value="<%=nian%>" size="20" readonly>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">月</td>
      <td height="42" colspan="3" width="70%">
        <input type="text" name="yue" value="<%=yue%>" size="20" readonly>
      </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="42">分公司</td>
      <td height="42" colspan="3" width="70%"> <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		String dwstr=cf.getItemData("select dwbh,dwmc||DECODE(cxbz,'N','','Y','（撤销）'),ssdw from sq_dwxx where dwlx='F2' order by ssdw,cxbz,dwbh");
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" onChange=\"selectItem(ssfgs,dwbh,"+dwstr+");\">");
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F0' order by dwbh","");
        out.println("        </select>");
	}
	else{
        out.println("        <select name=\"ssfgs\" style=\"FONT-SIZE:12PX;WIDTH:152PX\" >");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
        out.println("        </select>");
	}
%> </td>
    </tr>
    <tr> 
      <td align="right" width="30%" height="44">签约店面</td>
      <td height="44" colspan="3" width="70%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','（撤销）') from sq_dwxx where dwlx='F2' order by ssdw,cxbz,dwbh","");
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','（撤销）') from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' order by cxbz,dwbh","");
	}
	else if (yhjs.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where (dwbh='"+dwbh+"' OR dwbh='"+jzbm+"')","");
	}
%> 
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td height="56" colspan="4"> 
        <input type="button"  value="查询" onClick="f_do(selectform,'jz')" name="jzcz">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName,lx)//参数FormName:Form的名称
{

	FormName.action="dmYueyyTjList.jsp";
	FormName.target="";
	FormName.submit();
	return true;

}


//-->
</SCRIPT>
