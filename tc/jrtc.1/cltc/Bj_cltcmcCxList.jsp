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
	String bj_cltcmc_dqbm=null;
	String tcmc=null;
	String bj_cltcmc_hxbm=null;
	String bj_cltcmc_tcjg=null;

	String zcsfxxz=null;
	zcsfxxz=request.getParameter("zcsfxxz");
	if (zcsfxxz!=null)
	{
		zcsfxxz=cf.GB2Uni(zcsfxxz);
		if (!(zcsfxxz.equals("")))	wheresql+=" and  (bj_cltcmc.zcsfxxz='"+zcsfxxz+"')";
	}
	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=cf.GB2Uni(lx);
		if (!(lx.equals("")))	wheresql+=" and  (bj_cltcmc.lx='"+lx+"')";
	}

	bj_cltcmc_dqbm=request.getParameter("bj_cltcmc_dqbm");
	if (bj_cltcmc_dqbm!=null)
	{
		bj_cltcmc_dqbm=cf.GB2Uni(bj_cltcmc_dqbm);
		if (!(bj_cltcmc_dqbm.equals("")))	wheresql+=" and  (bj_cltcmc.dqbm='"+bj_cltcmc_dqbm+"')";
	}

	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (bj_cltcmc.tcmc like '%"+tcmc+"%')";
	}

	bj_cltcmc_hxbm=request.getParameter("bj_cltcmc_hxbm");
	if (bj_cltcmc_hxbm!=null)
	{
		bj_cltcmc_hxbm=cf.GB2Uni(bj_cltcmc_hxbm);
		if (!(bj_cltcmc_hxbm.equals("")))	wheresql+=" and  (bj_cltcmc.hxbm='"+bj_cltcmc_hxbm+"')";
	}
	bj_cltcmc_tcjg=request.getParameter("bj_cltcmc_tcjg");
	if (bj_cltcmc_tcjg!=null)
	{
		bj_cltcmc_tcjg=bj_cltcmc_tcjg.trim();
		if (!(bj_cltcmc_tcjg.equals("")))	wheresql+=" and  (bj_cltcmc.tcjg="+bj_cltcmc_tcjg+") ";
	}

	ls_sql="SELECT bj_cltcmc.dqbm,dm_dqbm.dqmc,bj_cltcmc.tcmc,bj_cltcmc.hxbm,hxmc,bj_cltcmc.tcjg,DECODE(bj_cltcmc.zcsfxxz,'1','自动选择','2','人工选择') zcsfxxz,DECODE(bj_cltcmc.lx,'1','窗帘套餐') lx  ";
	ls_sql+=" FROM dm_dqbm,bj_cltcmc,dm_hxbm  ";
    ls_sql+=" where bj_cltcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and bj_cltcmc.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_cltcmc.dqbm,bj_cltcmc.hxbm,bj_cltcmc.tcmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_cltcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","hxmc","tcmc","tcjg","zcsfxxz","lx"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","tcmc","hxbm"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dqbm","tcmc","hxbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewBj_cltczcmx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">窗帘套餐－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">地区</td>
	<td  width="13%">户型</td>
	<td  width="21%">套餐名称</td>
	<td  width="9%">套餐价格</td>
	<td  width="9%">主材是否需选择</td>
	<td  width="9%">类型</td>
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