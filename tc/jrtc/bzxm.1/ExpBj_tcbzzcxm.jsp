<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");


	ls_sql="SELECT bjjbmc,hxmc,bj_tcbzzcxm.jgwzbm,clxlmc,bj_tcbzzcxm.jldw,DECODE(bj_tcbzzcxm.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,bj_tcbzzcxm.bzsl,DECODE(bj_tcbzzcxm.sfbxx,'Y','是','N','否') sfbxx,DECODE(bj_tcbzzcxm.sfyxsj,'Y','是','N','否') sfyxsj,tcsjflmc,DECODE(bj_tcbzzcxm.sfyqxtpp,'Y','是','N','否'),DECODE(bj_tcbzzcxm.sfkjm,'1','不可减免','2','可减免') sfkjm,jmfl,jmjldw,bj_tcbzzcxm.yxjmzdsl,jmdj,DECODE(bj_tcbzzcxm.sfkgh,'1','不可换','2','可换') sfkgh,khzdsl,ghzj ";
	ls_sql+=" FROM bj_tcbzzcxm,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcbzzcxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcbzzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_tcbzzcxm.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_tcbzzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=" and bj_tcbzzcxm.dqbm='"+dqbm+"' ";
    ls_sql+=" order by bj_tcbzzcxm.bjjbbm,bj_tcbzzcxm.hxbm,bj_tcbzzcxm.jgwzbm,bj_tcbzzcxm.tccplbbm";
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

<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">报价级别</td>
	<td  width="6%">户型</td>
	<td  width="5%">结构位置</td>
	<td  width="9%">产品类别</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">是否限制数量</td>
	<td  width="4%">标准数量</td>
	<td  width="4%">是否必选项</td>
	<td  width="4%">升级是否收费</td>
	<td  width="8%">套餐升级分类</td>
	<td  width="5%">是否要求相同品牌</td>

	<td  width="5%">是否可减免</td>
	<td  width="8%">减免分类</td>
	<td  width="4%">减免计量单位</td>
	<td  width="4%">允许减免最大数量</td>
	<td  width="6%">减免单价</td>
	<td  width="5%">是否可更换</td>
	<td  width="4%">可换最大数量</td>
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