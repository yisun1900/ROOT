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
	String cpbm=null;
	String cpmc=null;
	String dqbm=null;
	String jgwzbm=null;
	String xh=null;
	String gg=null;
	String ppmc=null;
	String gysmc=null;
	String lrr=null;
	String lrsj=null;

	String tcmc=null;
	tcmc=request.getParameter("tcmc");
	if (tcmc!=null)
	{
		tcmc=cf.GB2Uni(tcmc);
		if (!(tcmc.equals("")))	wheresql+=" and  (tcmc like '%"+tcmc+"%')";
	}

	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (cpbm='"+cpbm+"')";
	}
	cpmc=request.getParameter("cpmc");
	if (cpmc!=null)
	{
		cpmc=cf.GB2Uni(cpmc);
		if (!(cpmc.equals("")))	wheresql+=" and  (cpmc like '%"+cpmc+"%')";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (bj_cltczcmx.dqbm='"+dqbm+"')";
	}
	jgwzbm=request.getParameter("jgwzbm");
	if (jgwzbm!=null)
	{
		jgwzbm=cf.GB2Uni(jgwzbm);
		if (!(jgwzbm.equals("")))	wheresql+=" and  (jgwzbm='"+jgwzbm+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (xh='"+xh+"')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (gg='"+gg+"')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (ppmc='"+ppmc+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (gysmc='"+gysmc+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tcmc,jgwzbm,cpbm,cpmc,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,lrr,lrsj,bz,dqmc  ";
	ls_sql+=" FROM bj_cltczcmx,dm_dqbm  ";
    ls_sql+=" where bj_cltczcmx.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by bj_cltczcmx.dqbm,tcmc,jgwzbm,cpmc,xh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_cltczcmxList.jsp","","","EditBj_cltczcmx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cpbm","cpmc","dqbm","jgwzbm","xh","gg","ppmc","gysmc","jldw","ydj","tcdj","sjzj","jsj","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Bj_cltczcmxList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] cpbm = request.getParameterValues("cpbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(cpbm,"cpbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from bj_cltczcmx where "+chooseitem;
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">套餐名称</td>
	<td  width="4%">房间位置</td>
	<td  width="8%">产品名称</td>
	<td  width="6%">产品编码</td>
	<td  width="8%">型号</td>
	<td  width="8%">规格</td>
	<td  width="5%">品牌</td>
	<td  width="11%">供应商名称</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">原单价</td>
	<td  width="4%">套餐单价</td>
	<td  width="4%">升级折价</td>
	<td  width="4%">结算价</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="9%">备注</td>
	<td  width="3%">地区</td>
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