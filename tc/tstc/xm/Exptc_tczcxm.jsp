<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String bjjbbm=null;
	String dqbm=null;

	bjjbbm=request.getParameter("bjjbbm");
	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT jxc_cldlbm.cldlmc,jxc_clxlbm.clxlmc,tcsjflmc,DECODE(tc_tczcxm.sfbxx,'Y','是','N','否') sfbxx,DECODE(tc_tczcxm.sfyxsj,'Y','是','N','否') sfyxsj,DECODE(tc_tczcxm.sfyqxtpp,'Y','是','N','否') sfyqxtpp,tc_tczcxm.jldw,DECODE(tc_tczcxm.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,tc_tczcxm.bzsl,DECODE(tc_tczcxm.sfkjm,'1','不可减免','2','可减免') sfkjm,yxjmzdsl,jmdj,DECODE(tc_tczcxm.sfkgh,'1','不可换','2','可换') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM tc_tczcxm,dm_dqbm,bdm_bjjbbm,jxc_cldlbm,jxc_clxlbm,bdm_tcsjflbm  ";
    ls_sql+=" where tc_tczcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_tczcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and tc_tczcxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_tczcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tc_tczcxm.tcsjflbm=bdm_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and tc_tczcxm.bjjbbm='"+bjjbbm+"' and tc_tczcxm.dqbm='"+dqbm+"'";
    ls_sql+=" order by tc_tczcxm.tccpdlbm,tc_tczcxm.tccplbbm";
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
	<td  width="9%">产品大类</td>
	<td  width="9%">产品小类</td>
	<td  width="9%">套餐升级分类</td>
	<td  width="6%">是否必选项</td>
	<td  width="6%">升级是否收费</td>
	<td  width="6%">是否要求相同品牌</td>
	<td  width="5%">计量单位</td>
	<td  width="8%">是否限制数量</td>
	<td  width="6%">标准数量</td>
	<td  width="6%">是否可减免</td>
	<td  width="6%">允许减免最大数量</td>
	<td  width="6%">减免单价</td>
	<td  width="6%">是否可更换</td>
	<td  width="6%">可换最大数量</td>
	<td  width="6%">更换折价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>