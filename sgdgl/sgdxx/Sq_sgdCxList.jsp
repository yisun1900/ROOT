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
	String sq_sgd_sgd=null;
	String sq_sgd_sgdmc=null;

	String sq_sgd_sgdlx=null;
	String sq_sgd_cz=null;

	String sq_sgd_dh=null;
	String sq_sgd_dwcz=null;
	String sq_sgd_email=null;
	String sq_scfgxx_fgflbm=null;
	String sq_scysxx_ysbm=null;
	String sq_sgcqxx_cqbm=null;


	String grs=null;
	grs=request.getParameter("grs");
	if (grs!=null)
	{
		grs=grs.trim();
		if (!(grs.equals("")))	wheresql+="  and (sq_sgd.grs>="+grs+")";
	}
	grs=request.getParameter("grs2");
	if (grs!=null)
	{
		grs=grs.trim();
		if (!(grs.equals("")))	wheresql+="  and (sq_sgd.grs<="+grs+")";
	}
	String rzsj=null;
	rzsj=request.getParameter("rzsj");
	if (rzsj!=null)
	{
		rzsj=rzsj.trim();
		if (!(rzsj.equals("")))	wheresql+="  and (sq_sgd.rzsj>=TO_DATE('"+rzsj+"','YYYY/MM/DD'))";
	}
	rzsj=request.getParameter("rzsj2");
	if (rzsj!=null)
	{
		rzsj=rzsj.trim();
		if (!(rzsj.equals("")))	wheresql+="  and (sq_sgd.rzsj<=TO_DATE('"+rzsj+"','YYYY/MM/DD'))";
	}
	String lzsj=null;
	lzsj=request.getParameter("lzsj");
	if (lzsj!=null)
	{
		lzsj=lzsj.trim();
		if (!(lzsj.equals("")))	wheresql+="  and (sq_sgd.lzsj>=TO_DATE('"+lzsj+"','YYYY/MM/DD'))";
	}
	lzsj=request.getParameter("lzsj2");
	if (lzsj!=null)
	{
		lzsj=lzsj.trim();
		if (!(lzsj.equals("")))	wheresql+="  and (sq_sgd.lzsj<=TO_DATE('"+lzsj+"','YYYY/MM/DD'))";
	}


	String sfqldht=null;
	sfqldht=request.getParameter("sfqldht");
	if (sfqldht!=null)
	{
		if (!(sfqldht.equals("")))	wheresql+=" and  (sq_sgd.sfqldht='"+sfqldht+"')";
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_sgd.ssfgs='"+ssfgs+"')";
	}

	String cxbz=null;
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_sgd.cxbz='"+cxbz+"')";
	}

	String duihao=null;
	duihao=request.getParameter("duihao");
	if (duihao!=null)
	{
		if (!(duihao.equals("")))	wheresql+=" and  (sq_sgd.duihao='"+duihao+"')";
	}
	String sgdjbbm=null;
	sgdjbbm=request.getParameter("sgdjbbm");
	if (sgdjbbm!=null)
	{
		if (!(sgdjbbm.equals("")))	wheresql+=" and  (sq_sgd.sgdjbbm='"+sgdjbbm+"')";
	}

	
	sq_sgd_sgd=request.getParameter("sq_sgd_sgd");
	if (sq_sgd_sgd!=null)
	{
		sq_sgd_sgd=cf.GB2Uni(sq_sgd_sgd);
		if (!(sq_sgd_sgd.equals("")))	wheresql+=" and  (sq_sgd.sgd='"+sq_sgd_sgd+"')";
	}
	String sq_sgd_dqbm=null;
	sq_sgd_dqbm=request.getParameter("sq_sgd_dqbm");
	if (sq_sgd_dqbm!=null)
	{
		if (!(sq_sgd_dqbm.equals("")))	wheresql+=" and  (sq_sgd.dqbm='"+sq_sgd_dqbm+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc like '%"+sq_sgd_sgdmc+"%')";
	}

	sq_sgd_sgdlx=request.getParameter("sq_sgd_sgdlx");
	if (sq_sgd_sgdlx!=null)
	{
		sq_sgd_sgdlx=cf.GB2Uni(sq_sgd_sgdlx);
		if (!(sq_sgd_sgdlx.equals("")))	wheresql+=" and  (sq_sgd.sgdlx='"+sq_sgd_sgdlx+"')";
	}
	sq_sgd_cz=request.getParameter("sq_sgd_cz");
	if (sq_sgd_cz!=null)
	{
		sq_sgd_cz=cf.GB2Uni(sq_sgd_cz);
		if (!(sq_sgd_cz.equals("")))	wheresql+=" and  (sq_sgd.cz='"+sq_sgd_cz+"')";
	}

	sq_sgd_dh=request.getParameter("sq_sgd_dh");
	if (sq_sgd_dh!=null)
	{
		sq_sgd_dh=cf.GB2Uni(sq_sgd_dh);
		if (!(sq_sgd_dh.equals("")))	wheresql+=" and  (sq_sgd.dh like '%"+sq_sgd_dh+"%')";
	}
	sq_sgd_dwcz=request.getParameter("sq_sgd_dwcz");
	if (sq_sgd_dwcz!=null)
	{
		sq_sgd_dwcz=cf.GB2Uni(sq_sgd_dwcz);
		if (!(sq_sgd_dwcz.equals("")))	wheresql+=" and  (sq_sgd.dwcz='"+sq_sgd_dwcz+"')";
	}
	sq_sgd_email=request.getParameter("sq_sgd_email");
	if (sq_sgd_email!=null)
	{
		sq_sgd_email=cf.GB2Uni(sq_sgd_email);
		if (!(sq_sgd_email.equals("")))	wheresql+=" and  (sq_sgd.email='"+sq_sgd_email+"')";
	}

	String px=request.getParameter("px");


	ls_sql="SELECT sq_dwxx.dwmc ssfgs,sq_sgd.sgd,sgdmc,duihao,sgdjbmc,zbj,bzj,bzs,grs,jcf,DECODE(sfqldht,'N','<font color=\"#FF0000\">否</font>','Y','是'),DECODE(tdbz,'Y','<font color=\"#FF0000\">停单</font>','N','不停'),tdkssj,tdzzsj,rzsj,lzsj,DECODE(sq_sgd.cxbz,'Y','<font color=\"#FF0000\">撤销</font>','N','未撤销'),dh,kjdsm,sfzhm,jjlxr,lxrdh,jjlxrdz,hjszd,DECODE(sgdlx,'S0','非直属','S1','直属队') as sgdlx,dqmc";
	ls_sql+=" FROM sq_sgd,dm_dqbm,sq_sgdjbbm,sq_dwxx ";
    ls_sql+=" where sq_sgd.dqbm=dm_dqbm.dqbm(+) and sq_sgd.sgdjbbm=sq_sgdjbbm.sgdjbbm(+)";
    ls_sql+=" and sq_sgd.ssfgs=sq_dwxx.dwbh(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_sgd.dqbm,sq_sgd.ssfgs,sq_sgd.cxbz,"+px;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_sgdCxList.jsp","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sgd","sgdmc","dwfzr","dh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sgd"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//列参数对象加入Hash表
	spanColHash.put("ssfgs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	pageObj.printPageLink(280);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">所属分公司</td>
	<td  width="2%">工长编号</td>
	<td  width="3%">工长名称</td>
	<td  width="2%">队号</td>
	<td  width="3%">级别</td>
	<td  width="4%">质保金</td>
	<td  width="4%">保证金</td>
	<td  width="2%">班组数</td>
	<td  width="2%">工人数</td>
	<td  width="3%">基础分</td>
	<td  width="2%">劳动合同</td>
	<td  width="2%">停单标志</td>
	<td  width="4%">停单开始时间</td>
	<td  width="4%">停单终止时间</td>
	<td  width="4%">入职时间</td>
	<td  width="4%">离职时间</td>
	<td  width="3%">撤销标志</td>
	<td  width="6%">电话</td>
	<td  width="7%">派单说明</td>
	<td  width="6%">工长身份证号</td>
	<td  width="3%">紧急联系人</td>
	<td  width="6%">联系人电话</td>
	<td  width="8%">紧急联系人地址</td>
	<td  width="8%">户籍所在地</td>
	<td  width="2%">类型</td>
	<td  width="2%">所属地区</td>
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