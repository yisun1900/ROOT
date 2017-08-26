<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>



<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	

	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}

	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String zxdjbm=null;
	zxdjbm=request.getParameter("zxdjbm");
	if (zxdjbm!=null)
	{
		if (!(zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+zxdjbm+"')";
	}
	String lrr=null;
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+lrr+"')";
	}

	String mxxlrsj=null;
	mxxlrsj=request.getParameter("mxxlrsj");
	if (mxxlrsj!=null)
	{
		mxxlrsj=mxxlrsj.trim();
		if (!(mxxlrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj>=TO_DATE('"+mxxlrsj+"','YYYY-MM-DD'))";
	}
	mxxlrsj=request.getParameter("mxxlrsj2");
	if (mxxlrsj!=null)
	{
		mxxlrsj=mxxlrsj.trim();
		if (!(mxxlrsj.equals("")))	wheresql+="  and (crm_scbkhxx.lrsj<=TO_DATE('"+mxxlrsj+"','YYYY-MM-DD'))";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}


	String mxxts=null;
	mxxts=request.getParameter("mxxts");
	if (mxxts!=null)
	{
		mxxts=mxxts.trim();
		if (!(mxxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)>="+mxxts+")";
	}
	mxxts=request.getParameter("mxxts2");
	if (mxxts!=null)
	{
		mxxts=mxxts.trim();
		if (!(mxxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0)<="+mxxts+")";
	}

	String zxts=null;
	zxts=request.getParameter("zxts");
	if (zxts!=null)
	{
		zxts=zxts.trim();
		if (!(zxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)>="+zxts+")";
	}
	zxts=request.getParameter("zxts2");
	if (zxts!=null)
	{
		zxts=zxts.trim();
		if (!(zxts.equals("")))	wheresql+="  and (round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0)<="+zxts+")";
	}




	String myxssl=null;

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	myxssl=request.getParameter("myxssl");



	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.lrr";
	ls_sql+=" ,crm_scbkhxx.lrsj,round(crm_khxx.qyrq-crm_scbkhxx.lrsj,0) mxxts,crm_zxkhxx.lrsj zxlrsj,round(crm_khxx.qyrq-crm_zxkhxx.lrsj,0) zxts,crm_khxx.qyrq ";
	ls_sql+=" ,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') ";
	ls_sql+=" ,b.dwmc as zxdm,a.dwmc zxdjbm,crm_zxkhxx.khjl";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,crm_khxx,crm_scbkhxx";
	ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_zxkhxx.scbkhbh=crm_scbkhxx.scbkhbh(+) ";
	ls_sql+=" and crm_khxx.zt='2' ";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
	ls_sql+=" order by mxxts,zxts";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxkhxxCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">咨询客户--查询</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">业务员</td>
	<td  width="5%">咨询客户录入人</td>

	<td  width="7%">毛信息录入时间</td>
	<td  width="5%">毛信息录入签单天数</td>
	<td  width="7%">咨询客户录入时间</td>
	<td  width="5%">咨询客户录入签单天数</td>
	<td  width="7%">签约日期</td>
	<td  width="8%">咨询状态</td>
	<td  width="8%">咨询店面</td>
	<td  width="8%">咨询客户录入部门</td>
	<td  width="4%">客户经理</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>