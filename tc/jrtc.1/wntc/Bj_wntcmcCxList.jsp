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
	String bj_wntcmc_dqbm=null;
	String tcmc=null;
	String bj_wntcmc_hxbm=null;
	String bj_wntcmc_bzmj=null;
	String bj_wntcmc_tcjg=null;
	String bj_wntcmc_pmzjdj=null;

	String mjsfkzj=null;
	mjsfkzj=request.getParameter("mjsfkzj");
	if (mjsfkzj!=null)
	{
		mjsfkzj=cf.GB2Uni(mjsfkzj);
		if (!(mjsfkzj.equals("")))	wheresql+=" and  (bj_wntcmc.mjsfkzj='"+mjsfkzj+"')";
	}
	String zcsfxxz=null;
	zcsfxxz=request.getParameter("zcsfxxz");
	if (zcsfxxz!=null)
	{
		zcsfxxz=cf.GB2Uni(zcsfxxz);
		if (!(zcsfxxz.equals("")))	wheresql+=" and  (bj_wntcmc.zcsfxxz='"+zcsfxxz+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (bj_wntcmc.lx='"+lx+"')";
	}

	bj_wntcmc_dqbm=request.getParameter("bj_wntcmc_dqbm");
	if (bj_wntcmc_dqbm!=null)
	{
		bj_wntcmc_dqbm=cf.GB2Uni(bj_wntcmc_dqbm);
		if (!(bj_wntcmc_dqbm.equals("")))	wheresql+=" and  (bj_wntcmc.dqbm='"+bj_wntcmc_dqbm+"')";
	}

	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (bj_wntcmc.tcmc like '%"+tcmc+"%')";
	}

	bj_wntcmc_hxbm=request.getParameter("bj_wntcmc_hxbm");
	if (bj_wntcmc_hxbm!=null)
	{
		bj_wntcmc_hxbm=cf.GB2Uni(bj_wntcmc_hxbm);
		if (!(bj_wntcmc_hxbm.equals("")))	wheresql+=" and  (bj_wntcmc.hxbm='"+bj_wntcmc_hxbm+"')";
	}
	bj_wntcmc_bzmj=request.getParameter("bj_wntcmc_bzmj");
	if (bj_wntcmc_bzmj!=null)
	{
		bj_wntcmc_bzmj=bj_wntcmc_bzmj.trim();
		if (!(bj_wntcmc_bzmj.equals("")))	wheresql+=" and (bj_wntcmc.bzmj="+bj_wntcmc_bzmj+") ";
	}
	bj_wntcmc_tcjg=request.getParameter("bj_wntcmc_tcjg");
	if (bj_wntcmc_tcjg!=null)
	{
		bj_wntcmc_tcjg=bj_wntcmc_tcjg.trim();
		if (!(bj_wntcmc_tcjg.equals("")))	wheresql+=" and  (bj_wntcmc.tcjg="+bj_wntcmc_tcjg+") ";
	}
	bj_wntcmc_pmzjdj=request.getParameter("bj_wntcmc_pmzjdj");
	if (bj_wntcmc_pmzjdj!=null)
	{
		bj_wntcmc_pmzjdj=bj_wntcmc_pmzjdj.trim();
		if (!(bj_wntcmc_pmzjdj.equals("")))	wheresql+=" and  (bj_wntcmc.pmzjdj="+bj_wntcmc_pmzjdj+") ";
	}

	ls_sql="SELECT bj_wntcmc.dqbm,dm_dqbm.dqmc,bj_wntcmc.tcmc,bj_wntcmc.hxbm,hxmc,bj_wntcmc.bzmj,bj_wntcmc.tcjg,bj_wntcmc.pmzjdj,DECODE(bj_wntcmc.mjsfkzj,'1','不可增加','2','增加加价') mjsfkzj,DECODE(bj_wntcmc.zcsfxxz,'1','自动选择','2','人工选择') zcsfxxz,DECODE(bj_wntcmc.lx,'1','温暖套餐','2','静音套餐') lx  ";
	ls_sql+=" FROM dm_dqbm,bj_wntcmc,dm_hxbm  ";
    ls_sql+=" where bj_wntcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_wntcmc.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_wntcmc.dqbm,bj_wntcmc.hxbm,bj_wntcmc.tcmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_wntcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","hxmc","tcmc","bzmj","tcjg","pmzjdj","mjsfkzj","zcsfxxz","lx"};
	pageObj.setDisColName(disColName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","tcmc","hxbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewBj_wntczcmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tcmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">温暖套餐－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">地区</td>
	<td  width="13%">户型</td>
	<td  width="29%">套餐名称</td>
	<td  width="9%">标准面积</td>
	<td  width="9%">套餐价格</td>
	<td  width="9%">平米增加单价</td>
	<td  width="7%">面积是否可增加</td>
	<td  width="7%">主材是否需选择</td>
	<td  width="7%">类型</td>
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