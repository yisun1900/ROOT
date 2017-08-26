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
	String tckb_tcjgb_dqbm=null;
	String tckb_tcjgb_bjjbbm=null;
	String tckb_tcjgb_hxbm=null;
	String tckb_tcjgb_tcmc=null;

	String bjbbh=null;
	bjbbh=request.getParameter("bjbbh");
	if (bjbbh!=null)
	{
		bjbbh=cf.GB2Uni(bjbbh);
		if (!(bjbbh.equals("")))	wheresql+=" and  (tckb_tcjgb.bjbbh='"+bjbbh+"')";
	}

	tckb_tcjgb_dqbm=request.getParameter("tckb_tcjgb_dqbm");
	if (tckb_tcjgb_dqbm!=null)
	{
		tckb_tcjgb_dqbm=cf.GB2Uni(tckb_tcjgb_dqbm);
		if (!(tckb_tcjgb_dqbm.equals("")))	wheresql+=" and  (tckb_tcjgb.dqbm='"+tckb_tcjgb_dqbm+"')";
	}
	tckb_tcjgb_bjjbbm=request.getParameter("tckb_tcjgb_bjjbbm");
	if (tckb_tcjgb_bjjbbm!=null)
	{
		tckb_tcjgb_bjjbbm=cf.GB2Uni(tckb_tcjgb_bjjbbm);
		if (!(tckb_tcjgb_bjjbbm.equals("")))	wheresql+=" and  (tckb_tcjgb.bjjbbm='"+tckb_tcjgb_bjjbbm+"')";
	}
	tckb_tcjgb_hxbm=request.getParameter("tckb_tcjgb_hxbm");
	if (tckb_tcjgb_hxbm!=null)
	{
		tckb_tcjgb_hxbm=cf.GB2Uni(tckb_tcjgb_hxbm);
		if (!(tckb_tcjgb_hxbm.equals("")))	wheresql+=" and  (tckb_tcjgb.hxbm='"+tckb_tcjgb_hxbm+"')";
	}
	tckb_tcjgb_tcmc=request.getParameter("tckb_tcjgb_tcmc");
	if (tckb_tcjgb_tcmc!=null)
	{
		tckb_tcjgb_tcmc=cf.GB2Uni(tckb_tcjgb_tcmc);
		if (!(tckb_tcjgb_tcmc.equals("")))	wheresql+=" and  (tckb_tcjgb.tcmc='"+tckb_tcjgb_tcmc+"')";
	}
	ls_sql="SELECT tckb_tcjgb.dqbm,dm_dqbm.dqmc,bjbbh,tckb_tcjgb.bjjbbm,bjjbmc,tckb_tcjgb.hxbm,hxmc,tckb_tcjgb.tcmc,tckb_tcjgb.fwmj,tckb_tcjgb.tcjg,tckb_tcjgb.pmzjdj,tckb_tcjgb.cpjg,tckb_tcjgb.sgjg,tckb_tcjgb.jjjg  ";
	ls_sql+=" FROM tckb_tcjgb,dm_dqbm,bdm_bjjbbm,dm_hxbm  ";
    ls_sql+=" where tckb_tcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tckb_tcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckb_tcjgb.hxbm=dm_hxbm.hxbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tckb_tcjgb.dqbm,bjbbh,tckb_tcjgb.bjjbbm,tckb_tcjgb.hxbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tckb_tcjgbList.jsp","","","EditTckb_tcjgb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"dqmc","bjbbh","bjjbmc","hxmc","tcmc","fwmj","tcjg","cpjg","sgjg","jjjg","pmzjdj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"dqbm","bjbbh","bjjbbm","hxbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tckb_tcjgbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
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
	String chooseitem=cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tckb_tcjgb where "+chooseitem;
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
  <B><font size="3">套餐总价表－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="8%">地区</td>
	<td  width="11%">报价版本号</td>
	<td  width="8%">报价级别</td>
	<td  width="10%">户型</td>
	<td  width="12%">套餐名称</td>
	<td  width="7%">起价面积</td>
	<td  width="8%">套餐总价</td>
	<td  width="7%">产品起包价</td>
	<td  width="7%">施工起包价</td>
	<td  width="7%">家具起包价</td>
	<td  width="7%">平米增加单价</td>
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