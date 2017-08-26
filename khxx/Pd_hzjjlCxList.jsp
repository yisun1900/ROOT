<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT oldzjxm,newzjxm,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,czsj,czr,hzjxmsm";
	ls_sql+=" FROM pd_hzjjl,dm_gcyszxmbm c,dm_gcyszxmbm d  ";
    ls_sql+=" where pd_hzjjl.ybysxmbm=c.gcyszxmbm(+) and pd_hzjjl.zqysxmbm=d.gcyszxmbm(+)";
    ls_sql+=" and pd_hzjjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_hzjjl.czsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">换工程担当记录</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">原工程担当</td>
	<td  width="5%">新工程担当</td>
	<td  width="7%">隐蔽工程验收</td>
	<td  width="7%">中期验收</td>
	<td  width="7%">操作时间</td>
	<td  width="5%">操作人</td>
	<td  width="15%">换工程担当说明</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>