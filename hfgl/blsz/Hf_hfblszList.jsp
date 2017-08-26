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
	String hf_hfblsz_ssfgs=null;
	String hf_hfblsz_hflx=null;
	String hf_hfblsz_khsksd=null;
	String hf_hfblsz_khsjzd=null;
	String hf_hfblsz_hfbl=null;
	hf_hfblsz_ssfgs=request.getParameter("hf_hfblsz_ssfgs");
	if (hf_hfblsz_ssfgs!=null)
	{
		hf_hfblsz_ssfgs=cf.GB2Uni(hf_hfblsz_ssfgs);
		if (!(hf_hfblsz_ssfgs.equals("")))	wheresql+=" and  (hf_hfblsz.ssfgs='"+hf_hfblsz_ssfgs+"')";
	}
	hf_hfblsz_hflx=request.getParameter("hf_hfblsz_hflx");
	if (hf_hfblsz_hflx!=null)
	{
		hf_hfblsz_hflx=cf.GB2Uni(hf_hfblsz_hflx);
		if (!(hf_hfblsz_hflx.equals("")))	wheresql+=" and  (hf_hfblsz.hflx='"+hf_hfblsz_hflx+"')";
	}
	hf_hfblsz_khsksd=request.getParameter("hf_hfblsz_khsksd");
	if (hf_hfblsz_khsksd!=null)
	{
		hf_hfblsz_khsksd=hf_hfblsz_khsksd.trim();
		if (!(hf_hfblsz_khsksd.equals("")))	wheresql+=" and (hf_hfblsz.khsksd="+hf_hfblsz_khsksd+") ";
	}
	hf_hfblsz_khsjzd=request.getParameter("hf_hfblsz_khsjzd");
	if (hf_hfblsz_khsjzd!=null)
	{
		hf_hfblsz_khsjzd=hf_hfblsz_khsjzd.trim();
		if (!(hf_hfblsz_khsjzd.equals("")))	wheresql+=" and (hf_hfblsz.khsjzd="+hf_hfblsz_khsjzd+") ";
	}
	hf_hfblsz_hfbl=request.getParameter("hf_hfblsz_hfbl");
	if (hf_hfblsz_hfbl!=null)
	{
		hf_hfblsz_hfbl=hf_hfblsz_hfbl.trim();
		if (!(hf_hfblsz_hfbl.equals("")))	wheresql+=" and  (hf_hfblsz.hfbl="+hf_hfblsz_hfbl+") ";
	}
	ls_sql="SELECT hf_hfblsz.ssfgs,sq_dwxx.dwmc,hf_hfblsz.hflx,DECODE(hf_hfblsz.hflx,'1','飞单回访','2','在施工回访','3','完工回访') hflxmc,hf_hfblsz.khsksd,hf_hfblsz.khsjzd,hf_hfblsz.hfbl  ";
	ls_sql+=" FROM sq_dwxx,hf_hfblsz  ";
    ls_sql+=" where hf_hfblsz.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by hf_hfblsz.ssfgs,hf_hfblsz.hflx,hf_hfblsz.khsksd";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hf_hfblszList.jsp","","","EditHf_hfblsz.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dwmc","hflxmc","khsksd","khsjzd","hfbl"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"ssfgs","hflx","khsksd"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Hf_hfblszList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("hflxmc","1");//列参数对象加入Hash表
	spanColHash.put("khsksd","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from hf_hfblsz where "+chooseitem;
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
	<td  width="14%">分公司</td>
	<td  width="14%">回访类型</td>
	<td  width="14%">客户数开始点</td>
	<td  width="14%">客户数截至点</td>
	<td  width="14%">回访比例</td>
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