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
	String yy_scb_zqs=null;
	String yy_scb_yy_scb_ygmc=null;
	String yy_scb_ssbm=null;
	String yy_scb_ssfgs=null;
	String yy_scb_yy_scbkh_byjh=null;
	String yy_scb_yy_scbkh_bylj=null;
	String yy_scb_yy_scbkh_szjh=null;
	String yy_scb_yy_scbkh_szwc=null;
	String yy_scb_yy_scbkh_bzyj=null;
	String yy_scb_yy_scbdj_byjh=null;
	String yy_scb_yy_scbdj_bylj=null;
	String yy_scb_yy_scbdj_szjh=null;
	String yy_scb_yy_scbdj_szwc=null;
	String yy_scb_yy_scbdj_bzjh=null;
	String yy_scb_yy_scb_lrr=null;
	String yy_scb_yy_scb_lrsj=null;
	yy_scb_zqs=request.getParameter("yy_scb_zqs");
	if (yy_scb_zqs!=null)
	{
		yy_scb_zqs=yy_scb_zqs.trim();
		if (!(yy_scb_zqs.equals("")))	wheresql+=" and (yy_scb.zqs="+yy_scb_zqs+") ";
	}
	yy_scb_yy_scb_ygmc=request.getParameter("yy_scb_yy_scb_ygmc");
	if (yy_scb_yy_scb_ygmc!=null)
	{
		yy_scb_yy_scb_ygmc=cf.GB2Uni(yy_scb_yy_scb_ygmc);
		if (!(yy_scb_yy_scb_ygmc.equals("")))	wheresql+=" and  (yy_scb.yy_scb_ygmc='"+yy_scb_yy_scb_ygmc+"')";
	}
	yy_scb_ssbm=request.getParameter("yy_scb_ssbm");
	if (yy_scb_ssbm!=null)
	{
		yy_scb_ssbm=cf.GB2Uni(yy_scb_ssbm);
		if (!(yy_scb_ssbm.equals("")))	wheresql+=" and  (yy_scb.ssbm='"+yy_scb_ssbm+"')";
	}
	yy_scb_ssfgs=request.getParameter("yy_scb_ssfgs");
	if (yy_scb_ssfgs!=null)
	{
		yy_scb_ssfgs=cf.GB2Uni(yy_scb_ssfgs);
		if (!(yy_scb_ssfgs.equals("")))	wheresql+=" and  (yy_scb.ssfgs='"+yy_scb_ssfgs+"')";
	}
	yy_scb_yy_scbkh_byjh=request.getParameter("yy_scb_yy_scbkh_byjh");
	if (yy_scb_yy_scbkh_byjh!=null)
	{
		yy_scb_yy_scbkh_byjh=yy_scb_yy_scbkh_byjh.trim();
		if (!(yy_scb_yy_scbkh_byjh.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_byjh="+yy_scb_yy_scbkh_byjh+") ";
	}
	yy_scb_yy_scbkh_bylj=request.getParameter("yy_scb_yy_scbkh_bylj");
	if (yy_scb_yy_scbkh_bylj!=null)
	{
		yy_scb_yy_scbkh_bylj=yy_scb_yy_scbkh_bylj.trim();
		if (!(yy_scb_yy_scbkh_bylj.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_bylj="+yy_scb_yy_scbkh_bylj+") ";
	}
	yy_scb_yy_scbkh_szjh=request.getParameter("yy_scb_yy_scbkh_szjh");
	if (yy_scb_yy_scbkh_szjh!=null)
	{
		yy_scb_yy_scbkh_szjh=yy_scb_yy_scbkh_szjh.trim();
		if (!(yy_scb_yy_scbkh_szjh.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_szjh="+yy_scb_yy_scbkh_szjh+") ";
	}
	yy_scb_yy_scbkh_szwc=request.getParameter("yy_scb_yy_scbkh_szwc");
	if (yy_scb_yy_scbkh_szwc!=null)
	{
		yy_scb_yy_scbkh_szwc=yy_scb_yy_scbkh_szwc.trim();
		if (!(yy_scb_yy_scbkh_szwc.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_szwc="+yy_scb_yy_scbkh_szwc+") ";
	}
	yy_scb_yy_scbkh_bzyj=request.getParameter("yy_scb_yy_scbkh_bzyj");
	if (yy_scb_yy_scbkh_bzyj!=null)
	{
		yy_scb_yy_scbkh_bzyj=yy_scb_yy_scbkh_bzyj.trim();
		if (!(yy_scb_yy_scbkh_bzyj.equals("")))	wheresql+=" and (yy_scb.yy_scbkh_bzyj="+yy_scb_yy_scbkh_bzyj+") ";
	}
	yy_scb_yy_scbdj_byjh=request.getParameter("yy_scb_yy_scbdj_byjh");
	if (yy_scb_yy_scbdj_byjh!=null)
	{
		yy_scb_yy_scbdj_byjh=yy_scb_yy_scbdj_byjh.trim();
		if (!(yy_scb_yy_scbdj_byjh.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_byjh="+yy_scb_yy_scbdj_byjh+") ";
	}
	yy_scb_yy_scbdj_bylj=request.getParameter("yy_scb_yy_scbdj_bylj");
	if (yy_scb_yy_scbdj_bylj!=null)
	{
		yy_scb_yy_scbdj_bylj=yy_scb_yy_scbdj_bylj.trim();
		if (!(yy_scb_yy_scbdj_bylj.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_bylj="+yy_scb_yy_scbdj_bylj+") ";
	}
	yy_scb_yy_scbdj_szjh=request.getParameter("yy_scb_yy_scbdj_szjh");
	if (yy_scb_yy_scbdj_szjh!=null)
	{
		yy_scb_yy_scbdj_szjh=yy_scb_yy_scbdj_szjh.trim();
		if (!(yy_scb_yy_scbdj_szjh.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_szjh="+yy_scb_yy_scbdj_szjh+") ";
	}
	yy_scb_yy_scbdj_szwc=request.getParameter("yy_scb_yy_scbdj_szwc");
	if (yy_scb_yy_scbdj_szwc!=null)
	{
		yy_scb_yy_scbdj_szwc=yy_scb_yy_scbdj_szwc.trim();
		if (!(yy_scb_yy_scbdj_szwc.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_szwc="+yy_scb_yy_scbdj_szwc+") ";
	}
	yy_scb_yy_scbdj_bzjh=request.getParameter("yy_scb_yy_scbdj_bzjh");
	if (yy_scb_yy_scbdj_bzjh!=null)
	{
		yy_scb_yy_scbdj_bzjh=yy_scb_yy_scbdj_bzjh.trim();
		if (!(yy_scb_yy_scbdj_bzjh.equals("")))	wheresql+=" and (yy_scb.yy_scbdj_bzjh="+yy_scb_yy_scbdj_bzjh+") ";
	}
	yy_scb_yy_scb_lrr=request.getParameter("yy_scb_yy_scb_lrr");
	if (yy_scb_yy_scb_lrr!=null)
	{
		yy_scb_yy_scb_lrr=cf.GB2Uni(yy_scb_yy_scb_lrr);
		if (!(yy_scb_yy_scb_lrr.equals("")))	wheresql+=" and  (yy_scb.yy_scb_lrr='"+yy_scb_yy_scb_lrr+"')";
	}
	yy_scb_yy_scb_lrsj=request.getParameter("yy_scb_yy_scb_lrsj");
	if (yy_scb_yy_scb_lrsj!=null)
	{
		yy_scb_yy_scb_lrsj=yy_scb_yy_scb_lrsj.trim();
		if (!(yy_scb_yy_scb_lrsj.equals("")))	wheresql+="  and (yy_scb.yy_scb_lrsj>=TO_DATE('"+yy_scb_yy_scb_lrsj+"','YYYY-MM-DD'))";
	}
	yy_scb_yy_scb_lrsj=request.getParameter("yy_scb_yy_scb_lrsj2");
	if (yy_scb_yy_scb_lrsj!=null)
	{
		yy_scb_yy_scb_lrsj=yy_scb_yy_scb_lrsj.trim();
		if (!(yy_scb_yy_scb_lrsj.equals("")))	wheresql+="  and (yy_scb.yy_scb_lrsj<=TO_DATE('"+yy_scb_yy_scb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	ls_sql="SELECT yy_scb.zqs,yy_scb.yy_scb_ygmc,yy_scb.ssbm,a.dwmc ssbmmc,yy_scb.ssfgs,b.dwmc ssfgsmc,yy_scb.yy_scbkh_byjh,yy_scb.yy_scbkh_bylj,yy_scb.yy_scbkh_szjh,yy_scb.yy_scbkh_szwc,yy_scb.yy_scbkh_bzyj,yy_scb.yy_scbdj_byjh,yy_scb.yy_scbdj_bylj,yy_scb.yy_scbdj_szjh,yy_scb.yy_scbdj_szwc,yy_scb.yy_scbdj_bzjh,yy_scb.yy_scb_lrr,yy_scb.yy_scb_lrsj  ";
	ls_sql+=" FROM yy_scb,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where yy_scb.ssbm=a.dwbh(+) and yy_scb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_scb.zqs,yy_scb.ssbm,yy_scb.yy_scb_ygmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_scbList.jsp","","","EditYy_scb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"zqs","yy_scb_ygmc","ssbmmc","ssfgsmc","yy_scbkh_byjh","yy_scbkh_bylj","yy_scbkh_szjh","yy_scbkh_szwc","yy_scbkh_bzyj","yy_scbdj_byjh","yy_scbdj_bylj","yy_scbdj_szjh","yy_scbdj_szwc","yy_scbdj_bzjh","yy_scb_lrr","yy_scb_lrsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"zqs","yy_scb_ygmc","ssbm","ssfgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Yy_scbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from yy_scb where "+chooseitem;
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
	<td  width="6%">员工姓名</td>
	<td  width="10%">所属部门</td>
	<td  width="9%">所属分公司</td>
	<td  width="5%">目标客户数量本月计划</td>
	<td  width="5%">目标客户数量本月累计</td>
	<td  width="5%">目标客户数量上周计划</td>
	<td  width="5%">目标客户数量上周完成</td>
	<td  width="5%">目标客户数量本周预计</td>
	<td  width="5%">收取定金本月计划</td>
	<td  width="5%">收取定金本月累计</td>
	<td  width="5%">收取定金上周计划</td>
	<td  width="5%">收取定金上周完成</td>
	<td  width="5%">收取定金本周预计</td>
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