<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String ls_sql=null;

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center>木门复测单（预订单编号：<%=yddbh%>）</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="6%">订购类型</td>
	<td  width="7%">门类型</td>
	<td  width="5%">木门型号</td>
	<td  width="6%">油色</td>
	<td  width="4%">材质</td>
	<td  width="5%">安装位置</td>
	<td  width="5%">开启方向</td>
	<td  width="4%">单双口</td>
	<td  width="4%">地板厚</td>
	<td  width="4%">墙厚</td>
	<td  width="8%">门洞宽×高</td>
	<td  width="6%">踢脚线/平台上口</td>
	<td  width="3%">订购数量</td>
	<td  width="4%">窗套边数</td>
	<td  width="20%">备注</td>
</tr>
<%

	ls_sql="SELECT '',jc_mmdglx.mmdglxmc,mlxmc,jc_mmfcd.mmxh,dm_ysbm.ysmc,dm_czbm.czmc,jdm_azwzbm.azwzmc,jdm_kqfxbm.kqfxmc, DECODE(jc_mmfcd.dsk,'1','单口','2','双口'),TO_CHAR(jc_mmfcd.dbh),TO_CHAR(jc_mmfcd.qh),jc_mmfcd.mdk||'×'||jc_mmfcd.mdg,TO_CHAR(jc_mmfcd.tjx),jc_mmfcd.sl, DECODE(jc_mmfcd.ctbs,'3','三边','4','四边'),jc_mmfcd.bz  ";
	ls_sql+=" FROM dm_czbm,dm_ysbm,jc_mmdglx,jc_mmfcd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx  ";
    ls_sql+=" where jc_mmfcd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmfcd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmfcd.czbm=dm_czbm.czbm(+) and jc_mmfcd.ysbm=dm_ysbm.ysbm";
    ls_sql+=" and jc_mmfcd.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
    ls_sql+=" and  jc_mmfcd.mlx=jdm_mlx.mlx(+) and jc_mmfcd.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmfcd.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>

</table>
</body>
</html>
