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
	String jxc_hwmc_hwbh=null;
	String jxc_hwmc_hwmc=null;
	String jxc_hwmc_hjbh=null;
	String jxc_hwmc_ckbh=null;
	String jxc_hwmc_dqbm=null;
	jxc_hwmc_ckbh=request.getParameter("jxc_hwmc_ckbh");
	if (jxc_hwmc_ckbh!=null)
	{
		jxc_hwmc_ckbh=cf.GB2Uni(jxc_hwmc_ckbh);
		if (!(jxc_hwmc_ckbh.equals("")))	wheresql+=" and  (jxc_hjmc.ckbh='"+jxc_hwmc_ckbh+"')";
	}
	jxc_hwmc_dqbm=request.getParameter("jxc_hwmc_dqbm");
	if (jxc_hwmc_dqbm!=null)
	{
		jxc_hwmc_dqbm=cf.GB2Uni(jxc_hwmc_dqbm);
		if (!(jxc_hwmc_dqbm.equals("")))	wheresql+=" and  (jxc_ckmc.dqbm='"+jxc_hwmc_dqbm+"')";
	}

	jxc_hwmc_hwbh=request.getParameter("jxc_hwmc_hwbh");
	if (jxc_hwmc_hwbh!=null)
	{
		jxc_hwmc_hwbh=cf.GB2Uni(jxc_hwmc_hwbh);
		if (!(jxc_hwmc_hwbh.equals("")))	wheresql+=" and  (jxc_hwmc.hwbh='"+jxc_hwmc_hwbh+"')";
	}
	jxc_hwmc_hwmc=request.getParameter("jxc_hwmc_hwmc");
	if (jxc_hwmc_hwmc!=null)
	{
		jxc_hwmc_hwmc=cf.GB2Uni(jxc_hwmc_hwmc);
		if (!(jxc_hwmc_hwmc.equals("")))	wheresql+=" and  (jxc_hwmc.hwmc='"+jxc_hwmc_hwmc+"')";
	}
	jxc_hwmc_hjbh=request.getParameter("jxc_hwmc_hjbh");
	if (jxc_hwmc_hjbh!=null)
	{
		jxc_hwmc_hjbh=cf.GB2Uni(jxc_hwmc_hjbh);
		if (!(jxc_hwmc_hjbh.equals("")))	wheresql+=" and  (jxc_hwmc.hjbh='"+jxc_hwmc_hjbh+"')";
	}
	ls_sql="SELECT dm_dqbm.dqmc dqmc,jxc_ckmc.ckmc ckmc,jxc_hjmc.hjmc hjmc,jxc_hwmc.hwmc hwmc,hwbh  ";
	ls_sql+=" FROM jxc_hwmc,jxc_hjmc,jxc_ckmc,dm_dqbm  ";
    ls_sql+=" where jxc_hwmc.hjbh=jxc_hjmc.hjbh and jxc_hjmc.ckbh=jxc_ckmc.ckbh and jxc_ckmc.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
	ls_sql+=" order by dqmc,ckmc,hjmc,hwmc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_hwmcCxList.jsp","SelectCxJxc_hwmc.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hwbh","jxc_hwmc_hwmc","jxc_hwmc_hjbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hwbh"};
	pageObj.setKey(keyName);
	//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("ckmc","1");//列参数对象加入Hash表
	spanColHash.put("hjmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">所属地区</td>
	<td  width="20%">所属仓库</td>
	<td  width="20%">所属货架</td>
	<td  width="20%">货位名称</td>
	<td  width="20%">货位编号</td>
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