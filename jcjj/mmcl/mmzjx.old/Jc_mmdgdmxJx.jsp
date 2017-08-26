<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yddbh=request.getParameter("yddbh");
	String zjxxh=request.getParameter("zjxxh");

	String ls_sql=null;

	ls_sql="SELECT DECODE(lx,'1','合同项','2','增项') lx,DECODE(jxbz,'N','否','Y','是') jxbz,jc_mmdgdmx.xh xh,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,jc_blbj.blxh, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh,jc_mmdgdmx.qh||'×'||jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg md,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,jc_mmdgdmx.sl,TO_CHAR(jc_mmdgdmx.dj) dj,sl*dj zj,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" height=100>' zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_blbj,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb  ";
    ls_sql+=" where jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+) and jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) and jc_mmdgdmx.blxhbm=jc_blbj.blxhbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) ";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"' and jxbz='N'";
    ls_sql+=" order by jc_mmdgdmx.lx,jc_mmdgdmx.jxbz,jc_mmdgdmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示列
	String[] disColName={"lx","jxbz","mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","dj","zj","zp","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"减项"};//按钮的显示名称
	String[] buttonLink={"SaveJc_mmdgdmxJx.jsp?yddbh="+yddbh+"&zjxxh="+zjxxh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">木门减项（预订单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<form method="POST" name="listform">
<table border="1" width="115%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">类型</td>
	<td  width="3%">减项</td>
	<td  width="6%">订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="6%">油色</td>
	<td  width="3%">材质</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">地材种类</td>
	<td  width="3%">地板厚</td>
	<td  width="8%">墙厚×门洞宽×高</td>
	<td  width="4%">踢脚线/平台上口</td>
	<td  width="7%">玻璃型号</td>
	<td  width="4%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="4%">是否有顶窗</td>
	<td  width="3%">订购数量</td>
	<td  width="3%">单价</td>
	<td  width="4%">总价</td>
	<td  width="6%">照片</td>
	<td  width="15%">备注</td>
</tr>

<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>