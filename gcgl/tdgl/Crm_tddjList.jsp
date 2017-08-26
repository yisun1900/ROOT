<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
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











	String crm_tddj_tdxh=null;
	String crm_tddj_tdyybm=null;
	String crm_tddj_tdyysm=null;
	String crm_tddj_lrr=null;
	String crm_tddj_lrsj=null;
	String tdsj=null;

	crm_tddj_tdxh=request.getParameter("crm_tddj_tdxh");
	if (crm_tddj_tdxh!=null)
	{
		crm_tddj_tdxh=cf.GB2Uni(crm_tddj_tdxh);
		if (!(crm_tddj_tdxh.equals("")))	wheresql+=" and  (crm_tddj.tdxh='"+crm_tddj_tdxh+"')";
	}
	crm_tddj_tdyybm=request.getParameter("crm_tddj_tdyybm");
	if (crm_tddj_tdyybm!=null)
	{
		crm_tddj_tdyybm=cf.GB2Uni(crm_tddj_tdyybm);
		if (!(crm_tddj_tdyybm.equals("")))	wheresql+=" and  (crm_tddj.tdyybm='"+crm_tddj_tdyybm+"')";
	}
	crm_tddj_tdyysm=request.getParameter("crm_tddj_tdyysm");
	if (crm_tddj_tdyysm!=null)
	{
		crm_tddj_tdyysm=cf.GB2Uni(crm_tddj_tdyysm);
		if (!(crm_tddj_tdyysm.equals("")))	wheresql+=" and  (crm_tddj.tdyysm like '%"+crm_tddj_tdyysm+"%')";
	}
	crm_tddj_lrr=request.getParameter("crm_tddj_lrr");
	if (crm_tddj_lrr!=null)
	{
		crm_tddj_lrr=cf.GB2Uni(crm_tddj_lrr);
		if (!(crm_tddj_lrr.equals("")))	wheresql+=" and  (crm_tddj.lrr='"+crm_tddj_lrr+"')";
	}
	crm_tddj_lrsj=request.getParameter("crm_tddj_lrsj");
	if (crm_tddj_lrsj!=null)
	{
		crm_tddj_lrsj=crm_tddj_lrsj.trim();
		if (!(crm_tddj_lrsj.equals("")))	wheresql+="  and (crm_tddj.lrsj>=TO_DATE('"+crm_tddj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tddj_lrsj=request.getParameter("crm_tddj_lrsj2");
	if (crm_tddj_lrsj!=null)
	{
		crm_tddj_lrsj=crm_tddj_lrsj.trim();
		if (!(crm_tddj_lrsj.equals("")))	wheresql+="  and (crm_tddj.lrsj<=TO_DATE('"+crm_tddj_lrsj+"','YYYY/MM/DD'))";
	}
	tdsj=request.getParameter("tdsj");
	if (tdsj!=null)
	{
		tdsj=tdsj.trim();
		if (!(tdsj.equals("")))	wheresql+="  and (crm_tddj.tdsj>=TO_DATE('"+tdsj+"','YYYY/MM/DD'))";
	}
	tdsj=request.getParameter("tdsj2");
	if (tdsj!=null)
	{
		tdsj=tdsj.trim();
		if (!(tdsj.equals("")))	wheresql+="  and (crm_tddj.tdsj<=TO_DATE('"+tdsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_tddj.tdxh as tdxh,DECODE(crm_tddj.sfthlp,'Y','退回','N','未退回','W','未领礼品') sfthlp,crm_tddj.tdsj,tdyjjzsj,crm_tddj.lrr,crm_tddj.lrsj,crm_tddj.khbh as khbh,crm_tddj.khxm as crm_tddj_khxm,crm_tddj.fwdz as crm_tddj_fwdz,crm_tddj.sjs as crm_tddj_sjs,crm_tddj.zjxm as crm_tddj_zjxm,sgdmc as crm_tddj_sgd,qye,qyrq,a.dwmc as sq_dwxx_dwmc,dm_tdyybm.tdyymc as dm_tdyybm_tdyymc,crm_tddj.ytje as crm_tddj_ytje,crm_tddj.stje as crm_tddj_stje,crm_tddj.tdyysm  ";
	ls_sql+=" FROM sq_dwxx a,sq_sgd,dm_tdyybm,crm_tddj,crm_khxx  ";
    ls_sql+=" where crm_tddj.dwbh=a.dwbh and crm_tddj.sgd=sq_sgd.sgd(+) and crm_tddj.tdyybm=dm_tdyybm.tdyybm";
    ls_sql+=" and crm_tddj.khbh=crm_khxx.khbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tddj.tdsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tddjList.jsp","","","EditCrm_tddj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"tdxh","sfthlp","crm_tddj_khxm","crm_tddj_fwdz","tdsj","tdyjjzsj","dm_tdyybm_tdyymc","crm_tddj_ytje","crm_tddj_stje","tdyysm","crm_tddj_sjs","crm_tddj_zjxm","crm_tddj_sgd","qye","qyrq","lrr","lrsj","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"tdxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_tddj.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("crm_tddj_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tdxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_tddj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tdxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">施工合同退单－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">退单序号</td>
	<td  width="4%">是否退回礼品</td>
	<td  width="4%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">退单时间</td>
	<td  width="4%">退单记入业绩时间</td>
	<td  width="7%">退单原因</td>
	<td  width="4%">应退金额</td>
	<td  width="4%">实退金额</td>
	<td  width="22%">退单原因说明</td>
	<td  width="3%">设计师</td>
	<td  width="3%">工程担当</td>
	<td  width="3%">施工队</td>
	<td  width="4%">签约额</td>
	<td  width="4%">签单时间</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">签单店面</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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