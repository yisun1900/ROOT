<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String dwbh=cf.executeQuery("select dwbh from cl_jgmx where rownum<2");


	ls_sql="SELECT cldlmc,cl_jgmx.clbm,cl_clbm.clmc,cl_clbm.clgg,cl_clbm.jldwmc,cl_jgmx.gdj,cl_jgmx.cjjsj,DECODE(cl_clbm.lx,'1','常用','2','非常用'),bjjbmc,cl_clbm.ppmc,cl_clbm.wxr,cl_clbm.bz,cl_clbm.paixu";
	ls_sql+=" FROM cl_clbm,cl_jgmx,bdm_bjjbbm  ";
    ls_sql+=" where cl_jgmx.clbm=cl_clbm.clbm and cl_jgmx.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and  (cl_jgmx.dwbh='"+dwbh+"')";
    ls_sql+=" order by cl_clbm.cldlmc,cl_jgmx.clbm,cl_jgmx.bjjbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">大类</td>
	<td  width="4%">物料编号</td>
	<td  width="9%">物料名称</td>
	<td  width="8%">物料规格</td>
	<td  width="4%">物料单位</td>
	<td  width="5%">工队价</td>
	<td  width="5%">成本价</td>

	<td  width="4%">是否常用</td>
	<td  width="4%">报价级别</td>
	<td  width="8%">品牌</td>
	<td  width="4%">维护人</td>
	<td  width="4%">备注</td>
	<td  width="4%">排序</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
</html>