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
	
	ls_sql="SELECT distinct jc_mmbjb.mmxh as mmxh,jc_mmbjb.ysbm as ysbm,jdm_mmczbm.mmczmc,jc_mmbjb.qhjgqjbm,jdm_qhjgqj.qhjgqj,jc_mmbjb.ztmdj as ztmdj,dmsjg,dmtjg,mtjg,dkmtjg,zdmjjl,yksmjjl,zmmjg,ysbljjl,tlmpmdj,jc_mmbjb.bz  ";
	ls_sql+=" FROM jdm_mmczbm,jc_mmbjb,jdm_qhjgqj,jc_mmxhb";
    ls_sql+=" where jc_mmbjb.qhjgqjbm=jdm_qhjgqj.qhjgqjbm(+) and jc_mmbjb.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmbjb.mmxh=jc_mmxhb.mmxh(+)";
    ls_sql+=" and jc_mmbjb.dqbm='"+dqbm+"'";
    ls_sql+=" order by jc_mmbjb.mmxh,jc_mmbjb.ysbm,jc_mmbjb.qhjgqjbm";
    pageObj.sql=ls_sql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
//设置显示列
	String[] disColName={"mmxh","mmczmc","qhjgqj","ztmdj","dmsjg","dmtjg","mtjg","dkmtjg","zmmjg","zdmjjl","yksmjjl","ysbljjl","tlmpmdj","bz"};
	pageObj.setDisColName(disColName);

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">木门型号</td>
	<td  width="14%">材质</td>
	<td  width="9%">墙厚价格区间</td>
	<td  width="7%">整樘门单价</td>
	<td  width="6%">单门扇价格</td>
	<td  width="6%">单门套价格</td>
	<td  width="7%">双口门套每米单价</td>
	<td  width="7%">单口门套每米单价</td>
	<td  width="5%">子母门加价率</td>
	<td  width="5%">折叠门加价率</td>
	<td  width="5%">哑口松木集成材加价率</td>
	<td  width="5%">艺术玻璃加价率</td>
	<td  width="6%">推拉门每平米单价</td>
	<td  width="12%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 

</body>
</html>
