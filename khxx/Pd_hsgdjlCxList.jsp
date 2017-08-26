<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	String ls_sql=null;

	String khbh=request.getParameter("khbh");



	ls_sql="SELECT a.sgdmc oldsgd,b.sgdmc newsgd,c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,lrsj,lrr,hsgdyy";
	ls_sql+=" FROM pd_hsgdjl,sq_sgd a,sq_sgd b,dm_gcyszxmbm c,dm_gcyszxmbm d  ";
    ls_sql+=" where pd_hsgdjl.oldsgd=a.sgd and pd_hsgdjl.newsgd=b.sgd";
    ls_sql+=" and pd_hsgdjl.ybysxmbm=c.gcyszxmbm(+) and pd_hsgdjl.zqysxmbm=d.gcyszxmbm(+)";
    ls_sql+=" and pd_hsgdjl.khbh='"+khbh+"'";
    ls_sql+=" order by pd_hsgdjl.lrsj";
//	out.println(ls_sql);
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
  <B><font size="3">换施工队记录</font></B>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">原施工队</td>
	<td  width="5%">新施工队</td>
	<td  width="7%">隐蔽工程验收</td>
	<td  width="7%">中期验收</td>
	<td  width="7%">操作时间</td>
	<td  width="5%">操作人</td>
	<td  width="30%">换施工队说明</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>