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
	String xh=null;
	String ygbh=null;
	String yhmc=null;
	String bianhao=null;
	String sfzh=null;
	String xzzwbm=null;
	String lzrq=null;
	String lzyy=null;
	String dwbh=null;
	String ssfgs=null;
	String lrr=null;
	String lrsj=null;

	String lzlx=null;
	lzlx=request.getParameter("lzlx");
	if (lzlx!=null)
	{
		lzlx=cf.GB2Uni(lzlx);
		if (!(lzlx.equals("")))	wheresql+=" and  (rs_yhlzjl.lzlx='"+lzlx+"')";
	}

	String lzyyflbm=null;
	lzyyflbm=request.getParameter("lzyyflbm");
	if (lzyyflbm!=null)
	{
		lzyyflbm=cf.GB2Uni(lzyyflbm);
		if (!(lzyyflbm.equals("")))	wheresql+=" and  (rs_yhlzjl.lzyyflbm='"+lzyyflbm+"')";
	}
	String czsqxh=null;
	czsqxh=request.getParameter("czsqxh");
	if (czsqxh!=null)
	{
		czsqxh=cf.GB2Uni(czsqxh);
		if (!(czsqxh.equals("")))	wheresql+=" and  (rs_yhlzjl.czsqxh='"+czsqxh+"')";
	}

	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=xh.trim();
		if (!(xh.equals("")))	wheresql+=" and (rs_yhlzjl.xh="+xh+") ";
	}
	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		ygbh=ygbh.trim();
		if (!(ygbh.equals("")))	wheresql+=" and (rs_yhlzjl.ygbh="+ygbh+") ";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (rs_yhlzjl.yhmc like '%"+yhmc+"%')";
	}
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (rs_yhlzjl.bianhao='"+bianhao+"')";
	}
	sfzh=request.getParameter("sfzh");
	if (sfzh!=null)
	{
		sfzh=cf.GB2Uni(sfzh);
		if (!(sfzh.equals("")))	wheresql+=" and  (rs_yhlzjl.sfzh='"+sfzh+"')";
	}
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (rs_yhlzjl.xzzwbm='"+xzzwbm+"')";
	}
	lzrq=request.getParameter("lzrq");
	if (lzrq!=null)
	{
		lzrq=lzrq.trim();
		if (!(lzrq.equals("")))	wheresql+="  and (rs_yhlzjl.lzrq>=TO_DATE('"+lzrq+"','YYYY/MM/DD'))";
	}
	lzrq=request.getParameter("lzrq2");
	if (lzrq!=null)
	{
		lzrq=lzrq.trim();
		if (!(lzrq.equals("")))	wheresql+="  and (rs_yhlzjl.lzrq<=TO_DATE('"+lzrq+"','YYYY/MM/DD'))";
	}
	lzyy=request.getParameter("lzyy");
	if (lzyy!=null)
	{
		lzyy=cf.GB2Uni(lzyy);
		if (!(lzyy.equals("")))	wheresql+=" and  (rs_yhlzjl.lzyy like '%"+lzyy+"%')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_yhlzjl.dwbh='"+dwbh+"')";
	}

	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (rs_yhlzjl.ssfgs='"+ssfgs+"')";

	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (rs_yhlzjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (rs_yhlzjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT DECODE(lzlx,'S','辞职','T','辞退') lzlx,xh,rs_yhlzjl.czsqxh sqxh,ygbh,yhmc,bianhao,sfzh,xzzwbm,lzrq,lzyyflmc,lzyy,dwmc,rs_yhlzjl.lrr,rs_yhlzjl.lrsj  ";
	ls_sql+=" FROM rs_yhlzjl,sq_dwxx,dm_lzyyflbm  ";
    ls_sql+=" where rs_yhlzjl.dwbh=sq_dwxx.dwbh and rs_yhlzjl.lzyyflbm=dm_lzyyflbm.lzyyflbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by rs_yhlzjl.ssfgs,rs_yhlzjl.xh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yhlzjlCxList.jsp","SelectCxRs_yhlzjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ygbh","yhmc","bianhao","sfzh","xzzwbm","lzrq","lzyy","dwbh","ssfgs","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/czlz/czsq/ViewRs_czsq.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ygbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("yhmc",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

/*
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
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">离职类型</td>
	<td  width="4%">序号</td>
	<td  width="6%">辞职申请序号</td>
	<td  width="5%">员工序号</td>
	<td  width="5%">员工名称</td>
	<td  width="5%">工号</td>
	<td  width="8%">身份证号</td>
	<td  width="6%">行政职务</td>
	<td  width="6%">离职日期</td>
	<td  width="8%">离职原因分类</td>
	<td  width="21%">离职原因</td>
	<td  width="9%">所属单位</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
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