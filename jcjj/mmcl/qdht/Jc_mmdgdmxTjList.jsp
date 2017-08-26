<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yddbh=request.getParameter("yddbh");
String dqbm=cf.executeQuery("select dqbm from jc_mmydd,sq_dwxx where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;

	ls_sql="SELECT jc_mmdgdmx.xh xh,mmdglxmc,mlxmc,jc_mmdgdmx.mmxh,mmczmc,czmc,azwzmc,kqfxmc,TO_CHAR(jc_mmdgdmx.tjx) tjx,blxh, DECODE(jc_mmdgdmx.ctbs,'3','三边','4','四边') ctbs,dczlmc,TO_CHAR(jc_mmdgdmx.dbh) dbh,jc_mmdgdmx.mdk||'×'||jc_mmdgdmx.mdg||'×'||jc_mmdgdmx.qh md,DECODE(sfsmjcc,'Y','松木集成材','N','非松木集成材') sfsmjcc,DECODE(sfydc,'Y','有顶窗','N','无顶窗') sfydc,jc_mmdgdmx.sl,DECODE(jc_mmdgdmx.sfzdjj,'1','自动','2','人工') sfzdjj,TO_CHAR(jc_mmdgdmx.bzdj) bzdj,TO_CHAR(jc_mmdgdmx.dj) dj,sl*dj zj,NVL2(jc_mmxhb.zp,'<IMG SRC=\"/jcjj/mmxh/images/'||UPPER(jc_mmxhb.zp)||'\" >','') zp,jc_mmdgdmx.bz  ";
	ls_sql+=" FROM dm_czbm,jdm_mmczbm,jc_mmdglx,jc_mmdgdmx,jdm_azwzbm,jdm_kqfxbm,jdm_mlx,jdm_dczlbm,jc_mmxhb  ";
    ls_sql+=" where jc_mmdgdmx.kqfxbm=jdm_kqfxbm.kqfxbm(+)";
    ls_sql+=" and jc_mmdgdmx.azwzbm=jdm_azwzbm.azwzbm(+) and jc_mmdgdmx.czbm=dm_czbm.czbm(+) and jc_mmdgdmx.ysbm=jdm_mmczbm.mmczbm(+)";
    ls_sql+=" and jc_mmdgdmx.mmdglxbm=jc_mmdglx.mmdglxbm(+) ";
	ls_sql+=" and jc_mmdgdmx.mmxh=jc_mmxhb.mmxh(+) and jc_mmdgdmx.dczlbm=jdm_dczlbm.dczlbm(+)";
    ls_sql+=" and  jc_mmdgdmx.mlx=jdm_mlx.mlx(+) ";
    ls_sql+=" and jc_mmdgdmx.yddbh='"+yddbh+"' and jc_mmdgdmx.lx='1'";
    ls_sql+=" and jc_mmxhb.dqbm(+)='"+dqbm+"'";
    ls_sql+=" order by jc_mmdgdmx.mmxh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmdgdmxTjList.jsp?yddbh="+yddbh,"","","TjJc_mmdgdmx.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示列
	String[] disColName={"mmdglxmc","mlxmc","mmxh","mmczmc","czmc","azwzmc","kqfxmc","dczlmc","dbh","md","tjx","blxh","ctbs","sfsmjcc","sfydc","sl","bzdj","dj","zj","zp","bz","sfzdjj"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zp","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">木门合同明细---调整合同价格（单号：<%=yddbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(175);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">订购类型</td>
	<td  width="4%">门类型</td>
	<td  width="3%">木门型号</td>
	<td  width="8%">油色</td>
	<td  width="3%">材质</td>
	<td  width="4%">安装位置</td>
	<td  width="4%">开启方向</td>
	<td  width="4%">地材种类</td>
	<td  width="3%">地材厚</td>
	<td  width="7%">门洞宽×高×墙厚</td>
	<td  width="4%">踢脚线</td>
	<td  width="6%">玻璃型号</td>
	<td  width="4%">窗套边数</td>
	<td  width="4%">门套/哑口材质</td>
	<td  width="4%">是否有顶窗</td>
	<td  width="3%">订购数量</td>
	<td  width="3%">标准单价</td>
	<td  width="3%">客户单价</td>
	<td  width="4%">总价</td>
	<td  width="8%">照片</td>
	<td  width="10%">备注</td>
	<td  width="3%">自动计价</td>
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