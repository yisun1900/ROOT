<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);


	String ls_sql=null;
	String wheresql="";
	String dqbm=request.getParameter("dqbm");

	ls_sql="SELECT jc_cpjjbj.cpjjbh,jc_cpjjbj.cpjjfg,jc_cpjjbj.cpjjmc,jc_cpjjbj.xh,jc_cpjjbj.gg,jc_cpjjbj.cpjjxl,jc_cpjjbj.cpjjcz,jc_cpjjbj.dj,jc_cpjjbj.bz,jc_cpjjbj.cpsm,jc_cpjjbj.cktp,jc_cpjjbj.cptp";
	ls_sql+=" FROM jc_cpjjbj,dm_dqbm  ";
    ls_sql+=" where jc_cpjjbj.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and jc_cpjjbj.dqbm='"+dqbm+"'";
//    ls_sql+=" order by jc_cpjjbj.cpjjfg,jc_cpjjbj.xh,jc_cpjjbj.gg,jc_cpjjbj.cpjjcz,jc_cpjjbj.cpjjbh";
    ls_sql+=" order by jc_cpjjbj.cpjjbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
/*
//设置显示列
	String[] disColName={"cpjjbh","jc_cpjjbj_cpjjfg","jc_cpjjbj_cpjjmc","jc_cpjjbj_xh","jc_cpjjbj_gg","jc_cpjjbj_cpjjxl","jc_cpjjbj_cpjjcz","jc_cpjjbj_ys","jc_cpjjbj_dj","jc_cpjjbj_cktp","jc_cpjjbj_cptp","jc_cpjjbj_cpsm","dm_dqbm_dwmc","jc_cpjjbj_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpjjbh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[8]="align='left'";
	pageObj.alignStr[9]="align='left'";

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="180%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">成品家具编号</td>
	<td  width="6%">风格</td>
	<td  width="5%">名称</td>
	<td  width="5%">型号</td>
	<td  width="8%">规格</td>
	<td  width="7%">系列名称</td>
	<td  width="8%">材质</td>
	<td  width="4%">单价</td>
	<td  width="10%">备注</td>
	<td  width="31%">产品说明</td>
	<td  width="6%">参考图片</td>
	<td  width="6%">产品图片</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

</body>
</html>