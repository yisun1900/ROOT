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
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">类型</td>
	<td  width="4%">订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="5%">材质</td>
	<td  width="3%">油色</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="3%">门套线</td>
	<td  width="3%">门芯线</td>
	<td  width="4%">地材种类</td>
	<td  width="3%">地板厚</td>
	<td  width="5%">门洞宽×高×墙厚</td>
	<td  width="3%">踢脚线</td>
	<td  width="4%">玻璃型号</td>
	<td  width="3%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="3%">门是否有顶窗</td>
	<td  width="3%">合同数量</td>
	<td  width="3%">增减后数量</td>
	<td  width="6%">备注</td>
	<td  width="5%">照片</td>
</tr>
<%

	ls_sql="SELECT DECODE(lx,'1','合同项','2','增项') lx,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,jc_blbj.blxh, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh, jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg||'×'||jc_mmdgdmx.qh md,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,DECODE(jc_mmdgdmx.sfzdjj,'1','自动','2','人工') sfzdjj,jc_mmdgdmx.sl,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=200>','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+) ";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"'";
    ls_sql+=" and jc_blbj.dqbm(+)='"+dqbm+"' and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.mmxh";
	
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示列
	String[] disColName={"lx","mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","mtxmc","mxxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","zjhsl","bz","zp"};
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
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">序号</td>
	<td  width="5%">类型</td>
	<td  width="18%">五金名称</td>
	<td  width="8%">五金类别</td>
	<td  width="10%">型号</td>
	<td  width="8%">锁把手</td>
	<td  width="5%">合同数量</td>
	<td  width="5%">增减后数量</td>
	<td  width="8%">备注</td>
</tr>
<%

	ls_sql="SELECT '',DECODE(lx,'1','合同项','2','增项') lx,wjmc,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_wjjddmx.xinghao ,mmsbsmc,jc_wjjddmx.sl as jc_wjjddmx_sl,jc_wjjddmx.zjhsl,jc_wjjddmx.bz as jc_wjjddmx_bz  ";
	ls_sql+=" FROM jc_wjjddmx,jdm_wjjbm,jdm_mmsbsbm  ";
    ls_sql+=" where jc_wjjddmx.wjjbm=jdm_wjjbm.wjjbm ";
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
	<td  width="5%">序号</td>
	<td  width="5%">类型</td>
	<td  width="20%">玻璃名称</td>
	<td  width="8%">合同数量</td>
	<td  width="8%">增减后数量</td>
	<td  width="30%">备注</td>
</tr>
<%

	ls_sql="SELECT '',DECODE(lx,'1','合同项','2','增项') lx,jc_blbj.blxh as jc_blbj_blxh,jc_blddmx.sl as jc_blddmx_sl,jc_blddmx.zjhsl,jc_blddmx.bz as jc_blddmx_bz  ";
	ls_sql+=" FROM jc_blbj,jc_blddmx  ";
    ls_sql+=" where jc_blddmx.blxhbm=jc_blbj.blxhbm";
    ls_sql+=" and jc_blddmx.yddbh='"+yddbh+"' ";
    ls_sql+=" and jc_blbj.dqbm='"+dqbm+"'";
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
