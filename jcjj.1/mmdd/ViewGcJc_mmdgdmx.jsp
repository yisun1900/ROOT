<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*,java.util.*' %>
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<center>木门合同明细（预订单编号：<%=yddbh%>）</center>
<table border="1" width="270%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">类型</td>
	<td  width="4%">订购类型</td>
	<td  width="2%">门类型</td>
	<td  width="4%">木门型号</td>
	<td  width="7%">材质</td>
	<td  width="5%">油色</td>
	<td  width="3%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="3%">门套线</td>
	<td  width="3%">门芯线</td>
	<td  width="3%">地材种类</td>
	<td  width="2%">地板厚</td>
	<td  width="5%">门洞宽×高×墙厚</td>
	<td  width="3%">踢脚线</td>
	<td  width="4%">玻璃型号</td>
	<td  width="2%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="3%">门是否有顶窗</td>
	<td  width="3%">单价</td>
	<td  width="3%">合同数量</td>
	<td  width="4%">合同金额</td>
	<td  width="3%">增减后数量</td>
	<td  width="4%">增减后总额</td>
	<td  width="13%">备注</td>
	<td  width="5%">照片</td>
	<td  width="2%">自动计价</td>
</tr>
<%

	ls_sql="SELECT DECODE(lx,'1','合同项','2','增项') lx,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh, jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg||'×'||jc_mmdgdmx.qh md,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,DECODE(jc_mmdgdmx.sfzdjj,'1','自动','2','人工') sfzdjj,TO_CHAR(jc_mmdgdmx.dj) dj,jc_mmdgdmx.sl,sl*dj zj,jc_mmdgdmx.zjhsl,zjhsl*dj zjhze,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+) ";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.mmxh";
	
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示列
	String[] disColName={"lx","mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","mtxmc","mxxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","dj","sl","zj","zjhsl","zjhze","bz","zp","sfzdjj"};
	pageObj.setDisColName(disColName);
//设置显示合并列
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zp","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
	pageObj.printFoot();

%>
</table>

<center>五金件合同明细</center>
<table border="1" width="140%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="5%">类型</td>
	<td  width="15%">五金名称</td>
	<td  width="8%">五金类别</td>
	<td  width="12%">型号</td>
	<td  width="7%">锁把手</td>
	<td  width="5%">单价</td>
	<td  width="4%">合同数量</td>
	<td  width="6%">合同金额</td>
	<td  width="4%">增减后数量</td>
	<td  width="6%">增减后总额</td>
	<td  width="25%">备注</td>
</tr>
<%

	ls_sql="SELECT '',DECODE(lx,'1','合同项','2','增项') lx,wjmc,jdm_wjjbm.wjjmc,jc_wjjddmx.xinghao ,mmsbsmc,TO_CHAR(jc_wjjddmx.dj),jc_wjjddmx.sl,jc_wjjddmx.dj*jc_wjjddmx.sl je,jc_wjjddmx.zjhsl,jc_wjjddmx.dj*jc_wjjddmx.zjhsl zjhze,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm  ";
    ls_sql+=" and jc_wjjddmx.mmsbsbm=jdm_mmsbsbm.mmsbsbm(+)";
    ls_sql+=" and jc_wjjddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" order by jc_wjjddmx.yddbh,jc_wjjddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>
</table>

<center>玻璃合同明细</center>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="7%">类型</td>
	<td  width="22%">玻璃名称</td>
	<td  width="7%">单价</td>
	<td  width="7%">合同数量</td>
	<td  width="8%">合同金额</td>
	<td  width="7%">增减后数量</td>
	<td  width="8%">增减后总额</td>
	<td  width="30%">备注</td>
</tr>
<%

	ls_sql="SELECT '',DECODE(lx,'1','合同项','2','增项') lx,blxh,TO_CHAR(jc_blddmx.dj),jc_blddmx.sl,jc_blddmx.dj*jc_blddmx.sl je,jc_blddmx.zjhsl,jc_blddmx.dj*jc_blddmx.zjhsl zjhze,jc_blddmx.bz  ";
	ls_sql+=" FROM jc_blddmx  ";
    ls_sql+=" where jc_blddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" order by jc_blddmx.yddbh,jc_blddmx.lrxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	spanColHash.put("lx","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum(true);
	pageObj.printFoot();

%>
</table>

</body>
</html>
