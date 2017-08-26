<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String fgsbh=null;
	String sftzk=null;
	String sfyfq=null;
	String sfydjfx=null;
	String sfydyq=null;
	String sfydxpzc=null;
	String sfydgzc=null;
	String sfyzcfk=null;
	String sfykhpc=null;
	String sfyjsgcyh=null;
	String sfyyqf=null;
	String sfxmbm1=null;
	String sfxmbm2=null;
	String sfxmbm3=null;
	String sfyqtx1=null;
	String qtx1mc=null;
	String sfyqtx2=null;
	String qtx2mc=null;
	String sfyqtx3=null;
	String qtx3mc=null;
	String sfxsp=null;
	String sfxsq=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (dm_khjscsb.fgsbh='"+fgsbh+"')";
	}
	sftzk=request.getParameter("sftzk");
	if (sftzk!=null)
	{
		sftzk=cf.GB2Uni(sftzk);
		if (!(sftzk.equals("")))	wheresql+=" and  (dm_khjscsb.sftzk='"+sftzk+"')";
	}
	sfyfq=request.getParameter("sfyfq");
	if (sfyfq!=null)
	{
		sfyfq=cf.GB2Uni(sfyfq);
		if (!(sfyfq.equals("")))	wheresql+=" and  (dm_khjscsb.sfyfq='"+sfyfq+"')";
	}
	sfydjfx=request.getParameter("sfydjfx");
	if (sfydjfx!=null)
	{
		sfydjfx=cf.GB2Uni(sfydjfx);
		if (!(sfydjfx.equals("")))	wheresql+=" and  (dm_khjscsb.sfydjfx='"+sfydjfx+"')";
	}
	sfydyq=request.getParameter("sfydyq");
	if (sfydyq!=null)
	{
		sfydyq=cf.GB2Uni(sfydyq);
		if (!(sfydyq.equals("")))	wheresql+=" and  (dm_khjscsb.sfydyq='"+sfydyq+"')";
	}
	sfydxpzc=request.getParameter("sfydxpzc");
	if (sfydxpzc!=null)
	{
		sfydxpzc=cf.GB2Uni(sfydxpzc);
		if (!(sfydxpzc.equals("")))	wheresql+=" and  (dm_khjscsb.sfydxpzc='"+sfydxpzc+"')";
	}
	sfydgzc=request.getParameter("sfydgzc");
	if (sfydgzc!=null)
	{
		sfydgzc=cf.GB2Uni(sfydgzc);
		if (!(sfydgzc.equals("")))	wheresql+=" and  (dm_khjscsb.sfydgzc='"+sfydgzc+"')";
	}
	sfyzcfk=request.getParameter("sfyzcfk");
	if (sfyzcfk!=null)
	{
		sfyzcfk=cf.GB2Uni(sfyzcfk);
		if (!(sfyzcfk.equals("")))	wheresql+=" and  (dm_khjscsb.sfyzcfk='"+sfyzcfk+"')";
	}
	sfykhpc=request.getParameter("sfykhpc");
	if (sfykhpc!=null)
	{
		sfykhpc=cf.GB2Uni(sfykhpc);
		if (!(sfykhpc.equals("")))	wheresql+=" and  (dm_khjscsb.sfykhpc='"+sfykhpc+"')";
	}
	sfyjsgcyh=request.getParameter("sfyjsgcyh");
	if (sfyjsgcyh!=null)
	{
		sfyjsgcyh=cf.GB2Uni(sfyjsgcyh);
		if (!(sfyjsgcyh.equals("")))	wheresql+=" and  (dm_khjscsb.sfyjsgcyh='"+sfyjsgcyh+"')";
	}
	sfyyqf=request.getParameter("sfyyqf");
	if (sfyyqf!=null)
	{
		sfyyqf=cf.GB2Uni(sfyyqf);
		if (!(sfyyqf.equals("")))	wheresql+=" and  (dm_khjscsb.sfyyqf='"+sfyyqf+"')";
	}
	sfxmbm1=request.getParameter("sfxmbm1");
	if (sfxmbm1!=null)
	{
		sfxmbm1=cf.GB2Uni(sfxmbm1);
		if (!(sfxmbm1.equals("")))	wheresql+=" and  (dm_khjscsb.sfxmbm1='"+sfxmbm1+"')";
	}
	sfxmbm2=request.getParameter("sfxmbm2");
	if (sfxmbm2!=null)
	{
		sfxmbm2=cf.GB2Uni(sfxmbm2);
		if (!(sfxmbm2.equals("")))	wheresql+=" and  (dm_khjscsb.sfxmbm2='"+sfxmbm2+"')";
	}
	sfxmbm3=request.getParameter("sfxmbm3");
	if (sfxmbm3!=null)
	{
		sfxmbm3=cf.GB2Uni(sfxmbm3);
		if (!(sfxmbm3.equals("")))	wheresql+=" and  (dm_khjscsb.sfxmbm3='"+sfxmbm3+"')";
	}
	sfyqtx1=request.getParameter("sfyqtx1");
	if (sfyqtx1!=null)
	{
		sfyqtx1=cf.GB2Uni(sfyqtx1);
		if (!(sfyqtx1.equals("")))	wheresql+=" and  (dm_khjscsb.sfyqtx1='"+sfyqtx1+"')";
	}
	qtx1mc=request.getParameter("qtx1mc");
	if (qtx1mc!=null)
	{
		qtx1mc=cf.GB2Uni(qtx1mc);
		if (!(qtx1mc.equals("")))	wheresql+=" and  (dm_khjscsb.qtx1mc='"+qtx1mc+"')";
	}
	sfyqtx2=request.getParameter("sfyqtx2");
	if (sfyqtx2!=null)
	{
		sfyqtx2=cf.GB2Uni(sfyqtx2);
		if (!(sfyqtx2.equals("")))	wheresql+=" and  (dm_khjscsb.sfyqtx2='"+sfyqtx2+"')";
	}
	qtx2mc=request.getParameter("qtx2mc");
	if (qtx2mc!=null)
	{
		qtx2mc=cf.GB2Uni(qtx2mc);
		if (!(qtx2mc.equals("")))	wheresql+=" and  (dm_khjscsb.qtx2mc='"+qtx2mc+"')";
	}
	sfyqtx3=request.getParameter("sfyqtx3");
	if (sfyqtx3!=null)
	{
		sfyqtx3=cf.GB2Uni(sfyqtx3);
		if (!(sfyqtx3.equals("")))	wheresql+=" and  (dm_khjscsb.sfyqtx3='"+sfyqtx3+"')";
	}
	qtx3mc=request.getParameter("qtx3mc");
	if (qtx3mc!=null)
	{
		qtx3mc=cf.GB2Uni(qtx3mc);
		if (!(qtx3mc.equals("")))	wheresql+=" and  (dm_khjscsb.qtx3mc='"+qtx3mc+"')";
	}
	sfxsp=request.getParameter("sfxsp");
	if (sfxsp!=null)
	{
		sfxsp=cf.GB2Uni(sfxsp);
		if (!(sfxsp.equals("")))	wheresql+=" and  (dm_khjscsb.sfxsp='"+sfxsp+"')";
	}
	sfxsq=request.getParameter("sfxsq");
	if (sfxsq!=null)
	{
		sfxsq=cf.GB2Uni(sfxsq);
		if (!(sfxsq.equals("")))	wheresql+=" and  (dm_khjscsb.sfxsq='"+sfxsq+"')";
	}
	ls_sql="SELECT dm_khjscsb.fgsbh,sq_dwxx.dwmc, DECODE(dm_khjscsb.sftzk,'1','是','3','否'), DECODE(dm_khjscsb.sfyfq,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfydjfx,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfydyq,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfydxpzc,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfydgzc,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfyzcfk,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfykhpc,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfyjsgcyh,'1','手工录入','2','自动获取','3','无'), DECODE(dm_khjscsb.sfyyqf,'1','手工录入','2','自动获取','3','无'),a.sfxmmc sfxmbm1,b.sfxmmc sfxmbm2,c.sfxmmc sfxmbm3, DECODE(dm_khjscsb.sfyqtx1,'1','是','3','否'),dm_khjscsb.qtx1mc, DECODE(dm_khjscsb.sfyqtx2,'1','是','3','否'),dm_khjscsb.qtx2mc, DECODE(dm_khjscsb.sfyqtx3,'1','是','3','否'),dm_khjscsb.qtx3mc, DECODE(dm_khjscsb.sfxsp,'1','是','3','否'), DECODE(dm_khjscsb.sfxsq,'1','是','3','否')  ";
	ls_sql+=" FROM dm_khjscsb,sq_dwxx,bdm_sfxmbm a,bdm_sfxmbm b,bdm_sfxmbm c  ";
    ls_sql+=" where dm_khjscsb.fgsbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and dm_khjscsb.sfxmbm1=a.sfxmbm(+) and dm_khjscsb.dqbm=a.dqbm(+)";
    ls_sql+=" and dm_khjscsb.sfxmbm2=b.sfxmbm(+) and dm_khjscsb.dqbm=b.dqbm(+)";
    ls_sql+=" and dm_khjscsb.sfxmbm3=c.sfxmbm(+) and dm_khjscsb.dqbm=c.dqbm(+)";
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and dm_khjscsb.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and dm_khjscsb.fgsbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by dm_khjscsb.fgsbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Dm_khjscsbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"fgsbh","sq_dwxx_dwmc","sftzk","sfyfq","sfydjfx","sfydyq","sfydxpzc","sfydgzc","sfyzcfk","sfykhpc","sfyjsgcyh","sfyyqf","sfxmbm1","sfxmbm2","sfxmbm3","sfyqtx1","qtx1mc","sfyqtx2","qtx2mc","sfyqtx3","qtx3mc","sfxsp","sfxsq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fgsbh"};
	pageObj.setKey(keyName);

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
  <B><font size="3">客户结算参数表－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">分公司</td>
	<td  width="6%">分公司</td>
	<td  width="3%">允许结算调折扣</td>
	<td  width="4%">是否有返券</td>
	<td  width="4%">是否有订金折现</td>
	<td  width="4%">是否有抵用券</td>
	<td  width="4%">是否有代销品主材</td>
	<td  width="4%">是否有代购主材</td>
	<td  width="4%">是否有主材返款</td>
	<td  width="4%">是否有客户赔偿款</td>
	<td  width="4%">是否有结算工程优惠</td>
	<td  width="4%">是否有延期费</td>
	<td  width="6%">其它收费项目1</td>
	<td  width="6%">其它收费项目2</td>
	<td  width="6%">其它收费项目3</td>
	<td  width="3%">是否有其它项1</td>
	<td  width="7%">其它项1名称</td>
	<td  width="3%">是否有其它项2</td>
	<td  width="6%">其它项2名称</td>
	<td  width="3%">是否有其它项3</td>
	<td  width="6%">其它项3名称</td>
	<td  width="3%">是否需审批</td>
	<td  width="63%">是否需结算授权</td>
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