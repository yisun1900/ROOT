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
	String yy_wxb_zqs=null;
	String yy_wxb_yy_wxb_ygmc=null;
	String yy_wxb_ssbm=null;
	String yy_wxb_ssfgs=null;
	String yy_wxb_yy_wxbkh_byjh=null;
	String yy_wxb_yy_wxbkh_bylj=null;
	String yy_wxb_yy_wxbkh_szjh=null;
	String yy_wxb_yy_wxbkh_szwc=null;
	String yy_wxb_yy_wxbkh_bzyj=null;
	String yy_wxb_yy_wxbdj_byjh=null;
	String yy_wxb_yy_wxbdj_bylj=null;
	String yy_wxb_yy_wxbdj_szjh=null;
	String yy_wxb_yy_wxbdj_szwc=null;
	String yy_wxb_yy_wxbdj_bzjh=null;
	String yy_wxb_yy_wxb_lrr=null;
	String yy_wxb_yy_wxb_lrsj=null;
	yy_wxb_zqs=request.getParameter("yy_wxb_zqs");
	if (yy_wxb_zqs!=null)
	{
		yy_wxb_zqs=yy_wxb_zqs.trim();
		if (!(yy_wxb_zqs.equals("")))	wheresql+=" and (yy_wxb.zqs="+yy_wxb_zqs+") ";
	}
	yy_wxb_yy_wxb_ygmc=request.getParameter("yy_wxb_yy_wxb_ygmc");
	if (yy_wxb_yy_wxb_ygmc!=null)
	{
		yy_wxb_yy_wxb_ygmc=cf.GB2Uni(yy_wxb_yy_wxb_ygmc);
		if (!(yy_wxb_yy_wxb_ygmc.equals("")))	wheresql+=" and  (yy_wxb.yy_wxb_ygmc='"+yy_wxb_yy_wxb_ygmc+"')";
	}
	yy_wxb_ssbm=request.getParameter("yy_wxb_ssbm");
	if (yy_wxb_ssbm!=null)
	{
		yy_wxb_ssbm=cf.GB2Uni(yy_wxb_ssbm);
		if (!(yy_wxb_ssbm.equals("")))	wheresql+=" and  (yy_wxb.ssbm='"+yy_wxb_ssbm+"')";
	}
	yy_wxb_ssfgs=request.getParameter("yy_wxb_ssfgs");
	if (yy_wxb_ssfgs!=null)
	{
		yy_wxb_ssfgs=cf.GB2Uni(yy_wxb_ssfgs);
		if (!(yy_wxb_ssfgs.equals("")))	wheresql+=" and  (yy_wxb.ssfgs='"+yy_wxb_ssfgs+"')";
	}
	yy_wxb_yy_wxbkh_byjh=request.getParameter("yy_wxb_yy_wxbkh_byjh");
	if (yy_wxb_yy_wxbkh_byjh!=null)
	{
		yy_wxb_yy_wxbkh_byjh=yy_wxb_yy_wxbkh_byjh.trim();
		if (!(yy_wxb_yy_wxbkh_byjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_byjh="+yy_wxb_yy_wxbkh_byjh+") ";
	}
	yy_wxb_yy_wxbkh_bylj=request.getParameter("yy_wxb_yy_wxbkh_bylj");
	if (yy_wxb_yy_wxbkh_bylj!=null)
	{
		yy_wxb_yy_wxbkh_bylj=yy_wxb_yy_wxbkh_bylj.trim();
		if (!(yy_wxb_yy_wxbkh_bylj.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_bylj="+yy_wxb_yy_wxbkh_bylj+") ";
	}
	yy_wxb_yy_wxbkh_szjh=request.getParameter("yy_wxb_yy_wxbkh_szjh");
	if (yy_wxb_yy_wxbkh_szjh!=null)
	{
		yy_wxb_yy_wxbkh_szjh=yy_wxb_yy_wxbkh_szjh.trim();
		if (!(yy_wxb_yy_wxbkh_szjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_szjh="+yy_wxb_yy_wxbkh_szjh+") ";
	}
	yy_wxb_yy_wxbkh_szwc=request.getParameter("yy_wxb_yy_wxbkh_szwc");
	if (yy_wxb_yy_wxbkh_szwc!=null)
	{
		yy_wxb_yy_wxbkh_szwc=yy_wxb_yy_wxbkh_szwc.trim();
		if (!(yy_wxb_yy_wxbkh_szwc.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_szwc="+yy_wxb_yy_wxbkh_szwc+") ";
	}
	yy_wxb_yy_wxbkh_bzyj=request.getParameter("yy_wxb_yy_wxbkh_bzyj");
	if (yy_wxb_yy_wxbkh_bzyj!=null)
	{
		yy_wxb_yy_wxbkh_bzyj=yy_wxb_yy_wxbkh_bzyj.trim();
		if (!(yy_wxb_yy_wxbkh_bzyj.equals("")))	wheresql+=" and (yy_wxb.yy_wxbkh_bzyj="+yy_wxb_yy_wxbkh_bzyj+") ";
	}
	yy_wxb_yy_wxbdj_byjh=request.getParameter("yy_wxb_yy_wxbdj_byjh");
	if (yy_wxb_yy_wxbdj_byjh!=null)
	{
		yy_wxb_yy_wxbdj_byjh=yy_wxb_yy_wxbdj_byjh.trim();
		if (!(yy_wxb_yy_wxbdj_byjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_byjh="+yy_wxb_yy_wxbdj_byjh+") ";
	}
	yy_wxb_yy_wxbdj_bylj=request.getParameter("yy_wxb_yy_wxbdj_bylj");
	if (yy_wxb_yy_wxbdj_bylj!=null)
	{
		yy_wxb_yy_wxbdj_bylj=yy_wxb_yy_wxbdj_bylj.trim();
		if (!(yy_wxb_yy_wxbdj_bylj.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_bylj="+yy_wxb_yy_wxbdj_bylj+") ";
	}
	yy_wxb_yy_wxbdj_szjh=request.getParameter("yy_wxb_yy_wxbdj_szjh");
	if (yy_wxb_yy_wxbdj_szjh!=null)
	{
		yy_wxb_yy_wxbdj_szjh=yy_wxb_yy_wxbdj_szjh.trim();
		if (!(yy_wxb_yy_wxbdj_szjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_szjh="+yy_wxb_yy_wxbdj_szjh+") ";
	}
	yy_wxb_yy_wxbdj_szwc=request.getParameter("yy_wxb_yy_wxbdj_szwc");
	if (yy_wxb_yy_wxbdj_szwc!=null)
	{
		yy_wxb_yy_wxbdj_szwc=yy_wxb_yy_wxbdj_szwc.trim();
		if (!(yy_wxb_yy_wxbdj_szwc.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_szwc="+yy_wxb_yy_wxbdj_szwc+") ";
	}
	yy_wxb_yy_wxbdj_bzjh=request.getParameter("yy_wxb_yy_wxbdj_bzjh");
	if (yy_wxb_yy_wxbdj_bzjh!=null)
	{
		yy_wxb_yy_wxbdj_bzjh=yy_wxb_yy_wxbdj_bzjh.trim();
		if (!(yy_wxb_yy_wxbdj_bzjh.equals("")))	wheresql+=" and (yy_wxb.yy_wxbdj_bzjh="+yy_wxb_yy_wxbdj_bzjh+") ";
	}
	yy_wxb_yy_wxb_lrr=request.getParameter("yy_wxb_yy_wxb_lrr");
	if (yy_wxb_yy_wxb_lrr!=null)
	{
		yy_wxb_yy_wxb_lrr=cf.GB2Uni(yy_wxb_yy_wxb_lrr);
		if (!(yy_wxb_yy_wxb_lrr.equals("")))	wheresql+=" and  (yy_wxb.yy_wxb_lrr='"+yy_wxb_yy_wxb_lrr+"')";
	}
	yy_wxb_yy_wxb_lrsj=request.getParameter("yy_wxb_yy_wxb_lrsj");
	if (yy_wxb_yy_wxb_lrsj!=null)
	{
		yy_wxb_yy_wxb_lrsj=yy_wxb_yy_wxb_lrsj.trim();
		if (!(yy_wxb_yy_wxb_lrsj.equals("")))	wheresql+="  and (yy_wxb.yy_wxb_lrsj>=TO_DATE('"+yy_wxb_yy_wxb_lrsj+"','YYYY-MM-DD'))";
	}
	yy_wxb_yy_wxb_lrsj=request.getParameter("yy_wxb_yy_wxb_lrsj2");
	if (yy_wxb_yy_wxb_lrsj!=null)
	{
		yy_wxb_yy_wxb_lrsj=yy_wxb_yy_wxb_lrsj.trim();
		if (!(yy_wxb_yy_wxb_lrsj.equals("")))	wheresql+="  and (yy_wxb.yy_wxb_lrsj<=TO_DATE('"+yy_wxb_yy_wxb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	ls_sql="SELECT yy_wxb.zqs,yy_wxb.yy_wxb_ygmc,a.dwmc ssbm,b.dwmc ssfgs,yy_wxb.yy_wxbkh_byjh,yy_wxb.yy_wxbkh_bylj,yy_wxb.yy_wxbkh_szjh,yy_wxb.yy_wxbkh_szwc,yy_wxb.yy_wxbkh_bzyj,yy_wxb.yy_wxbdj_byjh,yy_wxb.yy_wxbdj_bylj,yy_wxb.yy_wxbdj_szjh,yy_wxb.yy_wxbdj_szwc,yy_wxb.yy_wxbdj_bzjh,yy_wxb.yy_wxb_lrr,yy_wxb.yy_wxb_lrsj  ";
	ls_sql+=" FROM yy_wxb,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yy_wxb.ssbm=a.dwbh(+)";
    ls_sql+=" and yy_wxb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_wxb.zqs,yy_wxb.ssbm,yy_wxb.yy_wxb_ygmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_wxbList.jsp","","","EditYy_wxb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"zqs","yy_wxb_ygmc","sq_dwxx_dwmc","yy_wxb_ssfgs","yy_wxb_yy_wxbkh_byjh","yy_wxb_yy_wxbkh_bylj","yy_wxb_yy_wxbkh_szjh","yy_wxb_yy_wxbkh_szwc","yy_wxb_yy_wxbkh_bzyj","yy_wxb_yy_wxbdj_byjh","yy_wxb_yy_wxbdj_bylj","yy_wxb_yy_wxbdj_szjh","yy_wxb_yy_wxbdj_szwc","yy_wxb_yy_wxbdj_bzjh","yy_wxb_yy_wxb_lrr","yy_wxb_yy_wxb_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zqs","yy_wxb_ygmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yy_wxbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from yy_wxb where "+chooseitem;
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
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="5%">周期数</td>
	<td  width="6%">网销部员工名称</td>
	<td  width="10%">所属部门</td>
	<td  width="9%">所属分公司</td>
	<td  width="5%">目标客户数量本月计划</td>
	<td  width="5%">目标客户数量本月累计</td>
	<td  width="5%">目标客户数量上周计划</td>
	<td  width="5%">目标客户数量上周完成</td>
	<td  width="5%">目标客户数量本周预计</td>
	<td  width="5%">收取定金数量本月计划</td>
	<td  width="5%">收取定金数量本月累计</td>
	<td  width="5%">收取定金数量上周计划</td>
	<td  width="5%">收取定金数量上周完成</td>
	<td  width="5%">收取定金数量本周计划</td>
	<td  width="5%">录入人</td>
	<td  width="8%">录入时间</td>
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