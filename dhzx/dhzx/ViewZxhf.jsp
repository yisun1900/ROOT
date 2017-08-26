<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ls_sql=null;

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">咨询回访信息 </div>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td width="6%">回访次数</td>
	<td width="9%">回访时间</td>
	<td width="13%">回访部门</td>
	<td width="6%">回访人</td>
	<td width="56%">客户回访情况</td>
	<td width="10%">是否提醒责任人</td>
</tr>
<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_zxhfjl.hfcs,crm_zxhfjl.hfsj,sq_dwxx.dwmc hfbm ,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,DECODE(crm_zxhfjl.clfs,'0','不提醒','1','提醒店面','2','提醒设计师')";
	ls_sql+=" FROM crm_zxhfjl,sq_dwxx";
    ls_sql+=" where crm_zxhfjl.khbh='"+khbh+"' and crm_zxhfjl.hfbm=sq_dwxx.dwbh(+)";
	ls_sql+=" order by crm_zxhfjl.hfjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[4]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>


</body>
</html>
