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
	String bj_tcsjcjb_bjbbh=null;
	String bj_tcsjcjb_dqbm=null;
	String bj_tcsjcjb_bjjbbm=null;
	String bj_tcsjcjb_bjjbbm1=null;
	String tcsjflbm=null;
	String bj_tcsjcjb_jldw=null;
	bj_tcsjcjb_bjbbh=request.getParameter("bj_tcsjcjb_bjbbh");
	if (bj_tcsjcjb_bjbbh!=null)
	{
		bj_tcsjcjb_bjbbh=cf.GB2Uni(bj_tcsjcjb_bjbbh);
		if (!(bj_tcsjcjb_bjbbh.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjbbh='"+bj_tcsjcjb_bjbbh+"')";
	}
	bj_tcsjcjb_dqbm=request.getParameter("bj_tcsjcjb_dqbm");
	if (bj_tcsjcjb_dqbm!=null)
	{
		bj_tcsjcjb_dqbm=cf.GB2Uni(bj_tcsjcjb_dqbm);
		if (!(bj_tcsjcjb_dqbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.dqbm='"+bj_tcsjcjb_dqbm+"')";
	}
	bj_tcsjcjb_bjjbbm=request.getParameter("bj_tcsjcjb_bjjbbm");
	if (bj_tcsjcjb_bjjbbm!=null)
	{
		bj_tcsjcjb_bjjbbm=cf.GB2Uni(bj_tcsjcjb_bjjbbm);
		if (!(bj_tcsjcjb_bjjbbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjjbbm='"+bj_tcsjcjb_bjjbbm+"')";
	}
	bj_tcsjcjb_bjjbbm1=request.getParameter("bj_tcsjcjb_bjjbbm1");
	if (bj_tcsjcjb_bjjbbm1!=null)
	{
		bj_tcsjcjb_bjjbbm1=cf.GB2Uni(bj_tcsjcjb_bjjbbm1);
		if (!(bj_tcsjcjb_bjjbbm1.equals("")))	wheresql+=" and  (bj_tcsjcjb.bjjbbm1='"+bj_tcsjcjb_bjjbbm1+"')";
	}
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_tcsjcjb.tcsjflbm='"+tcsjflbm+"')";
	}
	bj_tcsjcjb_jldw=request.getParameter("bj_tcsjcjb_jldw");
	if (bj_tcsjcjb_jldw!=null)
	{
		bj_tcsjcjb_jldw=cf.GB2Uni(bj_tcsjcjb_jldw);
		if (!(bj_tcsjcjb_jldw.equals("")))	wheresql+=" and  (bj_tcsjcjb.jldw='"+bj_tcsjcjb_jldw+"')";
	}

	String sjsfycx=null;
	sjsfycx=request.getParameter("sjsfycx");
	if (sjsfycx!=null)
	{
		if (!(sjsfycx.equals("")))	wheresql+=" and  (bj_tcsjcjb.sjsfycx='"+sjsfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjssj=null;
	cxjssj=request.getParameter("cxjssj");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxjssj>=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	cxjssj=request.getParameter("cxjssj2");
	if (cxjssj!=null)
	{
		if (!(cxjssj.equals("")))	wheresql+="  and (bj_tcsjcjb.cxjssj<=TO_DATE('"+cxjssj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT bj_tcsjcjb.bjbbh,bj_tcsjcjb.dqbm,dm_dqbm.dqmc,bj_tcsjcjb.bjjbbm,a.bjjbmc,bj_tcsjcjb.bjjbbm1,b.bjjbmc bjjbmc1,bj_tcsjcjb.tcsjflbm,tcsjflmc,bj_tcsjcjb.jldw,bj_tcsjcjb.sjcj,DECODE(sjsfycx,'1','无促销','2','<font color=\"#FF0000\">无数量限制促销</font>','3','<font color=\"#0000FF\">有数量限制促销</font>') sjsfycx,cxkssj,cxjssj,cxsjcj  ";
	ls_sql+=" FROM bj_tcsjcjb,dm_dqbm,bdm_bjjbbm a,bdm_bjjbbm b,bj_tcsjflbm  ";
    ls_sql+=" where bj_tcsjcjb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm=a.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.bjjbbm1=b.bjjbbm(+)";
    ls_sql+=" and bj_tcsjcjb.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_tcsjcjb.bjbbh,bj_tcsjcjb.dqbm,bj_tcsjcjb.tcsjflbm,bj_tcsjcjb.bjjbbm,bj_tcsjcjb.bjjbbm1";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Bj_tcsjcjbList.jsp","","","EditBj_tcsjcjb.jsp");
//	pageObj.setPageRow(100);//设置每页显示记录数

//设置显示列
	String[] disColName={"bjbbh","dqmc","tcsjflmc","bjjbmc","bjjbmc1","jldw","sjcj","sjsfycx","cxsjcj","cxkssj","cxjssj"};
	pageObj.setDisColName(disColName);

//设置主键
	String[] keyName={"bjbbh","dqbm","bjjbbm","bjjbbm1","tcsjflbm"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息","批量修改促销"};//按钮的显示名称
	String[] buttonLink={"Bj_tcsjcjbList.jsp?","plxgcx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bj_tcsjcjb where "+chooseitem;
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
  <B><font size="3">套餐升级差价表－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="9%">报价版本号</td>
	<td  width="7%">地区</td>
	<td  width="13%">套餐升级分类</td>
	<td  width="7%">原报价级别</td>
	<td  width="7%">升级报价级别</td>
	<td  width="6%">计量单位</td>
	<td  width="8%">升级差价</td>
	<td  width="9%">升级是否有促销</td>
	<td  width="8%">促销升级差价</td>
	<td  width="9%">促销开始时间</td>
	<td  width="9%">促销结束时间</td>
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