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

	ls_sql="SELECT TO_CHAR(jc_cgfcdmx.xh) xh,cgmc,dgjs||'*'||dggd,TO_CHAR(dgcd),TO_CHAR(dgdj),TO_CHAR(dgfbxs),tgjs||'*'||tggd,TO_CHAR(tdcd),TO_CHAR(tgdj),TO_CHAR(tgfbxs),jc_tmbj.tmmc,TO_CHAR(tmcd),TO_CHAR(tmdj),TO_CHAR(tmfbxs),jdm_mbbm.mbmc,TO_CHAR(mbmj),TO_CHAR(mbdj),jdm_mbfbbm.mbfbmc,jdm_xtbm.xtmc,jdm_lsbm.lsmc,jdm_ctbm.ctmc,jdm_jlbm.jlmc,jc_cgfcdmx.sjzj,jc_cgfcdmx.bz  ";
	ls_sql+=" FROM jc_cgfcdmx,jc_tmbj,jdm_ctbm,jdm_jlbm,jdm_lsbm,jdm_mbbm,jdm_mbfbbm,jdm_tjbbm,jdm_xtbm,jc_cgjgb  ";
    ls_sql+=" where jc_cgfcdmx.cgbm=jc_cgjgb.cgbm and jc_cgfcdmx.jlbm=jdm_jlbm.jlbm(+) and jc_cgfcdmx.ctbm=jdm_ctbm.ctbm(+)";
    ls_sql+=" and jc_cgfcdmx.tjbbm=jdm_tjbbm.tjbbm(+) and jc_cgfcdmx.lsbm=jdm_lsbm.lsbm(+) and jc_cgfcdmx.xtbm=jdm_xtbm.xtbm(+)";
    ls_sql+=" and jc_cgfcdmx.mbfbbm=jdm_mbfbbm.mbfbbm(+) and jc_cgfcdmx.mbbm=jdm_mbbm.mbbm(+) and jc_cgfcdmx.tmbm=jc_tmbj.tmbm(+)";
    ls_sql+=" and jc_cgfcdmx.ddbh='"+ddbh+"'";
    ls_sql+=" order by jc_cgfcdmx.xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgfcdmxList.jsp?ddbh="+ddbh,"","","EditJc_cgfcdmxMain.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","jc_cgfcdmx_cgbm","jc_cgfcdmx_dgcd","jc_cgfcdmx_dggd","jc_cgfcdmx_dgjs","jc_cgfcdmx_dgdj","jc_cgfcdmx_tdcd","jc_cgfcdmx_tggd","jc_cgfcdmx_tgjs","jc_tmbj_tmmc","jc_cgfcdmx_tmcd","jc_cgfcdmx_tmdj","jc_cgfcdmx_mbmj","jc_cgfcdmx_mbdj","jdm_mbbm_mbmc","jdm_mbfbbm_mbfbmc","jdm_xtbm_xtmc","jdm_lsbm_lsmc","jdm_ctbm_ctmc","jdm_jlbm_jlmc","jc_cgfcdmx_bzzj","jc_cgfcdmx_fbxs","jc_cgfcdmx_sjzj","jc_cgfcdmx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_cgfcdmxList.jsp?ddbh="+ddbh};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from jc_cgfcdmx where "+chooseitem;
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
  <B><font size="3">橱柜复测单明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="2%">序号</td>
	<td  width="6%">橱柜</td>
	<td  width="4%">吊柜<BR>进深*高</td>
	<td  width="3%">吊柜长</td>
	<td  width="3%">吊柜单价</td>
	<td  width="3%">吊柜非标系数</td>
	<td  width="4%">地柜<BR>进深*高</td>
	<td  width="3%">地柜长度</td>
	<td  width="3%">地柜单价</td>
	<td  width="3%">地柜非标系数</td>
	<td  width="3%">台面</td>
	<td  width="3%">台面长度</td>
	<td  width="3%">台面单价</td>
	<td  width="3%">台面非标系数</td>
	<td  width="6%">门板</td>
	<td  width="3%">门板面积</td>
	<td  width="3%">门板单价</td>
	<td  width="5%">门板封边</td>
	<td  width="6%">箱体</td>
	<td  width="8%">拉手</td>
	<td  width="7%">抽屉</td>
	<td  width="4%">铰链</td>
	<td  width="4%">实际总价</td>
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