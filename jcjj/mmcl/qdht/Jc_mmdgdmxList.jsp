<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yddbh=request.getParameter("yddbh");
	String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
	
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	ls_sql="SELECT TO_CHAR(jc_mmdgdmx.xh) xh,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,mtxmc,mxxmc,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh,jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg||'×'||jc_mmdgdmx.qh md,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边') ctbs,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,jc_mmdgdmx.sl,TO_CHAR(jc_mmdgdmx.bzdj) bzdj,TO_CHAR(jc_mmdgdmx.dj) dj,sl*bzdj zqzj,sl*dj zj,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" >','') zp,jc_mmdgdmx.bz";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb,jdm_mtxbm,jdm_mxxbm  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+)";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and jc_mmdgdmx.mlx=jdm_mlx.mlx(+) and jc_mmdgdmx.mtxbm=jdm_mtxbm.mtxbm(+) and jc_mmdgdmx.mxxbm=jdm_mxxbm.mxxbm(+)";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"' and jc_mmdgdmx.lx='1'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditJc_mmdgdmxMain.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数



//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteJc_mmdgdmx.jsp?yddbh="+yddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zp","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">木门合同明细（订单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">序号</td>
	<td  width="5%">订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="5%">材质</td>
	<td  width="5%">油色</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">门套线</td>
	<td  width="4%">门芯线</td>
	<td  width="4%">地材种类</td>
	<td  width="3%">地材厚</td>
	<td  width="5%">门洞宽×高×墙厚</td>
	<td  width="3%">踢脚线/欧式上帽</td>
	<td  width="5%">玻璃型号</td>
	<td  width="3%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="3%">是否有顶窗</td>
	<td  width="3%">订购数量</td>
	<td  width="3%">折前单价</td>
	<td  width="3%">折后单价</td>
	<td  width="3%">折前总价</td>
	<td  width="3%">折后总价</td>
	<td  width="7%">照片</td>
	<td  width="5%">备注</td>
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