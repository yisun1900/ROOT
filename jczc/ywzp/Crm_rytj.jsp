<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">员工统计表</font></B>
</CENTER>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="10%">所属单位</td>
	<td  width="10%">数量</td>
	<td  width="30%">数量</td>
</tr>
<%

ls_sql="select dwmc,count(distinct sq_yhxx.ygbh),'<img src=\"/images/ColuGif.gif\" width=\"'||count(distinct sq_yhxx.ygbh)||'\" height=\"14\">' FROM dm_xlbm,dm_zwbm,rs_sjsjb,sq_dwxx,sq_yhxx   where sq_yhxx.sjsjb=rs_sjsjb.sjsjb(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+) and sq_yhxx.xlbm=dm_xlbm.xlbm(+) and sq_yhxx.dwbh=sq_dwxx.dwbh(+) group by dwmc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);



//设置显示合并列
	pageObj.alignStr[2]="align='left'";

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>