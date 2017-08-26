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
	String oa_lqsq_bgypbm=null;
	String oa_lqsq_dwbh=null;
	String oa_lqsq_slr=null;
	String oa_lqsq_lrr=null;
	String oa_lqsq_lrrq=null;
	String oa_lqsq_jhlqsl=null;
	String oa_lqsq_jhlqrq=null;
	String oa_lqsq_lqzt=null;
	String oa_lqsq_slqsl=null;
	String oa_lqsq_blr=null;
	String oa_lqsq_lqsj=null;
	oa_lqsq_bgypbm=request.getParameter("oa_lqsq_bgypbm");
	if (oa_lqsq_bgypbm!=null)
	{
		oa_lqsq_bgypbm=cf.GB2Uni(oa_lqsq_bgypbm);
		if (!(oa_lqsq_bgypbm.equals("")))	wheresql+=" and  (oa_lqsq.bgypbm='"+oa_lqsq_bgypbm+"')";
	}
	oa_lqsq_dwbh=request.getParameter("oa_lqsq_dwbh");
	if (oa_lqsq_dwbh!=null)
	{
		oa_lqsq_dwbh=cf.GB2Uni(oa_lqsq_dwbh);
		if (!(oa_lqsq_dwbh.equals("")))	wheresql+=" and  (oa_lqsq.dwbh='"+oa_lqsq_dwbh+"')";
	}
	oa_lqsq_slr=request.getParameter("oa_lqsq_slr");
	if (oa_lqsq_slr!=null)
	{
		oa_lqsq_slr=cf.GB2Uni(oa_lqsq_slr);
		if (!(oa_lqsq_slr.equals("")))	wheresql+=" and  (oa_lqsq.slr='"+oa_lqsq_slr+"')";
	}
	oa_lqsq_lrr=request.getParameter("oa_lqsq_lrr");
	if (oa_lqsq_lrr!=null)
	{
		oa_lqsq_lrr=cf.GB2Uni(oa_lqsq_lrr);
		if (!(oa_lqsq_lrr.equals("")))	wheresql+=" and  (oa_lqsq.lrr='"+oa_lqsq_lrr+"')";
	}
	oa_lqsq_lrrq=request.getParameter("oa_lqsq_lrrq");
	if (oa_lqsq_lrrq!=null)
	{
		oa_lqsq_lrrq=oa_lqsq_lrrq.trim();
		if (!(oa_lqsq_lrrq.equals("")))	wheresql+="  and (oa_lqsq.lrrq>=TO_DATE('"+oa_lqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lrrq=request.getParameter("oa_lqsq_lrrq2");
	if (oa_lqsq_lrrq!=null)
	{
		oa_lqsq_lrrq=oa_lqsq_lrrq.trim();
		if (!(oa_lqsq_lrrq.equals("")))	wheresql+="  and (oa_lqsq.lrrq<=TO_DATE('"+oa_lqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_jhlqsl=request.getParameter("oa_lqsq_jhlqsl");
	if (oa_lqsq_jhlqsl!=null)
	{
		oa_lqsq_jhlqsl=oa_lqsq_jhlqsl.trim();
		if (!(oa_lqsq_jhlqsl.equals("")))	wheresql+=" and (oa_lqsq.jhlqsl>="+oa_lqsq_jhlqsl+") ";
	}
	oa_lqsq_jhlqsl=request.getParameter("oa_lqsq_jhlqsl2");
	if (oa_lqsq_jhlqsl!=null)
	{
		oa_lqsq_jhlqsl=oa_lqsq_jhlqsl.trim();
		if (!(oa_lqsq_jhlqsl.equals("")))	wheresql+=" and (oa_lqsq.jhlqsl<="+oa_lqsq_jhlqsl+") ";
	}
	oa_lqsq_jhlqrq=request.getParameter("oa_lqsq_jhlqrq");
	if (oa_lqsq_jhlqrq!=null)
	{
		oa_lqsq_jhlqrq=oa_lqsq_jhlqrq.trim();
		if (!(oa_lqsq_jhlqrq.equals("")))	wheresql+="  and (oa_lqsq.jhlqrq>=TO_DATE('"+oa_lqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_jhlqrq=request.getParameter("oa_lqsq_jhlqrq2");
	if (oa_lqsq_jhlqrq!=null)
	{
		oa_lqsq_jhlqrq=oa_lqsq_jhlqrq.trim();
		if (!(oa_lqsq_jhlqrq.equals("")))	wheresql+="  and (oa_lqsq.jhlqrq<=TO_DATE('"+oa_lqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lqzt=request.getParameter("oa_lqsq_lqzt");
	if (oa_lqsq_lqzt!=null)
	{
		oa_lqsq_lqzt=cf.GB2Uni(oa_lqsq_lqzt);
		if (!(oa_lqsq_lqzt.equals("")))	wheresql+=" and  (oa_lqsq.lqzt='"+oa_lqsq_lqzt+"')";
	}
	oa_lqsq_slqsl=request.getParameter("oa_lqsq_slqsl");
	if (oa_lqsq_slqsl!=null)
	{
		oa_lqsq_slqsl=oa_lqsq_slqsl.trim();
		if (!(oa_lqsq_slqsl.equals("")))	wheresql+=" and (oa_lqsq.slqsl>="+oa_lqsq_slqsl+") ";
	}
	oa_lqsq_slqsl=request.getParameter("oa_lqsq_slqsl2");
	if (oa_lqsq_slqsl!=null)
	{
		oa_lqsq_slqsl=oa_lqsq_slqsl.trim();
		if (!(oa_lqsq_slqsl.equals("")))	wheresql+=" and (oa_lqsq.slqsl<="+oa_lqsq_slqsl+") ";
	}
	oa_lqsq_blr=request.getParameter("oa_lqsq_blr");
	if (oa_lqsq_blr!=null)
	{
		oa_lqsq_blr=cf.GB2Uni(oa_lqsq_blr);
		if (!(oa_lqsq_blr.equals("")))	wheresql+=" and  (oa_lqsq.blr='"+oa_lqsq_blr+"')";
	}
	oa_lqsq_lqsj=request.getParameter("oa_lqsq_lqsj");
	if (oa_lqsq_lqsj!=null)
	{
		oa_lqsq_lqsj=oa_lqsq_lqsj.trim();
		if (!(oa_lqsq_lqsj.equals("")))	wheresql+="  and (oa_lqsq.lqsj>=TO_DATE('"+oa_lqsq_lqsj+"','YYYY/MM/DD'))";
	}
	oa_lqsq_lqsj=request.getParameter("oa_lqsq_lqsj2");
	if (oa_lqsq_lqsj!=null)
	{
		oa_lqsq_lqsj=oa_lqsq_lqsj.trim();
		if (!(oa_lqsq_lqsj.equals("")))	wheresql+="  and (oa_lqsq.lqsj<=TO_DATE('"+oa_lqsq_lqsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT oa_lqsq.xh,oa_bgypbm.bgypmc as bgypmc,sq_dwxx.dwmc as sq_dwxx_dwmc,oa_lqsq.slr as oa_lqsq_slr,oa_lqsq.lrr as oa_lqsq_lrr,oa_lqsq.lrrq as oa_lqsq_lrrq,oa_lqsq.jhlqsl as oa_lqsq_jhlqsl,oa_lqsq.jhlqsl*oa_bgypbm.dj as je,oa_lqsq.jhlqrq as oa_lqsq_jhlqrq, DECODE(oa_lqsq.lqzt,'N','未领取','Y','已领取') as oa_lqsq_lqzt  ";
	ls_sql+=" FROM oa_bgypbm,oa_lqsq,sq_dwxx  ";
    ls_sql+=" where oa_lqsq.dwbh=sq_dwxx.dwbh and oa_lqsq.bgypbm=oa_bgypbm.bgypbm";
    ls_sql+=" and oa_bgypbm.fgsbh=sq_dwxx.ssfgs";
    ls_sql+=wheresql;
	ls_sql+=" order by sq_dwxx.dwmc,oa_lqsq.slr";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Oa_lqsqList.jsp","SelectOa_lqsq.jsp","","editmain.jsp");
	pageObj.setPageRow(100);//设置每页显示记录数
//设置显示列
	String[] disColName={"sq_dwxx_dwmc","oa_lqsq_slr","bgypmc","oa_lqsq_lrr","oa_lqsq_lrrq","oa_lqsq_jhlqsl","je","oa_lqsq_jhlqrq","oa_lqsq_lqzt"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
/*
*/
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Oa_lqsqList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("sq_dwxx_dwmc","1");//列参数对象加入Hash表
	spanColHash.put("oa_lqsq_slr","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from oa_lqsq where ("+chooseitem+") and lqzt='N'";
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="12%">单位</td>
	<td  width="8%">申领人</td>
	<td  width="14%">办公用品</td>
	<td  width="10%">录入人</td>
	<td  width="10%">录入日期</td>
	<td  width="9%">计划领取数</td>
	<td  width="10%">金额</td>
	<td  width="10%">计划领取日期</td>
	<td  width="9%">领取状态</td>
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