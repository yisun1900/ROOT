<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT crm_zxkhxx.khxm,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','领取','2','退回'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,yx_lqlpdj.bz";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,yx_lqlpdj  ";
    ls_sql+=" where yx_lqlpdj.khbh=crm_zxkhxx.khbh and yx_lqlpdj.lrbm=a.dwbh ";
    ls_sql+=" and yx_lqlpdj.khbh='"+khbh+"'";;
    ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";
	
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
  <B><font size="3">领取礼品--查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">客户姓名</td>
	<td  width="22%">礼品名称</td>
	<td  width="8%">礼品数量</td>
	<td  width="10%">领取时间</td>
	<td  width="8%">是否退回</td>
	<td  width="10%">退回登记人</td>
	<td  width="10%">退回登记时间</td>
	<td  width="22%">备注</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>