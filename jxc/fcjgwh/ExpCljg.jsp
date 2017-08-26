<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";

	String dqbm=request.getParameter("dqbm");//地区编码


	ls_sql="SELECT cldlbm,clxlbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(jxc_cljgb.cbj),TO_CHAR(jxc_cljgb.dfgsjg),TO_CHAR(jxc_cljgb.dgzjg),'' ";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb,dm_dqbm  ";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
    ls_sql+=" and jxc_cljgb.dqbm=dm_dqbm.dqbm";
    ls_sql+=" and jxc_clbm.cllb='1'";//0：主材；1：辅材
    ls_sql+=" and jxc_cljgb.dqbm='"+dqbm+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by cldlbm,clxlbm,clmc,jxc_clbm.clbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">材料大类</td>
	<td  width="4%">材料小类</td>
	<td  width="3%">内部编码</td>
	<td  width="6%">材料名称</td>
	<td  width="4%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">计量单位</td>
	<td  width="3%">成本价</td>
	<td  width="3%">分公司价</td>
	<td  width="3%">工队价</td>
	<td  width="3%">新价格生效时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>
</body>
</html>