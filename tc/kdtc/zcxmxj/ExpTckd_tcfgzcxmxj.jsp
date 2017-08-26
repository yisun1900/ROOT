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


	ls_sql="SELECT bjjbmc,tckd_tcfgzcxmxj.fgmc,hxmc,tckd_tcfgzcxmxj.jgwzbm,clxlmc,tckd_tcfgzcxmxj.jldw,DECODE(tckd_tcfgzcxmxj.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,tckd_tcfgzcxmxj.bzsl,DECODE(tckd_tcfgzcxmxj.sfbxx,'Y','是','N','否') sfbxx,DECODE(tckd_tcfgzcxmxj.sfyxsj,'Y','是','N','否') sfyxsj,sjfl,DECODE(tckd_tcfgzcxmxj.sjjjfs,'1','按套','2','按数量') sjjjfs,DECODE(tckd_tcfgzcxmxj.sfyqxtpp,'Y','是','N','否'),DECODE(tckd_tcfgzcxmxj.sfkjm,'1','不可减免','2','可减免') sfkjm,jmfl,jmjldw,tckd_tcfgzcxmxj.yxjmzdsl,jmdj";
	ls_sql+=" FROM tckd_tcfgzcxmxj,dm_dqbm,bdm_bjjbbm,dm_hxbm,jxc_clxlbm  ";
    ls_sql+=" where tckd_tcfgzcxmxj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tcfgzcxmxj.dqbm='"+dqbm+"' ";
    ls_sql+=" order by tckd_tcfgzcxmxj.bjjbbm,tckd_tcfgzcxmxj.fgmc,tckd_tcfgzcxmxj.hxbm,tckd_tcfgzcxmxj.jgwzbm,tckd_tcfgzcxmxj.tccplbbm";
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
	<td  width="6%">风格名称</td>
	<td  width="6%">户型</td>
	<td  width="5%">结构位置</td>
	<td  width="9%">产品类别</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">是否限制数量</td>
	<td  width="4%">标准数量</td>
	<td  width="4%">是否必选项</td>
	<td  width="4%">升级是否收费</td>
	<td  width="8%">套餐升级分类</td>
	<td  width="4%">升级计价方式</td>
	<td  width="5%">是否要求相同品牌</td>

	<td  width="5%">是否可减免</td>
	<td  width="8%">减免分类</td>
	<td  width="4%">减免计量单位</td>
	<td  width="4%">允许减免最大数量</td>
	<td  width="6%">减免单价</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>