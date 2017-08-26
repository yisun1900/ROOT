<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String lrr=(String)session.getAttribute("yhdlm");
String dwlx=(String)session.getAttribute("dwlx");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");
String dqbm=(String)session.getAttribute("dqbm");
	String ssfgs=(String)session.getAttribute("ssfgs");

%>
<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String qh_mtjk_jkbbh=null;
	String qh_mtjk_bjkgsbh=null;
	String qh_mtjk_xxlybm=null;
	String qh_mtjk_bcsj=null;
	String qh_mtjk_gggs=null;
	String qh_mtjk_dwbh=null;
	qh_mtjk_jkbbh=request.getParameter("qh_mtjk_jkbbh");
	if (qh_mtjk_jkbbh!=null)
	{
		qh_mtjk_jkbbh=cf.GB2Uni(qh_mtjk_jkbbh);
		if (!(qh_mtjk_jkbbh.equals("")))	wheresql+=" and  (qh_mtjk.jkbbh='"+qh_mtjk_jkbbh+"')";
	}
	qh_mtjk_bjkgsbh=request.getParameter("qh_mtjk_bjkgsbh");
	if (qh_mtjk_bjkgsbh!=null)
	{
		qh_mtjk_bjkgsbh=cf.GB2Uni(qh_mtjk_bjkgsbh);
		if (!(qh_mtjk_bjkgsbh.equals("")))	wheresql+=" and  (qh_mtjk.bjkgsbh='"+qh_mtjk_bjkgsbh+"')";
	}
	qh_mtjk_xxlybm=request.getParameter("qh_mtjk_xxlybm");
	if (qh_mtjk_xxlybm!=null)
	{
		qh_mtjk_xxlybm=cf.GB2Uni(qh_mtjk_xxlybm);
		if (!(qh_mtjk_xxlybm.equals("")))	wheresql+=" and  (qh_mtjk.xxlybm='"+qh_mtjk_xxlybm+"')";
	}
	qh_mtjk_bcsj=request.getParameter("qh_mtjk_bcsj");
	if (qh_mtjk_bcsj!=null)
	{
		qh_mtjk_bcsj=qh_mtjk_bcsj.trim();
		if (!(qh_mtjk_bcsj.equals("")))	wheresql+="  and (qh_mtjk.bcsj>=TO_DATE('"+qh_mtjk_bcsj+"','YYYY/MM/DD'))";
	}
	qh_mtjk_bcsj=request.getParameter("qh_mtjk_bcsj2");
	if (qh_mtjk_bcsj!=null)
	{
		qh_mtjk_bcsj=qh_mtjk_bcsj.trim();
		if (!(qh_mtjk_bcsj.equals("")))	wheresql+="  and (qh_mtjk.bcsj<=TO_DATE('"+qh_mtjk_bcsj+"','YYYY/MM/DD'))";
	}
	qh_mtjk_gggs=request.getParameter("qh_mtjk_gggs");
	if (qh_mtjk_gggs!=null)
	{
		qh_mtjk_gggs=cf.GB2Uni(qh_mtjk_gggs);
		if (!(qh_mtjk_gggs.equals("")))	wheresql+=" and  (qh_mtjk.gggs='"+qh_mtjk_gggs+"')";
	}
	qh_mtjk_dwbh=request.getParameter("qh_mtjk_dwbh");
	if (qh_mtjk_dwbh!=null)
	{
		qh_mtjk_dwbh=cf.GB2Uni(qh_mtjk_dwbh);
		if (!(qh_mtjk_dwbh.equals("")))	wheresql+=" and  (qh_mtjk.dwbh='"+qh_mtjk_dwbh+"')";
	}

	if (yhjs.equals("A0")||yhjs.equals("A1"))
	{ 
		wheresql+=" and (1=1) ";
	 }
	else if (yhjs.equals("F0")||yhjs.equals("F1"))
	{ 
		wheresql+=" and (sq_dwxx.ssdw='"+ssfgs+"') ";
	 }
	 else
	 {
		wheresql+=" and (sq_dwxx.dwbh='"+dwbh+"') ";
	 }
	ls_sql="SELECT qh_mtjk.jkbbh as jkbbh,qh_bjkgsdm.bjkgsmc as qh_bjkgsdm_bjkgsmc,dm_xxlybm.xxlymc,to_char(qh_mtjk.bcsj,'YYYY-MM-DD')||'('||decode(to_char(qh_mtjk.bcsj,'D'),'1','周日','2','周一','3','周二','4','周三','5','周四','6','周五','7','周六','星期八')||')' as qh_mtjk_bcsj,qh_mtjk.gggs as qh_mtjk_gggs,qh_mtjk.yjjg as qh_mtjk_yjjg,sq_dwxx.dwmc as sq_dwxx_dwmc ,qh_mtjk.bz as qh_mtjk_bz ";
	ls_sql+=" FROM qh_mtjk,qh_bjkgsdm,sq_dwxx,dm_xxlybm  ";
    ls_sql+=" where qh_mtjk.bjkgsbh=qh_bjkgsdm.bjkgsbh and qh_mtjk.dwbh=sq_dwxx.dwbh and dm_xxlybm.xxlybm=qh_mtjk.xxlybm";
    ls_sql+=wheresql;
    ls_sql+=" order by qh_mtjk.bcsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Qh_mtjkCxList.jsp","SelectCxQh_mtjk.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jkbbh","qh_mtjk_bcsj","qh_mtjk_gggs","qh_mtjk_yjjg","qh_mtjk_bz","qh_mtjk_dwbh","sq_dwxx_dwmc","qh_bjkgsdm_bjkgsmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jkbbh"};
	pageObj.setKey(keyName);
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
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">监控表编号</td>
	<td  width="12%">被监控公司名称</td>
	<td  width="8%">广告形式</td>
	<td  width="7%">播出时间</td>
	<td  width="12%">广告公司</td>
	<td  width="6%">预计价格</td>
	<td  width="12%">监控单位</td>
	<td  width="37%">备注</td>
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