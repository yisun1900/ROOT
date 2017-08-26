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
<center>木门预订明细（预订单编号：<%=yddbh%>）</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">订购类型</td>
	<td  width="5%">门类型</td>
	<td  width="4%">木门型号</td>
	<td  width="11%">油色</td>
	<td  width="4%">材质</td>
	<td  width="5%">安装位置</td>
	<td  width="5%">开启方向</td>
	<td  width="10%">玻璃型号</td>
	<td  width="5%">窗套边数</td>
	<td  width="4%">地材</td>
	<td  width="7%">门套/哑口材质</td>
	<td  width="5%">是否有顶窗</td>
	<td  width="4%">订购数量</td>
	<td  width="7%">照片</td>
	<td  width="17%">备注</td>
</tr>
<%

	ls_sql="SELECT mmdglxmc,mlxmc,jc_mmydmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,jc_blbj.blxh, DECODE(jc_mmydmx.ctbs,'3','三边','4','四边') ctbs,dczlmc,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,jc_mmydmx.sl,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmydmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmydmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jc_mmxhb,jdm_dczlbm  ";
    ls_sql+=" where jc_mmydmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmydmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmydmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmydmx.czbm=dm_czbm.czbm(+) and jc_mmydmx.ysbm=jdm_mmczbm.mmczbm(+)";
	ls_sql+=" and jc_mmydmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmydmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmydmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmydmx.blxhbm=jc_blbj.blxhbm(+)";
    ls_sql+=" and  jc_mmydmx.mlx=jdm_mlx.mlx(+) and jc_mmydmx.yddbh='"+yddbh+"'";
    ls_sql+=" order by jc_mmydmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();

%>
</table>


</body>
</html>
