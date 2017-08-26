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
	String tckb_zctcmc_tcbm=null;
	String tckb_zctcmc_dqbm=null;
	String tckb_zctcmc_tcmc=null;
	String tckb_zctcmc_yj=null;
	String tckb_zctcmc_tcj=null;

	String bjjbbm=null;
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=bjjbbm.trim();
		if (!(bjjbbm.equals("")))	wheresql+=" and (tckb_zctcmc.bjjbbm="+bjjbbm+") ";
	}

	tckb_zctcmc_tcbm=request.getParameter("tckb_zctcmc_tcbm");
	if (tckb_zctcmc_tcbm!=null)
	{
		tckb_zctcmc_tcbm=tckb_zctcmc_tcbm.trim();
		if (!(tckb_zctcmc_tcbm.equals("")))	wheresql+=" and (tckb_zctcmc.tcbm="+tckb_zctcmc_tcbm+") ";
	}
	tckb_zctcmc_dqbm=request.getParameter("tckb_zctcmc_dqbm");
	if (tckb_zctcmc_dqbm!=null)
	{
		tckb_zctcmc_dqbm=cf.GB2Uni(tckb_zctcmc_dqbm);
		if (!(tckb_zctcmc_dqbm.equals("")))	wheresql+=" and  (tckb_zctcmc.dqbm='"+tckb_zctcmc_dqbm+"')";
	}
	tckb_zctcmc_tcmc=request.getParameter("tckb_zctcmc_tcmc");
	if (tckb_zctcmc_tcmc!=null)
	{
		tckb_zctcmc_tcmc=cf.GB2Uni(tckb_zctcmc_tcmc);
		if (!(tckb_zctcmc_tcmc.equals("")))	wheresql+=" and  (tckb_zctcmc.tcmc like '%"+tckb_zctcmc_tcmc+"%')";
	}
	tckb_zctcmc_yj=request.getParameter("tckb_zctcmc_yj");
	if (tckb_zctcmc_yj!=null)
	{
		tckb_zctcmc_yj=tckb_zctcmc_yj.trim();
		if (!(tckb_zctcmc_yj.equals("")))	wheresql+=" and  (tckb_zctcmc.yj="+tckb_zctcmc_yj+") ";
	}
	tckb_zctcmc_tcj=request.getParameter("tckb_zctcmc_tcj");
	if (tckb_zctcmc_tcj!=null)
	{
		tckb_zctcmc_tcj=tckb_zctcmc_tcj.trim();
		if (!(tckb_zctcmc_tcj.equals("")))	wheresql+=" and  (tckb_zctcmc.tcj="+tckb_zctcmc_tcj+") ";
	}

	ls_sql="SELECT tckb_zctcmc.tcbm,dm_dqbm.dqmc,bjjbmc,tckb_zctcmc.tcmc,tckb_zctcmc.yj,tckb_zctcmc.tcj,tckb_zctcmc.bz  ";
	ls_sql+=" FROM dm_dqbm,tckb_zctcmc,bdm_bjjbbm  ";
    ls_sql+=" where tckb_zctcmc.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_zctcmc.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_zctcmc.dqbm,tckb_zctcmc.bjjbbm,tckb_zctcmc.tcmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckb_zctcmcCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tcbm","dm_dqbm_dqmc","tckb_zctcmc_tcmc","tckb_zctcmc_yj","tckb_zctcmc_tcj","tckb_zctcmc_bz"};
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
	<td  width="8%">包编码</td>
	<td  width="8%">地区</td>
	<td  width="8%">报价级别</td>
	<td  width="24%">包名称</td>
	<td  width="11%">原价</td>
	<td  width="11%">实销价</td>
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