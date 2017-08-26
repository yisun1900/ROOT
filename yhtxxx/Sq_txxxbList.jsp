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
	String sq_txxxb_xh=null;
	String sq_txxxb_ygbh=null;
	String sq_txxxb_yhmc=null;
	String sq_txxxb_txfs=null;
	String sq_txxxb_txlx=null;
	String sq_txxxb_txgjz=null;
	String sq_txxxb_txnr=null;
	String sq_txxxb_kstxsj=null;
	String sq_txxxb_txzt=null;
	String sq_txxxb_txsj=null;
	String sq_txxxb_lrr=null;
	String sq_txxxb_lrsj=null;
	String sq_txxxb_lrbm=null;

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_txxxb.ssfgs='"+ssfgs+"')";
	
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=dwbh.trim();
		if (!(dwbh.equals("")))	wheresql+=" and (sq_txxxb.dwbh='"+dwbh+"') ";
	}
	
	sq_txxxb_xh=request.getParameter("sq_txxxb_xh");
	if (sq_txxxb_xh!=null)
	{
		sq_txxxb_xh=sq_txxxb_xh.trim();
		if (!(sq_txxxb_xh.equals("")))	wheresql+=" and (sq_txxxb.xh="+sq_txxxb_xh+") ";
	}

	sq_txxxb_ygbh=request.getParameter("sq_txxxb_ygbh");
	if (sq_txxxb_ygbh!=null)
	{
		sq_txxxb_ygbh=sq_txxxb_ygbh.trim();
		if (!(sq_txxxb_ygbh.equals("")))	wheresql+=" and (sq_txxxb.ygbh="+sq_txxxb_ygbh+") ";
	}
	sq_txxxb_yhmc=request.getParameter("sq_txxxb_yhmc");
	if (sq_txxxb_yhmc!=null)
	{
		sq_txxxb_yhmc=cf.GB2Uni(sq_txxxb_yhmc);
		if (!(sq_txxxb_yhmc.equals("")))	wheresql+=" and  (sq_txxxb.yhmc like '%"+sq_txxxb_yhmc+"%')";
	}
	sq_txxxb_txfs=request.getParameter("sq_txxxb_txfs");
	if (sq_txxxb_txfs!=null)
	{
		sq_txxxb_txfs=cf.GB2Uni(sq_txxxb_txfs);
		if (!(sq_txxxb_txfs.equals("")))	wheresql+=" and  (sq_txxxb.txfs='"+sq_txxxb_txfs+"')";
	}
	sq_txxxb_txlx=request.getParameter("sq_txxxb_txlx");
	if (sq_txxxb_txlx!=null)
	{
		sq_txxxb_txlx=cf.GB2Uni(sq_txxxb_txlx);
		if (!(sq_txxxb_txlx.equals("")))	wheresql+=" and  (sq_txxxb.txlx='"+sq_txxxb_txlx+"')";
	}
	sq_txxxb_txgjz=request.getParameter("sq_txxxb_txgjz");
	if (sq_txxxb_txgjz!=null)
	{
		sq_txxxb_txgjz=cf.GB2Uni(sq_txxxb_txgjz);
		if (!(sq_txxxb_txgjz.equals("")))	wheresql+=" and  (sq_txxxb.txgjz like '%"+sq_txxxb_txgjz+"%')";
	}
	sq_txxxb_txnr=request.getParameter("sq_txxxb_txnr");
	if (sq_txxxb_txnr!=null)
	{
		sq_txxxb_txnr=cf.GB2Uni(sq_txxxb_txnr);
		if (!(sq_txxxb_txnr.equals("")))	wheresql+=" and  (sq_txxxb.txnr like '%"+sq_txxxb_txnr+"%')";
	}
	sq_txxxb_kstxsj=request.getParameter("sq_txxxb_kstxsj");
	if (sq_txxxb_kstxsj!=null)
	{
		sq_txxxb_kstxsj=sq_txxxb_kstxsj.trim();
		if (!(sq_txxxb_kstxsj.equals("")))	wheresql+="  and (sq_txxxb.kstxsj>=TO_DATE('"+sq_txxxb_kstxsj+"','YYYY/MM/DD'))";
	}
	sq_txxxb_kstxsj=request.getParameter("sq_txxxb_kstxsj2");
	if (sq_txxxb_kstxsj!=null)
	{
		sq_txxxb_kstxsj=sq_txxxb_kstxsj.trim();
		if (!(sq_txxxb_kstxsj.equals("")))	wheresql+="  and (sq_txxxb.kstxsj<=TO_DATE('"+sq_txxxb_kstxsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	sq_txxxb_txzt=request.getParameter("sq_txxxb_txzt");
	if (sq_txxxb_txzt!=null)
	{
		sq_txxxb_txzt=cf.GB2Uni(sq_txxxb_txzt);
		if (!(sq_txxxb_txzt.equals("")))	wheresql+=" and  (sq_txxxb.txzt='"+sq_txxxb_txzt+"')";
	}
	sq_txxxb_txsj=request.getParameter("sq_txxxb_txsj");
	if (sq_txxxb_txsj!=null)
	{
		sq_txxxb_txsj=sq_txxxb_txsj.trim();
		if (!(sq_txxxb_txsj.equals("")))	wheresql+="  and (sq_txxxb.txsj>=TO_DATE('"+sq_txxxb_txsj+"','YYYY/MM/DD'))";
	}
	sq_txxxb_txsj=request.getParameter("sq_txxxb_txsj2");
	if (sq_txxxb_txsj!=null)
	{
		sq_txxxb_txsj=sq_txxxb_txsj.trim();
		if (!(sq_txxxb_txsj.equals("")))	wheresql+="  and (sq_txxxb.txsj<=TO_DATE('"+sq_txxxb_txsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	sq_txxxb_lrr=request.getParameter("sq_txxxb_lrr");
	if (sq_txxxb_lrr!=null)
	{
		sq_txxxb_lrr=cf.GB2Uni(sq_txxxb_lrr);
		if (!(sq_txxxb_lrr.equals("")))	wheresql+=" and  (sq_txxxb.lrr='"+sq_txxxb_lrr+"')";
	}
	sq_txxxb_lrsj=request.getParameter("sq_txxxb_lrsj");
	if (sq_txxxb_lrsj!=null)
	{
		sq_txxxb_lrsj=sq_txxxb_lrsj.trim();
		if (!(sq_txxxb_lrsj.equals("")))	wheresql+="  and (sq_txxxb.lrsj>=TO_DATE('"+sq_txxxb_lrsj+"','YYYY/MM/DD'))";
	}
	sq_txxxb_lrsj=request.getParameter("sq_txxxb_lrsj2");
	if (sq_txxxb_lrsj!=null)
	{
		sq_txxxb_lrsj=sq_txxxb_lrsj.trim();
		if (!(sq_txxxb_lrsj.equals("")))	wheresql+="  and (sq_txxxb.lrsj<=TO_DATE('"+sq_txxxb_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	sq_txxxb_lrbm=request.getParameter("sq_txxxb_lrbm");
	if (sq_txxxb_lrbm!=null)
	{
		sq_txxxb_lrbm=cf.GB2Uni(sq_txxxb_lrbm);
		if (!(sq_txxxb_lrbm.equals("")))	wheresql+=" and  (sq_txxxb.lrbm='"+sq_txxxb_lrbm+"')";
	}

	ls_sql="SELECT sq_txxxb.xh,sq_txxxb.ygbh,sq_txxxb.yhmc, DECODE(sq_txxxb.txzt,'1','未提醒','2','提醒','3','处理'), DECODE(sq_txxxb.txfs,'1','系统','2','电话','3','传真','4','短信','9','全部'), DECODE(sq_txxxb.txlx,'01','咨询回访','02','在施工程回访','03','投诉报修回访','04','投诉报修'),sq_txxxb.kstxsj,sq_txxxb.xctxsj,sq_txxxb.txcs,sq_txxxb.txjg,sq_txxxb.xtxcs,sq_txxxb.txgjz,sq_txxxb.txnr,sq_txxxb.txsj,sq_txxxb.lrr,sq_txxxb.lrsj,sq_dwxx.dwmc  ";
	ls_sql+=" FROM sq_dwxx,sq_txxxb  ";
    ls_sql+=" where sq_txxxb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_txxxb.txzt,sq_txxxb.xctxsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_txxxbList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
	pageObj.setDateType("long");
//设置按钮参数
	String[] buttonName={"删除选中的信息","重新提醒"};//按钮的显示名称
	String[] buttonLink={"Sq_txxxbList.jsp?","SaveCxtx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
}
else//非第一次进入此页，不需要初始化
{
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from sq_txxxb where "+chooseitem;
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
  <B><font size="3">修改提醒</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(220);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="2%">员工序号</td>
	<td  width="4%">员工名称</td>
	<td  width="3%">提醒状态</td>
	<td  width="3%">提醒方式</td>
	<td  width="5%">提醒类型</td>
	<td  width="8%">开始提醒时间</td>
	<td  width="8%">下次提醒时间</td>
	<td  width="3%">设置提醒次数</td>
	<td  width="3%">两次提醒间隔</td>
	<td  width="3%">还需提醒次数</td>
	<td  width="10%">提醒关键字</td>
	<td  width="20%">提醒内容</td>
	<td  width="8%">最近提醒时间</td>
	<td  width="3%">录入人</td>
	<td  width="8%">录入时间</td>
	<td  width="6%">录入部门</td>
</tr>
<%
	pageObj.displayDate();
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