<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String khbh=request.getParameter("khbh");
	String hfsj=request.getParameter("hfsj");
	String hfsj2=request.getParameter("hfsj2");
	
	ls_sql="SELECT khxm,hflxmc,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[设]：'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'<BR>[质]：'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'<BR>[队]：'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'<BR>[集成]：'||jchfnr) as hfnr,hfsj,DECODE(clfs,'0','不需处理','1','反馈相关部门'),hfr,a.dwmc hfbm,crm_hfjl.hfjlh";
	ls_sql+=" FROM crm_hfjl,dm_hflxbm,crm_khxx,sq_dwxx a,dm_jglxbm  ";
    ls_sql+=" where crm_hfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_hfjl.hfbm=a.dwbh";
	ls_sql+=" and crm_hfjl.hflxbm=dm_hflxbm.hflxbm(+) and crm_hfjl.jglxbm=dm_jglxbm.jglxbm(+)";
	ls_sql+=" and crm_hfjl.hfsj>=TO_DATE('"+hfsj+"','YYYY-MM-DD') and crm_hfjl.hfsj<=TO_DATE('"+hfsj2+"','YYYY-MM-DD')";
	ls_sql+=" and crm_hfjl.khbh='"+khbh+"'";
	ls_sql+=" order by crm_hfjl.hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
   pageObj.setPageRow(500);//设置每页显示记录数


//设置主键
	pageObj.alignStr[3]="align='left'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">已签单－回访统计</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="110%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">客户姓名</td>
	<td  width="10%">回访类型</td>
	<td  width="9%">回访结果</td>
	<td  width="32%">回访内容</td>
	<td  width="8%">回访时间</td>
	<td  width="10%">处理方式</td>
	<td  width="7%">回访人</td>
	<td  width="10%">回访部门</td>
	<td  width="7%">回访记录号</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>
