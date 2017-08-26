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


	ls_sql="SELECT tc_yhlbmx.lbmc,tc_yhlbmx.lbxmbm,tc_yhlbmx.xmmc,tc_yhlbmx.ppmc,tc_yhlbmx.xh,tc_yhlbmx.jldw,tc_yhlbmx.zqdj,tc_yhlbmx.dj,tc_yhlbmx.sjzj,tc_yhlbmx.sl,DECODE(tc_yhlbmx.lx,'1','工程','2','主材'),tc_yhlbmx.bz ";
	ls_sql+=" FROM tc_yhlbmx ";
    ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
    ls_sql+=" order by tc_yhlbmx.lbmc,lbxmbm,xmmc";
//	out.println(ls_sql);
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
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">礼包名称</td>
	<td  width="6%">项目编码</td>
	<td  width="14%">项目名称</td>
	<td  width="10%">品牌</td>
	<td  width="12%">型号</td>
	<td  width="4%">计量单位</td>
	<td  width="5%">折前单价</td>
	<td  width="5%">优惠单价</td>
	<td  width="5%">升级折价</td>
	<td  width="4%">数量</td>
	<td  width="4%">类型</td>
	<td  width="24%">备注及工艺说明</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>