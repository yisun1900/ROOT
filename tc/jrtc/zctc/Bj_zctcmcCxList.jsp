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
	String bj_zctcmc_tcbm=null;
	String bj_zctcmc_dqbm=null;
	String bj_zctcmc_tcmc=null;
	String bj_zctcmc_yj=null;
	String bj_zctcmc_tcj=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		lx=lx.trim();
		if (!(lx.equals("")))	wheresql+=" and (bj_zctcmc.lx="+lx+") ";
	}

	bj_zctcmc_tcbm=request.getParameter("bj_zctcmc_tcbm");
	if (bj_zctcmc_tcbm!=null)
	{
		bj_zctcmc_tcbm=bj_zctcmc_tcbm.trim();
		if (!(bj_zctcmc_tcbm.equals("")))	wheresql+=" and (bj_zctcmc.tcbm="+bj_zctcmc_tcbm+") ";
	}
	bj_zctcmc_dqbm=request.getParameter("bj_zctcmc_dqbm");
	if (bj_zctcmc_dqbm!=null)
	{
		bj_zctcmc_dqbm=cf.GB2Uni(bj_zctcmc_dqbm);
		if (!(bj_zctcmc_dqbm.equals("")))	wheresql+=" and  (bj_zctcmc.dqbm='"+bj_zctcmc_dqbm+"')";
	}
	bj_zctcmc_tcmc=request.getParameter("bj_zctcmc_tcmc");
	if (bj_zctcmc_tcmc!=null)
	{
		bj_zctcmc_tcmc=cf.GB2Uni(bj_zctcmc_tcmc);
		if (!(bj_zctcmc_tcmc.equals("")))	wheresql+=" and  (bj_zctcmc.tcmc like '%"+bj_zctcmc_tcmc+"%')";
	}
	bj_zctcmc_yj=request.getParameter("bj_zctcmc_yj");
	if (bj_zctcmc_yj!=null)
	{
		bj_zctcmc_yj=bj_zctcmc_yj.trim();
		if (!(bj_zctcmc_yj.equals("")))	wheresql+=" and  (bj_zctcmc.yj="+bj_zctcmc_yj+") ";
	}
	bj_zctcmc_tcj=request.getParameter("bj_zctcmc_tcj");
	if (bj_zctcmc_tcj!=null)
	{
		bj_zctcmc_tcj=bj_zctcmc_tcj.trim();
		if (!(bj_zctcmc_tcj.equals("")))	wheresql+=" and  (bj_zctcmc.tcj="+bj_zctcmc_tcj+") ";
	}

	ls_sql="SELECT bj_zctcmc.tcbm,dm_dqbm.dqmc,DECODE(bj_zctcmc.lx,'1','家具套餐','2','健康计划'),bj_zctcmc.tcmc,bj_zctcmc.yj,bj_zctcmc.tcj,bj_zctcmc.bz  ";
	ls_sql+=" FROM dm_dqbm,bj_zctcmc  ";
    ls_sql+=" where bj_zctcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_zctcmc.dqbm,bj_zctcmc.tcmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_zctcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tcbm","dm_dqbm_dqmc","bj_zctcmc_tcmc","bj_zctcmc_yj","bj_zctcmc_tcj","bj_zctcmc_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tcbm"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"tcbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewBj_zctcmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tcbm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">套餐编码</td>
	<td  width="8%">地区</td>
	<td  width="8%">类型</td>
	<td  width="24%">套餐名称</td>
	<td  width="11%">原价</td>
	<td  width="11%">套餐价</td>
	<td  width="38%">备注</td>
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