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
	String yy_qtqd_zqs=null;
	String yy_qtqd_ssfgs=null;
	String yy_qtqd_yy_qtqdkh_byjh=null;
	String yy_qtqd_yy_qtqdkh_bylj=null;
	String yy_qtqd_yy_qtqdkh_szjh=null;
	String yy_qtqd_yy_qtqdkh_szwc=null;
	String yy_qtqd_yy_qtqdkh_bzyj=null;
	String yy_qtqd_yy_qtqddj_byjh=null;
	String yy_qtqd_yy_qtqddj_bylj=null;
	String yy_qtqd_yy_qtqddj_szjh=null;
	String yy_qtqd_yy_qtqddj_szwc=null;
	String yy_qtqd_yy_qtqddj_bzyj=null;
	String yy_qtqd_yy_qtqd_lrsj=null;
	String yy_qtqd_yy_qtqd_lrr=null;
	yy_qtqd_zqs=request.getParameter("yy_qtqd_zqs");
	if (yy_qtqd_zqs!=null)
	{
		yy_qtqd_zqs=yy_qtqd_zqs.trim();
		if (!(yy_qtqd_zqs.equals("")))	wheresql+=" and (yy_qtqd.zqs="+yy_qtqd_zqs+") ";
	}
	yy_qtqd_ssfgs=request.getParameter("yy_qtqd_ssfgs");
	if (yy_qtqd_ssfgs!=null)
	{
		yy_qtqd_ssfgs=cf.GB2Uni(yy_qtqd_ssfgs);
		if (!(yy_qtqd_ssfgs.equals("")))	wheresql+=" and  (yy_qtqd.ssfgs='"+yy_qtqd_ssfgs+"')";
	}
	yy_qtqd_yy_qtqdkh_byjh=request.getParameter("yy_qtqd_yy_qtqdkh_byjh");
	if (yy_qtqd_yy_qtqdkh_byjh!=null)
	{
		yy_qtqd_yy_qtqdkh_byjh=yy_qtqd_yy_qtqdkh_byjh.trim();
		if (!(yy_qtqd_yy_qtqdkh_byjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_byjh="+yy_qtqd_yy_qtqdkh_byjh+") ";
	}
	yy_qtqd_yy_qtqdkh_bylj=request.getParameter("yy_qtqd_yy_qtqdkh_bylj");
	if (yy_qtqd_yy_qtqdkh_bylj!=null)
	{
		yy_qtqd_yy_qtqdkh_bylj=yy_qtqd_yy_qtqdkh_bylj.trim();
		if (!(yy_qtqd_yy_qtqdkh_bylj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_bylj="+yy_qtqd_yy_qtqdkh_bylj+") ";
	}
	yy_qtqd_yy_qtqdkh_szjh=request.getParameter("yy_qtqd_yy_qtqdkh_szjh");
	if (yy_qtqd_yy_qtqdkh_szjh!=null)
	{
		yy_qtqd_yy_qtqdkh_szjh=yy_qtqd_yy_qtqdkh_szjh.trim();
		if (!(yy_qtqd_yy_qtqdkh_szjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_szjh="+yy_qtqd_yy_qtqdkh_szjh+") ";
	}
	yy_qtqd_yy_qtqdkh_szwc=request.getParameter("yy_qtqd_yy_qtqdkh_szwc");
	if (yy_qtqd_yy_qtqdkh_szwc!=null)
	{
		yy_qtqd_yy_qtqdkh_szwc=yy_qtqd_yy_qtqdkh_szwc.trim();
		if (!(yy_qtqd_yy_qtqdkh_szwc.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_szwc="+yy_qtqd_yy_qtqdkh_szwc+") ";
	}
	yy_qtqd_yy_qtqdkh_bzyj=request.getParameter("yy_qtqd_yy_qtqdkh_bzyj");
	if (yy_qtqd_yy_qtqdkh_bzyj!=null)
	{
		yy_qtqd_yy_qtqdkh_bzyj=yy_qtqd_yy_qtqdkh_bzyj.trim();
		if (!(yy_qtqd_yy_qtqdkh_bzyj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqdkh_bzyj="+yy_qtqd_yy_qtqdkh_bzyj+") ";
	}
	yy_qtqd_yy_qtqddj_byjh=request.getParameter("yy_qtqd_yy_qtqddj_byjh");
	if (yy_qtqd_yy_qtqddj_byjh!=null)
	{
		yy_qtqd_yy_qtqddj_byjh=yy_qtqd_yy_qtqddj_byjh.trim();
		if (!(yy_qtqd_yy_qtqddj_byjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_byjh="+yy_qtqd_yy_qtqddj_byjh+") ";
	}
	yy_qtqd_yy_qtqddj_bylj=request.getParameter("yy_qtqd_yy_qtqddj_bylj");
	if (yy_qtqd_yy_qtqddj_bylj!=null)
	{
		yy_qtqd_yy_qtqddj_bylj=yy_qtqd_yy_qtqddj_bylj.trim();
		if (!(yy_qtqd_yy_qtqddj_bylj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_bylj="+yy_qtqd_yy_qtqddj_bylj+") ";
	}
	yy_qtqd_yy_qtqddj_szjh=request.getParameter("yy_qtqd_yy_qtqddj_szjh");
	if (yy_qtqd_yy_qtqddj_szjh!=null)
	{
		yy_qtqd_yy_qtqddj_szjh=yy_qtqd_yy_qtqddj_szjh.trim();
		if (!(yy_qtqd_yy_qtqddj_szjh.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_szjh="+yy_qtqd_yy_qtqddj_szjh+") ";
	}
	yy_qtqd_yy_qtqddj_szwc=request.getParameter("yy_qtqd_yy_qtqddj_szwc");
	if (yy_qtqd_yy_qtqddj_szwc!=null)
	{
		yy_qtqd_yy_qtqddj_szwc=yy_qtqd_yy_qtqddj_szwc.trim();
		if (!(yy_qtqd_yy_qtqddj_szwc.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_szwc="+yy_qtqd_yy_qtqddj_szwc+") ";
	}
	yy_qtqd_yy_qtqddj_bzyj=request.getParameter("yy_qtqd_yy_qtqddj_bzyj");
	if (yy_qtqd_yy_qtqddj_bzyj!=null)
	{
		yy_qtqd_yy_qtqddj_bzyj=yy_qtqd_yy_qtqddj_bzyj.trim();
		if (!(yy_qtqd_yy_qtqddj_bzyj.equals("")))	wheresql+=" and (yy_qtqd.yy_qtqddj_bzyj="+yy_qtqd_yy_qtqddj_bzyj+") ";
	}
	yy_qtqd_yy_qtqd_lrsj=request.getParameter("yy_qtqd_yy_qtqd_lrsj");
	if (yy_qtqd_yy_qtqd_lrsj!=null)
	{
		yy_qtqd_yy_qtqd_lrsj=yy_qtqd_yy_qtqd_lrsj.trim();
		if (!(yy_qtqd_yy_qtqd_lrsj.equals("")))	wheresql+="  and (yy_qtqd.yy_qtqd_lrsj>=TO_DATE('"+yy_qtqd_yy_qtqd_lrsj+"','YYYY/MM/DD'))";
	}
	yy_qtqd_yy_qtqd_lrsj=request.getParameter("yy_qtqd_yy_qtqd_lrsj2");
	if (yy_qtqd_yy_qtqd_lrsj!=null)
	{
		yy_qtqd_yy_qtqd_lrsj=yy_qtqd_yy_qtqd_lrsj.trim();
		if (!(yy_qtqd_yy_qtqd_lrsj.equals("")))	wheresql+="  and (yy_qtqd.yy_qtqd_lrsj<=TO_DATE('"+yy_qtqd_yy_qtqd_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_qtqd_yy_qtqd_lrr=request.getParameter("yy_qtqd_yy_qtqd_lrr");
	if (yy_qtqd_yy_qtqd_lrr!=null)
	{
		yy_qtqd_yy_qtqd_lrr=cf.GB2Uni(yy_qtqd_yy_qtqd_lrr);
		if (!(yy_qtqd_yy_qtqd_lrr.equals("")))	wheresql+=" and  (yy_qtqd.yy_qtqd_lrr='"+yy_qtqd_yy_qtqd_lrr+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT yy_qtqd.zqs,yy_qtqd.ssfgs,sq_dwxx.dwmc,yy_qtqd.yy_qtqdkh_byjh,yy_qtqd.yy_qtqdkh_bylj,yy_qtqd.yy_qtqdkh_szjh,yy_qtqd.yy_qtqdkh_szwc,yy_qtqd.yy_qtqdkh_bzyj,yy_qtqd.yy_qtqddj_byjh,yy_qtqd.yy_qtqddj_bylj,yy_qtqd.yy_qtqddj_szjh,yy_qtqd.yy_qtqddj_szwc,yy_qtqd.yy_qtqddj_bzyj,yy_qtqd.yy_qtqd_lrsj,yy_qtqd.yy_qtqd_lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_qtqd  ";
    ls_sql+=" where yy_qtqd.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_qtqd.zqs,yy_qtqd.ssfgs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_qtqdCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"zqs","ssfgs","sq_dwxx_dwmc","yy_qtqd_yy_qtqdkh_byjh","yy_qtqd_yy_qtqdkh_bylj","yy_qtqd_yy_qtqdkh_szjh","yy_qtqd_yy_qtqdkh_szwc","yy_qtqd_yy_qtqdkh_bzyj","yy_qtqd_yy_qtqddj_byjh","yy_qtqd_yy_qtqddj_bylj","yy_qtqd_yy_qtqddj_szjh","yy_qtqd_yy_qtqddj_szwc","yy_qtqd_yy_qtqddj_bzyj","yy_qtqd_yy_qtqd_lrsj","yy_qtqd_yy_qtqd_lrr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zqs","ssfgs"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">周期数</td>
	<td  width="5%">所属分公司</td>
	<td  width="9%">所属分公司</td>
	<td  width="6%">目标客户数量本月计划</td>
	<td  width="6%">目标客户数量本月累计</td>
	<td  width="6%">目标客户数量上周计划</td>
	<td  width="6%">目标客户数量上周完成</td>
	<td  width="6%">目标客户数量本周预计</td>
	<td  width="6%">收取定金数量本月计划</td>
	<td  width="6%">收取定金数量本月累计</td>
	<td  width="6%">收取定金数量上周计划</td>
	<td  width="6%">收取定金数量上周完成</td>
	<td  width="6%">收取定金数量本周预计</td>
	<td  width="8%">录入时间</td>
	<td  width="6%">录入人</td>
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