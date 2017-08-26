<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String yy_sj_zqs=null;
	String yy_sj_yy_sj_fgs=null;
	String yy_sj_yy_sjzky_mbkh=null;
	String yy_sj_yy_sjzky_sqdj=null;
	String yy_sj_yy_sjsjb_sjf=null;
	String yy_sj_yy_sjsjb_tqsjf=null;
	String yy_sj_yy_sjsjb_gccz=null;
	String yy_sj_yy_sjsjb_tqgccz=null;
	String yy_sj_yy_sjjjb_byjh=null;
	String yy_sj_yy_sjjjb_qntq=null;
	String yy_sj_yy_sjscb_mbkh=null;
	String yy_sj_yy_sjwxb_mbkh=null;
	String yy_sj_yy_sjqtqd_mbkh=null;
	String yy_sj_yy_sjscb_sqdj=null;
	String yy_sj_yy_sjwxb_sqdj=null;
	String yy_sj_yy_sjqtqd_sqdj=null;
	String yy_sj_yy_sj_lrsj=null;
	String yy_sj_lrr=null;
	yy_sj_zqs=request.getParameter("yy_sj_zqs");
	if (yy_sj_zqs!=null)
	{
		yy_sj_zqs=yy_sj_zqs.trim();
		if (!(yy_sj_zqs.equals("")))	wheresql+=" and (yy_sj.zqs="+yy_sj_zqs+") ";
	}
	yy_sj_yy_sj_fgs=request.getParameter("yy_sj_yy_sj_fgs");
	if (yy_sj_yy_sj_fgs!=null)
	{
		yy_sj_yy_sj_fgs=cf.GB2Uni(yy_sj_yy_sj_fgs);
		if (!(yy_sj_yy_sj_fgs.equals("")))	wheresql+=" and  (yy_sj.yy_sj_fgs='"+yy_sj_yy_sj_fgs+"')";
	}
	yy_sj_yy_sjzky_mbkh=request.getParameter("yy_sj_yy_sjzky_mbkh");
	if (yy_sj_yy_sjzky_mbkh!=null)
	{
		yy_sj_yy_sjzky_mbkh=yy_sj_yy_sjzky_mbkh.trim();
		if (!(yy_sj_yy_sjzky_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjzky_mbkh="+yy_sj_yy_sjzky_mbkh+") ";
	}
	yy_sj_yy_sjzky_sqdj=request.getParameter("yy_sj_yy_sjzky_sqdj");
	if (yy_sj_yy_sjzky_sqdj!=null)
	{
		yy_sj_yy_sjzky_sqdj=yy_sj_yy_sjzky_sqdj.trim();
		if (!(yy_sj_yy_sjzky_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjzky_sqdj="+yy_sj_yy_sjzky_sqdj+") ";
	}
	yy_sj_yy_sjsjb_sjf=request.getParameter("yy_sj_yy_sjsjb_sjf");
	if (yy_sj_yy_sjsjb_sjf!=null)
	{
		yy_sj_yy_sjsjb_sjf=yy_sj_yy_sjsjb_sjf.trim();
		if (!(yy_sj_yy_sjsjb_sjf.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_sjf="+yy_sj_yy_sjsjb_sjf+") ";
	}
	yy_sj_yy_sjsjb_tqsjf=request.getParameter("yy_sj_yy_sjsjb_tqsjf");
	if (yy_sj_yy_sjsjb_tqsjf!=null)
	{
		yy_sj_yy_sjsjb_tqsjf=yy_sj_yy_sjsjb_tqsjf.trim();
		if (!(yy_sj_yy_sjsjb_tqsjf.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_tqsjf="+yy_sj_yy_sjsjb_tqsjf+") ";
	}
	yy_sj_yy_sjsjb_gccz=request.getParameter("yy_sj_yy_sjsjb_gccz");
	if (yy_sj_yy_sjsjb_gccz!=null)
	{
		yy_sj_yy_sjsjb_gccz=yy_sj_yy_sjsjb_gccz.trim();
		if (!(yy_sj_yy_sjsjb_gccz.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_gccz="+yy_sj_yy_sjsjb_gccz+") ";
	}
	yy_sj_yy_sjsjb_tqgccz=request.getParameter("yy_sj_yy_sjsjb_tqgccz");
	if (yy_sj_yy_sjsjb_tqgccz!=null)
	{
		yy_sj_yy_sjsjb_tqgccz=yy_sj_yy_sjsjb_tqgccz.trim();
		if (!(yy_sj_yy_sjsjb_tqgccz.equals("")))	wheresql+=" and  (yy_sj.yy_sjsjb_tqgccz="+yy_sj_yy_sjsjb_tqgccz+") ";
	}
	yy_sj_yy_sjjjb_byjh=request.getParameter("yy_sj_yy_sjjjb_byjh");
	if (yy_sj_yy_sjjjb_byjh!=null)
	{
		yy_sj_yy_sjjjb_byjh=yy_sj_yy_sjjjb_byjh.trim();
		if (!(yy_sj_yy_sjjjb_byjh.equals("")))	wheresql+=" and  (yy_sj.yy_sjjjb_byjh="+yy_sj_yy_sjjjb_byjh+") ";
	}
	yy_sj_yy_sjjjb_qntq=request.getParameter("yy_sj_yy_sjjjb_qntq");
	if (yy_sj_yy_sjjjb_qntq!=null)
	{
		yy_sj_yy_sjjjb_qntq=yy_sj_yy_sjjjb_qntq.trim();
		if (!(yy_sj_yy_sjjjb_qntq.equals("")))	wheresql+=" and  (yy_sj.yy_sjjjb_qntq="+yy_sj_yy_sjjjb_qntq+") ";
	}
	yy_sj_yy_sjscb_mbkh=request.getParameter("yy_sj_yy_sjscb_mbkh");
	if (yy_sj_yy_sjscb_mbkh!=null)
	{
		yy_sj_yy_sjscb_mbkh=yy_sj_yy_sjscb_mbkh.trim();
		if (!(yy_sj_yy_sjscb_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjscb_mbkh="+yy_sj_yy_sjscb_mbkh+") ";
	}
	yy_sj_yy_sjwxb_mbkh=request.getParameter("yy_sj_yy_sjwxb_mbkh");
	if (yy_sj_yy_sjwxb_mbkh!=null)
	{
		yy_sj_yy_sjwxb_mbkh=yy_sj_yy_sjwxb_mbkh.trim();
		if (!(yy_sj_yy_sjwxb_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjwxb_mbkh="+yy_sj_yy_sjwxb_mbkh+") ";
	}
	yy_sj_yy_sjqtqd_mbkh=request.getParameter("yy_sj_yy_sjqtqd_mbkh");
	if (yy_sj_yy_sjqtqd_mbkh!=null)
	{
		yy_sj_yy_sjqtqd_mbkh=yy_sj_yy_sjqtqd_mbkh.trim();
		if (!(yy_sj_yy_sjqtqd_mbkh.equals("")))	wheresql+=" and (yy_sj.yy_sjqtqd_mbkh="+yy_sj_yy_sjqtqd_mbkh+") ";
	}
	yy_sj_yy_sjscb_sqdj=request.getParameter("yy_sj_yy_sjscb_sqdj");
	if (yy_sj_yy_sjscb_sqdj!=null)
	{
		yy_sj_yy_sjscb_sqdj=yy_sj_yy_sjscb_sqdj.trim();
		if (!(yy_sj_yy_sjscb_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjscb_sqdj="+yy_sj_yy_sjscb_sqdj+") ";
	}
	yy_sj_yy_sjwxb_sqdj=request.getParameter("yy_sj_yy_sjwxb_sqdj");
	if (yy_sj_yy_sjwxb_sqdj!=null)
	{
		yy_sj_yy_sjwxb_sqdj=yy_sj_yy_sjwxb_sqdj.trim();
		if (!(yy_sj_yy_sjwxb_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjwxb_sqdj="+yy_sj_yy_sjwxb_sqdj+") ";
	}
	yy_sj_yy_sjqtqd_sqdj=request.getParameter("yy_sj_yy_sjqtqd_sqdj");
	if (yy_sj_yy_sjqtqd_sqdj!=null)
	{
		yy_sj_yy_sjqtqd_sqdj=yy_sj_yy_sjqtqd_sqdj.trim();
		if (!(yy_sj_yy_sjqtqd_sqdj.equals("")))	wheresql+=" and (yy_sj.yy_sjqtqd_sqdj="+yy_sj_yy_sjqtqd_sqdj+") ";
	}
	yy_sj_yy_sj_lrsj=request.getParameter("yy_sj_yy_sj_lrsj");
	if (yy_sj_yy_sj_lrsj!=null)
	{
		yy_sj_yy_sj_lrsj=yy_sj_yy_sj_lrsj.trim();
		if (!(yy_sj_yy_sj_lrsj.equals("")))	wheresql+="  and (yy_sj.yy_sj_lrsj>=TO_DATE('"+yy_sj_yy_sj_lrsj+"','YYYY/MM/DD'))";
	}
	yy_sj_yy_sj_lrsj=request.getParameter("yy_sj_yy_sj_lrsj2");
	if (yy_sj_yy_sj_lrsj!=null)
	{
		yy_sj_yy_sj_lrsj=yy_sj_yy_sj_lrsj.trim();
		if (!(yy_sj_yy_sj_lrsj.equals("")))	wheresql+="  and (yy_sj.yy_sj_lrsj<=TO_DATE('"+yy_sj_yy_sj_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_sj_lrr=request.getParameter("yy_sj_lrr");
	if (yy_sj_lrr!=null)
	{
		yy_sj_lrr=cf.GB2Uni(yy_sj_lrr);
		if (!(yy_sj_lrr.equals("")))	wheresql+=" and  (yy_sj.lrr='"+yy_sj_lrr+"')";
	}
	ls_sql="SELECT yy_sj.zqs,yy_sj.yy_sj_fgs,sq_dwxx.dwmc,yy_sj.yy_sjzky_mbkh,yy_sj.yy_sjzky_sqdj,yy_sj.yy_sjscb_mbkh,yy_sj.yy_sjscb_sqdj,yy_sj.yy_sjwxb_mbkh,yy_sj.yy_sjwxb_sqdj  ,yy_sj.yy_sjsjb_sjf,yy_sj.yy_sjsjb_tqsjf,yy_sj.yy_sjsjb_gccz,yy_sj.yy_sjsjb_tqgccz,yy_sj.yy_sjjjb_byjh,yy_sj.yy_sjjjb_qntq,yy_sj.yy_sjqtqd_mbkh,yy_sj.yy_sjqtqd_sqdj,yy_sj.yy_sj_lrsj,yy_sj.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_sj  ";
    ls_sql+=" where yy_sj.yy_sj_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_sj.zqs,yy_sj.yy_sj_fgs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_sjList.jsp","","","EditYy_sj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zqs","yy_sj_fgs","sq_dwxx_dwmc","yy_sj_yy_sjzky_mbkh","yy_sj_yy_sjzky_sqdj","yy_sj_yy_sjsjb_sjf","yy_sj_yy_sjsjb_tqsjf","yy_sj_yy_sjsjb_gccz","yy_sj_yy_sjsjb_tqgccz","yy_sj_yy_sjjjb_byjh","yy_sj_yy_sjjjb_qntq","yy_sj_yy_sjscb_mbkh","yy_sj_yy_sjwxb_mbkh","yy_sj_yy_sjqtqd_mbkh","yy_sj_yy_sjscb_sqdj","yy_sj_yy_sjwxb_sqdj","yy_sj_yy_sjqtqd_sqdj","yy_sj_yy_sj_lrsj","yy_sj_lrr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zqs","yy_sj_fgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yy_sjList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from yy_sj where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">周期数</td>
	<td  width="4%">分公司</td>
	<td  width="7%">分公司</td>
	<td  width="5%">总客源目标客户数量本月计划</td>
	<td  width="5%">总客源收取定金数量本月计划</td>

	<td  width="5%">市场部目标客户数量本月计划</td>
	<td  width="5%">市场部收取定金数量本月计划</td>
	<td  width="5%">网销部目标客户数量本月计划</td>
	<td  width="5%">网销部收取定金数量本月计划</td>

	<td  width="5%">设计部设计费本月计划</td>
	<td  width="5%">设计部去年同期月度设计费</td>
	<td  width="5%">设计部工程产值本月计划</td>
	<td  width="5%">设计部去年同期月度工程产值</td>
	<td  width="5%">家居部主材产值本月计划</td>
	<td  width="5%">家居部去年同期月度主材产值</td>

	<td  width="5%">其他渠道目标客户数量本月计划</td>
	<td  width="5%">其他渠道收取定金数量本月计划</td>

	<td  width="6%">录入时间</td>
	<td  width="4%">录入人</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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