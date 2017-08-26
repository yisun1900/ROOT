<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
ybl.common.PageObject  pageObj=new ybl.common.PageObject();

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
String ls_sql=null;

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<center>木门初测明细（预订单编号：<%=yddbh%>）</center>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">订购类型</td>
	<td  width="3%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="7%">材质</td>
	<td  width="3%">油色</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">门套线</td>
	<td  width="4%">门芯线</td>
	<td  width="4%">地材种类</td>
	<td  width="3%">地板厚</td>
	<td  width="6%">门洞宽×高×墙厚</td>
	<td  width="5%">门扇宽×高</td>
	<td  width="3%">踢脚线</td>
	<td  width="4%">玻璃型号</td>
	<td  width="3%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="3%">门是否有顶窗</td>
	<td  width="3%">单价</td>
	<td  width="3%">数量</td>
	<td  width="4%">金额</td>
	<td  width="12%">备注</td>
	<td  width="5%">照片</td>
</tr>
<%
	ls_sql="SELECT mmdglxmc,mlxmc,jc_mmccd.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,TO_CHAR(jc_mmccd.tjx) tjx,blxh, DECODE(jc_mmccd.ctbs,'3','三边','4','四边') ctbs,dczlmc,TO_CHAR(jc_mmccd.dbh) dbh, jc_mmccd.mdk||'×'||jc_mmccd.mdg||'×'||jc_mmccd.qh md,msk||'×'||msg ms,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,TO_CHAR(jc_mmccd.dj) dj,jc_mmccd.sl,sl*dj zj,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>','') zp,jc_mmccd.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmccd,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmccd.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmccd.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmccd.czbm=dm_czbm.czbm(+) and jc_mmccd.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmccd.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmccd.mmxh=jc_mmxhb.mmxh(+) and jc_mmccd.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmccd.mlx=jdm_mlx.mlx(+) and jc_mmccd.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmccd.mxxbm=jdm_mxxbm.mxxbm(+) ";
    ls_sql+=" and jc_mmccd.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmccd.xh";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示列
	String[] disColName={"mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","mtxmc","mxxmc","dczlmc","dbh","md","ms","tjx","blxh","ctbs","sfsmjcc","sfydc","dj","sl","zj","bz","zp"};
	pageObj.setDisColName(disColName);

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();
%>

</table>
</body>
</html>
