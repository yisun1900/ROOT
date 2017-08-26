<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");


	ls_sql="SELECT '',cl_jgmx.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc,'' xjgsxsj,cl_jgmx.cj,cl_jgmx.cjjsj ,cl_jgmx.fgsdj,cl_jgmx.gdj, DECODE(cl_jgmx.sfrk,'Y','是','N','否') as cl_jgmx_sfrk,cl_jgmx.ckmc,DECODE(sfycx,'N','无','Y','有促销') sfycx,cxkssj,cxjzsj,cxcj,cxcjjsj,cxfgsdj,cxgdj";
	ls_sql+=" FROM cl_clbm,cl_jgmx  ";
    ls_sql+=" where cl_jgmx.clbm=cl_clbm.clbm";
    ls_sql+=" and  (cl_jgmx.dwbh='"+dwbh+"')";
    ls_sql+=" order by cl_clbm.cldlmc,cl_jgmx.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="4%">材料编码</td>
	<td  width="9%">材料名称</td>
	<td  width="8%">材料规格</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">新价格生效时间</td>
	<td  width="5%">厂价</td>
	<td  width="5%">与厂家结算价</td>
	<td  width="5%">分公司材料单价</td>
	<td  width="5%">工队价</td>
	<td  width="4%">是否入库</td>
	<td  width="8%">仓库名称</td>
	<td  width="5%">是否有促销</td>
	<td  width="5%">促销开始时间</td>
	<td  width="5%">促销结束时间</td>
	<td  width="5%">促销期厂价</td>
	<td  width="5%">促销期与厂家结算价</td>
	<td  width="5%">促销期分公司材料单价</td>
	<td  width="5%">促销期工队价</td>


</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printFoot();
%> 

</body>
</html>