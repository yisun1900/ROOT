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
	String yy_jjb_zqs=null;
	String yy_jjb_yy_jjb_ygmc=null;
	String yy_jjb_ssbm=null;
	String yy_jjb_ssfgs=null;
	String yy_jjb_yy_jjbqntq=null;
	String yy_jjb_yy_jjbbyjh=null;
	String yy_jjb_yy_jjbylj=null;
	String yy_jjb_yy_jjbdmbylj=null;
	String yy_jjb_yy_jjbszjh=null;
	String yy_jjb_yy_jjbszwc=null;
	String yy_jjb_yy_jjbbzyj=null;
	String yy_jjb_yy_jjb_lrsj=null;
	String yy_jjb_yy_jjb_lrr=null;
	yy_jjb_zqs=request.getParameter("yy_jjb_zqs");
	if (yy_jjb_zqs!=null)
	{
		yy_jjb_zqs=yy_jjb_zqs.trim();
		if (!(yy_jjb_zqs.equals("")))	wheresql+=" and (yy_jjb.zqs="+yy_jjb_zqs+") ";
	}
	yy_jjb_yy_jjb_ygmc=request.getParameter("yy_jjb_yy_jjb_ygmc");
	if (yy_jjb_yy_jjb_ygmc!=null)
	{
		yy_jjb_yy_jjb_ygmc=cf.GB2Uni(yy_jjb_yy_jjb_ygmc);
		if (!(yy_jjb_yy_jjb_ygmc.equals("")))	wheresql+=" and  (yy_jjb.yy_jjb_ygmc='"+yy_jjb_yy_jjb_ygmc+"')";
	}
	yy_jjb_ssbm=request.getParameter("yy_jjb_ssbm");
	if (yy_jjb_ssbm!=null)
	{
		yy_jjb_ssbm=cf.GB2Uni(yy_jjb_ssbm);
		if (!(yy_jjb_ssbm.equals("")))	wheresql+=" and  (yy_jjb.ssbm='"+yy_jjb_ssbm+"')";
	}
	yy_jjb_ssfgs=request.getParameter("yy_jjb_ssfgs");
	if (yy_jjb_ssfgs!=null)
	{
		yy_jjb_ssfgs=cf.GB2Uni(yy_jjb_ssfgs);
		if (!(yy_jjb_ssfgs.equals("")))	wheresql+=" and  (yy_jjb.ssfgs='"+yy_jjb_ssfgs+"')";
	}
	yy_jjb_yy_jjbqntq=request.getParameter("yy_jjb_yy_jjbqntq");
	if (yy_jjb_yy_jjbqntq!=null)
	{
		yy_jjb_yy_jjbqntq=yy_jjb_yy_jjbqntq.trim();
		if (!(yy_jjb_yy_jjbqntq.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbqntq="+yy_jjb_yy_jjbqntq+") ";
	}
	yy_jjb_yy_jjbbyjh=request.getParameter("yy_jjb_yy_jjbbyjh");
	if (yy_jjb_yy_jjbbyjh!=null)
	{
		yy_jjb_yy_jjbbyjh=yy_jjb_yy_jjbbyjh.trim();
		if (!(yy_jjb_yy_jjbbyjh.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbbyjh="+yy_jjb_yy_jjbbyjh+") ";
	}
	yy_jjb_yy_jjbylj=request.getParameter("yy_jjb_yy_jjbylj");
	if (yy_jjb_yy_jjbylj!=null)
	{
		yy_jjb_yy_jjbylj=yy_jjb_yy_jjbylj.trim();
		if (!(yy_jjb_yy_jjbylj.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbylj="+yy_jjb_yy_jjbylj+") ";
	}
	yy_jjb_yy_jjbdmbylj=request.getParameter("yy_jjb_yy_jjbdmbylj");
	if (yy_jjb_yy_jjbdmbylj!=null)
	{
		yy_jjb_yy_jjbdmbylj=yy_jjb_yy_jjbdmbylj.trim();
		if (!(yy_jjb_yy_jjbdmbylj.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbdmbylj="+yy_jjb_yy_jjbdmbylj+") ";
	}
	yy_jjb_yy_jjbszjh=request.getParameter("yy_jjb_yy_jjbszjh");
	if (yy_jjb_yy_jjbszjh!=null)
	{
		yy_jjb_yy_jjbszjh=yy_jjb_yy_jjbszjh.trim();
		if (!(yy_jjb_yy_jjbszjh.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbszjh="+yy_jjb_yy_jjbszjh+") ";
	}
	yy_jjb_yy_jjbszwc=request.getParameter("yy_jjb_yy_jjbszwc");
	if (yy_jjb_yy_jjbszwc!=null)
	{
		yy_jjb_yy_jjbszwc=yy_jjb_yy_jjbszwc.trim();
		if (!(yy_jjb_yy_jjbszwc.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbszwc="+yy_jjb_yy_jjbszwc+") ";
	}
	yy_jjb_yy_jjbbzyj=request.getParameter("yy_jjb_yy_jjbbzyj");
	if (yy_jjb_yy_jjbbzyj!=null)
	{
		yy_jjb_yy_jjbbzyj=yy_jjb_yy_jjbbzyj.trim();
		if (!(yy_jjb_yy_jjbbzyj.equals("")))	wheresql+=" and  (yy_jjb.yy_jjbbzyj="+yy_jjb_yy_jjbbzyj+") ";
	}
	yy_jjb_yy_jjb_lrsj=request.getParameter("yy_jjb_yy_jjb_lrsj");
	if (yy_jjb_yy_jjb_lrsj!=null)
	{
		yy_jjb_yy_jjb_lrsj=yy_jjb_yy_jjb_lrsj.trim();
		if (!(yy_jjb_yy_jjb_lrsj.equals("")))	wheresql+="  and (yy_jjb.yy_jjb_lrsj>=TO_DATE('"+yy_jjb_yy_jjb_lrsj+"','YYYY/MM/DD'))";
	}
	yy_jjb_yy_jjb_lrsj=request.getParameter("yy_jjb_yy_jjb_lrsj2");
	if (yy_jjb_yy_jjb_lrsj!=null)
	{
		yy_jjb_yy_jjb_lrsj=yy_jjb_yy_jjb_lrsj.trim();
		if (!(yy_jjb_yy_jjb_lrsj.equals("")))	wheresql+="  and (yy_jjb.yy_jjb_lrsj<=TO_DATE('"+yy_jjb_yy_jjb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_jjb_yy_jjb_lrr=request.getParameter("yy_jjb_yy_jjb_lrr");
	if (yy_jjb_yy_jjb_lrr!=null)
	{
		yy_jjb_yy_jjb_lrr=cf.GB2Uni(yy_jjb_yy_jjb_lrr);
		if (!(yy_jjb_yy_jjb_lrr.equals("")))	wheresql+=" and  (yy_jjb.yy_jjb_lrr='"+yy_jjb_yy_jjb_lrr+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT yy_jjb.zqs,yy_jjb.yy_jjb_ygmc,a.dwmc ssbm,b.dwmc ssfgs,yy_jjb.yy_jjbqntq,yy_jjb.yy_jjbbyjh,yy_jjb.yy_jjbylj,yy_jjb.yy_jjbdmbylj,yy_jjb.yy_jjbszjh,yy_jjb.yy_jjbszwc,yy_jjb.yy_jjbbzyj,yy_jjb.yy_jjb_lrsj,yy_jjb.yy_jjb_lrr  ";
	ls_sql+=" FROM yy_jjb,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where yy_jjb.ssbm=a.dwbh(+)";
    ls_sql+=" and yy_jjb.ssfgs=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_jjb.zqs,yy_jjb.ssbm,yy_jjb.yy_jjb_ygmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_jjbCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"zqs","yy_jjb_ygmc","sq_dwxx_dwmc","yy_jjb_ssfgs","yy_jjb_yy_jjbqntq","yy_jjb_yy_jjbbyjh","yy_jjb_yy_jjbylj","yy_jjb_yy_jjbdmbylj","yy_jjb_yy_jjbszjh","yy_jjb_yy_jjbszwc","yy_jjb_yy_jjbbzyj","yy_jjb_yy_jjb_lrsj","yy_jjb_yy_jjb_lrr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zqs","yy_jjb_ygmc"};
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">周期数</td>
	<td  width="6%">家居部员工名称</td>
	<td  width="10%">所属部门</td>
	<td  width="8%">所属分公司</td>
	<td  width="8%">去年同期月度主材产值</td>
	<td  width="8%">本月计划</td>
	<td  width="8%">本月累计</td>
	<td  width="8%">所属店面本月累计工程产值</td>
	<td  width="8%">上周计划</td>
	<td  width="8%">上周完成</td>
	<td  width="8%">本周预计</td>
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