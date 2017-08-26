<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>日报表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	String dwbh=(String)session.getAttribute("dwbh");
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwstr=cf.getItemData("select dwbh,dwmc,ssdw from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') order by ssdw,dwbh");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="selectform">
  <table width="100%" border="1" cellpadding="1" cellspacing="0" style="FONT-SIZE:14">
    
    <tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  size="20" value="签单统计" onClick="f_xzts(selectform)">
        <input type="button" size="20" value="本月累计签单" onClick="f_xzhf(selectform)">
        <input type="button" size="20" value="昨日签单统计" onClick="f_new(selectform)" >
		
      </td>
    </tr>
	<tr align="center"> 
      <td height="71" colspan="2">
	   <input type="button" size="20" value="客流统计" onClick="f_new1(selectform)" >
	   <input type="button" size="20" value="本月累计客流" onClick="f_xzhf1(selectform)">
        <input type="button"  size="20" value="昨日客流统计" onClick="f_xzts1(selectform)">
       
  
      </td>
    </tr>
	<tr align="center"> 
      <td height="71" colspan="2"> 
        <input type="button"  value="人员统计" onClick="f_xzts2(selectform)">
        <input type="button"  value="入职人员统计" onClick="f_xzhf2(selectform)">
        <input type="button"  value="离职人员统计" onClick="f_new2(selectform)" >
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_xzts(FormName)//参数FormName:Form的名称
{
	
	FormName.action="Crm_qdtj.jsp";
	FormName.submit();
	return true;
}

function f_xzhf(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_qdtj1.jsp";
	FormName.submit();
	return true;
}

function f_new(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_qdtj2.jsp";
	FormName.submit();
	return true;
}
function f_new1(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_khtj.jsp";
	FormName.submit();
	return true;
}
function f_xzts1(FormName)//参数FormName:Form的名称
{
	
	FormName.action="Crm_khtj1.jsp";
	FormName.submit();
	return true;
}
function f_xzhf1(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_khtj2.jsp";
	FormName.submit();
	return true;
}
function f_new2(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_rytj1.jsp";
	FormName.submit();
	return true;
}
function f_xzts2(FormName)//参数FormName:Form的名称
{
	
	FormName.action="Crm_rytj.jsp";
	FormName.submit();
	return true;
}
function f_xzhf2(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_rytj2.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
