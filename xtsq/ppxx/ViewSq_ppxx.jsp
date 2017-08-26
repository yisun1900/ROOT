<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ppbm=request.getParameter("ppbm");
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">品牌供应商编号</td>
	<td  width="16%">品牌供应商名称</td>
	<td  width="5%">每日安装户数限制</td>
	<td  width="5%">供应商类别</td>
	<td  width="9%">主材小类</td>
	<td  width="5%">品牌编码</td>
	<td  width="11%">品牌名称</td>
	<td  width="5%">供应商编码</td>
	<td  width="16%">供应商名称</td>
	<td  width="6%">所属地区</td>
	<td  width="17%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	ls_sql="SELECT sq_gysxx.gysbh,sq_gysxx.gysmc,mrazhs,DECODE(sq_gysxx.gyslb,'1','木门','2','橱柜','3','家具','4','主材') gyslb,zclb,sq_gysxx.ppbm,sq_gysxx.ppmc,sq_gysxx.gysbm,sq_gysxx.gys,dm_dqbm.dqmc, sq_gysxx.bz  ";
	ls_sql+=" FROM dm_dqbm,sq_gysxx  ";
    ls_sql+=" where sq_gysxx.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and sq_gysxx.ppbm='"+ppbm+"'";
	ls_sql+=" order by sq_gysxx.dqbm,sq_gysxx.gyslb,sq_gysxx.zclb";
//	out.println(ls_sql);

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(200);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();


%>
</table>

</body>
</html>
