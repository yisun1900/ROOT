<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//项目专员过滤
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居顾问过滤
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居设计师过滤

if (zwbm.equals("10"))//10:项目专员
{
	if (xmzyglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:家居顾问
{
	if (jjgwglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:家居设计师
{
	if (jjsjsglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String jc_cgzjx_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_cgzjx_khbh=request.getParameter("jc_cgzjx_khbh");
	if (jc_cgzjx_khbh!=null)
	{
		jc_cgzjx_khbh=cf.GB2Uni(jc_cgzjx_khbh);
		if (!(jc_cgzjx_khbh.equals("")))	wheresql+=" and  (jc_cgzjx.khbh='"+jc_cgzjx_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}


	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}

	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}


	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}



	String jc_cgzjx_zjxxh=null;
	String jc_cgzjx_ddbh=null;
	jc_cgzjx_zjxxh=request.getParameter("jc_cgzjx_zjxxh");
	if (jc_cgzjx_zjxxh!=null)
	{
		jc_cgzjx_zjxxh=jc_cgzjx_zjxxh.trim();
		if (!(jc_cgzjx_zjxxh.equals("")))	wheresql+=" and (jc_cgzjx.zjxxh='"+jc_cgzjx_zjxxh+"') ";
	}
	jc_cgzjx_ddbh=request.getParameter("jc_cgzjx_ddbh");
	if (jc_cgzjx_ddbh!=null)
	{
		jc_cgzjx_ddbh=cf.GB2Uni(jc_cgzjx_ddbh);
		if (!(jc_cgzjx_ddbh.equals("")))	wheresql+=" and  (jc_cgzjx.ddbh='"+jc_cgzjx_ddbh+"')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgzjx.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgzjx.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgzjx.xmzy='"+xmzy+"')";
	}
	String cgsjs=null;
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgzjx.cgsjs='"+cgsjs+"')";
	}


	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_cgzjx.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_cgzjx.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_cgzjx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_cgzjx.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_cgzjx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_cgzjx.gys like '%"+gys2+"%')";
	}





	String jc_cgzjx_cgzjxyybm=null;
	String jc_cgzjx_clzt=null;
	jc_cgzjx_cgzjxyybm=request.getParameter("jc_cgzjx_cgzjxyybm");
	if (jc_cgzjx_cgzjxyybm!=null)
	{
		jc_cgzjx_cgzjxyybm=cf.GB2Uni(jc_cgzjx_cgzjxyybm);
		if (!(jc_cgzjx_cgzjxyybm.equals("")))	wheresql+=" and  (jc_cgzjx.cgzjxyybm='"+jc_cgzjx_cgzjxyybm+"')";
	}
	jc_cgzjx_clzt=request.getParameter("jc_cgzjx_clzt");
	if (jc_cgzjx_clzt!=null)
	{
		jc_cgzjx_clzt=cf.GB2Uni(jc_cgzjx_clzt);
		if (!(jc_cgzjx_clzt.equals("")))	wheresql+=" and  (jc_cgzjx.clzt='"+jc_cgzjx_clzt+"')";
	}


	String zjxfssj=null;
	zjxfssj=request.getParameter("zjxfssj");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_cgzjx.zjxfssj>=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}
	zjxfssj=request.getParameter("zjxfssj2");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_cgzjx.zjxfssj<=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}

	String jc_cgzjx_jhazsj=null;
	jc_cgzjx_jhazsj=request.getParameter("jc_cgzjx_jhazsj");
	if (jc_cgzjx_jhazsj!=null)
	{
		jc_cgzjx_jhazsj=jc_cgzjx_jhazsj.trim();
		if (!(jc_cgzjx_jhazsj.equals("")))	wheresql+="  and (jc_cgzjx.jhazsj>=TO_DATE('"+jc_cgzjx_jhazsj+"','YYYY/MM/DD'))";
	}
	jc_cgzjx_jhazsj=request.getParameter("jc_cgzjx_jhazsj2");
	if (jc_cgzjx_jhazsj!=null)
	{
		jc_cgzjx_jhazsj=jc_cgzjx_jhazsj.trim();
		if (!(jc_cgzjx_jhazsj.equals("")))	wheresql+="  and (jc_cgzjx.jhazsj<=TO_DATE('"+jc_cgzjx_jhazsj+"','YYYY/MM/DD'))";
	}

	String jc_cgzjx_lrr=null;
	String jc_cgzjx_lrsj=null;
	String jc_cgzjx_dwbh=null;
	jc_cgzjx_lrr=request.getParameter("jc_cgzjx_lrr");
	if (jc_cgzjx_lrr!=null)
	{
		jc_cgzjx_lrr=cf.GB2Uni(jc_cgzjx_lrr);
		if (!(jc_cgzjx_lrr.equals("")))	wheresql+=" and  (jc_cgzjx.lrr='"+jc_cgzjx_lrr+"')";
	}
	jc_cgzjx_lrsj=request.getParameter("jc_cgzjx_lrsj");
	if (jc_cgzjx_lrsj!=null)
	{
		jc_cgzjx_lrsj=jc_cgzjx_lrsj.trim();
		if (!(jc_cgzjx_lrsj.equals("")))	wheresql+="  and (jc_cgzjx.lrsj>=TO_DATE('"+jc_cgzjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgzjx_lrsj=request.getParameter("jc_cgzjx_lrsj2");
	if (jc_cgzjx_lrsj!=null)
	{
		jc_cgzjx_lrsj=jc_cgzjx_lrsj.trim();
		if (!(jc_cgzjx_lrsj.equals("")))	wheresql+="  and (jc_cgzjx.lrsj<=TO_DATE('"+jc_cgzjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_cgzjx_dwbh=request.getParameter("jc_cgzjx_dwbh");
	if (jc_cgzjx_dwbh!=null)
	{
		jc_cgzjx_dwbh=cf.GB2Uni(jc_cgzjx_dwbh);
		if (!(jc_cgzjx_dwbh.equals("")))	wheresql+=" and  (jc_cgzjx.dwbh='"+jc_cgzjx_dwbh+"')";
	}


	ls_sql="SELECT jc_cgzjx.ddbh,jc_cgzjx.zjxxh,DECODE(jc_cgzjx.clzt,'00','录入未完成','01','录入完成','02','工厂已确认','04','安装完成','99','退单'),jc_cgzjx.khbh,crm_khxx.khxm,crm_khxx.fwdz,jc_cgzjx.pdgcmc,crm_khxx.hth,mmzjxyymc,TO_CHAR(jc_cgzjx.cgzkl) cgzkl,TO_CHAR(jc_cgzjx.tmzkl) tmzkl,jc_cgzjx.dzyy,jc_cgzjx.zqzjxze,jc_cgzjx.zqgtzjxje,jc_cgzjx.zqtmzjxje,jc_cgzjx.zqwjzjxje,jc_cgzjx.zqdqzjxje,jc_cgzjx.zjxze,jc_cgzjx.gtzjxje,jc_cgzjx.tmzjxje,jc_cgzjx.wjzjxje,jc_cgzjx.dqzjxje,jc_cgzjx.zjxfssj,jc_cgzjx.jhazsj,jc_cgzjx.lrr,jc_cgzjx.lrsj,dwmc,jc_cgzjx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_cgzjx,sq_dwxx,jdm_mmzjxyybm  ";
    ls_sql+=" where jc_cgzjx.dwbh=sq_dwxx.dwbh and jc_cgzjx.cgzjxyybm=jdm_mmzjxyybm.mmzjxyybm";
    ls_sql+=" and jc_cgzjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_cgzjx.clzt in('00','01')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面 
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	if (zwbm.equals("08"))//08:家居顾问
	{
		ls_sql+=" and (jc_cgzjx.clgw='"+yhmc+"' OR jc_cgzjx.ztjjgw='"+yhmc+"' OR jc_cgzjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:家居设计师
	{
		ls_sql+=" and (jc_cgzjx.cgsjs='"+yhmc+"' OR jc_cgzjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:项目专员
	{
		ls_sql+=" and (jc_cgzjx.xmzy='"+yhmc+"' OR jc_cgzjx.lrr='"+yhmc+"')";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by jc_cgzjx.lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgzjxList.jsp","","","EditJc_cgzjx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","zjxxh","jc_cgzjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_zjxm","jc_cgzjx_cgzjxyybm","jc_cgzjx_gtzjxje","jc_cgzjx_tmzjxje","jc_cgzjx_wjzjxje","jc_cgzjx_dqzjxje","jc_cgzjx_zjxze","jc_cgzjx_qrsj","jc_cgzjx_qrr","jc_cgzjx_srksj","jc_cgzjx_rkr","jc_cgzjx_rksm","jc_cgzjx_jhazsj","jc_cgzjx_azwcsj","jc_cgzjx_clzt","jc_cgzjx_lrr","jc_cgzjx_lrsj","jc_cgzjx_dwbh","jc_cgzjx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxxh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除完成标志","删除增减项"};//按钮的显示名称
	String[] buttonLink={"DeleteEndJc_cgzjx.jsp","DeleteJc_cgzjx.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"zjxxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_cgzjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">橱柜增减项－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="2%">订单编号</td>
	<td  width="3%">增减项序号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="5%">工厂</td>
	<td  width="3%">合同号</td>
	<td  width="4%">增减项原因</td>
	<td  width="2%">柜体折扣率</td>
	<td  width="2%">台面折扣率</td>
	<td  width="8%">打折原因</td>

	<td  width="3%"><strong>增减项总额－折前</strong></td>
	<td  width="3%"><strong>柜体增减项金额－折前</strong></td>
	<td  width="3%"><strong>台面增减项金额－折前</strong></td>
	<td  width="3%"><strong>五金增减项金额－折前</strong></td>
	<td  width="3%"><strong>电器增减项金额－折前</strong></td>

	<td  width="3%"><font color="#0000CC"><strong>增减项总额－折后</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>柜体增减项金额－折后</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>台面增减项金额－折后</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>五金增减项金额－折后</strong></font></td>
	<td  width="3%"><font color="#0000CC"><strong>电器增减项金额－折后</strong></font></td>

	<td  width="3%">增减项发生时间</td>
	<td  width="3%">计划安装时间</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="8%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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