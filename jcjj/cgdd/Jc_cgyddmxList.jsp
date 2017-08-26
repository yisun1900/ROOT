<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ddbh=request.getParameter("ddbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT TO_CHAR(jc_cgyddmx.xh) xh,cgmc,jc_tmbj.tmmc,jdm_mbbm.mbmc,jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgyddmx.bz  ";
	ls_sql+=" FROM jc_cgyddmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgyddmx.cgbm=jc_cgjgb.cgbm and jc_cgyddmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgyddmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgyddmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgyddmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgyddmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgyddmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgyddmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgyddmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgyddmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgyddmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgyddmxList.jsp?ddbh="+ddbh,"","","EditJc_cgyddmxMain.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","jc_cgyddmx_cgbm","jc_cgyddmx_dgcd","jc_cgyddmx_dggd","jc_cgyddmx_dgjs","jc_cgyddmx_dgdj","jc_cgyddmx_tdcd","jc_cgyddmx_tggd","jc_cgyddmx_tgjs","jc_tmbj_tmmc","jc_cgyddmx_tmcd","jc_cgyddmx_tmdj","jc_cgyddmx_mbmj","jc_cgyddmx_mbdj","jdm_mbbm_mbmc","jdm_mbfbbm_mbfbmc","jdm_xtbm_xtmc","jdm_lsbm_lsmc","jdm_ctbm_ctmc","jdm_jlbm_jlmc","jc_cgyddmx_bzzj","jc_cgyddmx_fbxs","jc_cgyddmx_sjzj","jc_cgyddmx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_cgyddmxList.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from jc_cgyddmx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">橱柜预订单明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="4%">序号</td>
	<td  width="12%">橱柜</td>
	<td  width="10%">台面</td>
	<td  width="10%">门板</td>
	<td  width="8%">门板封边</td>
	<td  width="12%">箱体</td>
	<td  width="14%">拉手</td>
	<td  width="12%">抽屉</td>
	<td  width="8%">铰链</td>
	<td  width="4%">备注</td>
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