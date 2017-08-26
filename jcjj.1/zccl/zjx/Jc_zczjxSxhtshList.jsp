<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String yhmc=(String)session.getAttribute("yhmc");
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


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
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


	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (jc_zczjx.ddbh='"+ddbh+"')";
	}


	String zcdlbm=null;
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_zczjx.zcdlbm='"+zcdlbm+"')";
	}
	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_zczjx.zcxlbm='"+zcxlbm+"')";
	}
	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (jc_zczjx.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_zczjx.ppbm='"+ppbm2+"')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zczjx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zczjx.ppmc='"+ppmc2+"')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_zczjx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_zczjx.gys='"+gys2+"')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_zczjx.ztjjgw='"+ztjjgw+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_zczjx.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_zczjx.xmzy='"+xmzy+"')";
	}




	String jc_zczjx_zjxbh=null;
	jc_zczjx_zjxbh=request.getParameter("jc_zczjx_zjxbh");
	if (jc_zczjx_zjxbh!=null)
	{
		jc_zczjx_zjxbh=jc_zczjx_zjxbh.trim();
		if (!(jc_zczjx_zjxbh.equals("")))	wheresql+=" and (jc_zczjx.zjxbh="+jc_zczjx_zjxbh+") ";
	}
	String jc_zczjx_clzt=null;
	jc_zczjx_clzt=request.getParameter("jc_zczjx_clzt");
	if (jc_zczjx_clzt!=null)
	{
		jc_zczjx_clzt=cf.GB2Uni(jc_zczjx_clzt);
		if (!(jc_zczjx_clzt.equals("")))	wheresql+=" and  (jc_zczjx.clzt='"+jc_zczjx_clzt+"')";
	}

	String zjxfssj=null;
	zjxfssj=request.getParameter("zjxfssj");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_zczjx.zjxfssj>=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}
	zjxfssj=request.getParameter("zjxfssj2");
	if (zjxfssj!=null)
	{
		zjxfssj=zjxfssj.trim();
		if (!(zjxfssj.equals("")))	wheresql+="  and (jc_zczjx.zjxfssj<=TO_DATE('"+zjxfssj+"','YYYY/MM/DD'))";
	}



	String jc_zczjx_zczjxyybm=null;
	String jc_zczjx_qrr=null;
	String jc_zczjx_qrsj=null;
	String jsr=null;
	String jssj=null;
	String jc_zczjx_htshsj=null;
	String jc_zczjx_sshsj=null;
	String jc_zczjx_lrr=null;
	String jc_zczjx_lrsj=null;
	String jc_zczjx_dwbh=null;
	jc_zczjx_zczjxyybm=request.getParameter("jc_zczjx_zczjxyybm");
	if (jc_zczjx_zczjxyybm!=null)
	{
		jc_zczjx_zczjxyybm=cf.GB2Uni(jc_zczjx_zczjxyybm);
		if (!(jc_zczjx_zczjxyybm.equals("")))	wheresql+=" and  (jc_zczjx.zczjxyybm='"+jc_zczjx_zczjxyybm+"')";
	}
	jc_zczjx_qrr=request.getParameter("jc_zczjx_qrr");
	if (jc_zczjx_qrr!=null)
	{
		jc_zczjx_qrr=cf.GB2Uni(jc_zczjx_qrr);
		if (!(jc_zczjx_qrr.equals("")))	wheresql+=" and  (jc_zczjx.qrr='"+jc_zczjx_qrr+"')";
	}
	jc_zczjx_qrsj=request.getParameter("jc_zczjx_qrsj");
	if (jc_zczjx_qrsj!=null)
	{
		jc_zczjx_qrsj=jc_zczjx_qrsj.trim();
		if (!(jc_zczjx_qrsj.equals("")))	wheresql+="  and (jc_zczjx.qrsj>=TO_DATE('"+jc_zczjx_qrsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_qrsj=request.getParameter("jc_zczjx_qrsj2");
	if (jc_zczjx_qrsj!=null)
	{
		jc_zczjx_qrsj=jc_zczjx_qrsj.trim();
		if (!(jc_zczjx_qrsj.equals("")))	wheresql+="  and (jc_zczjx.qrsj<=TO_DATE('"+jc_zczjx_qrsj+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (jc_zczjx.jsr='"+jsr+"')";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jc_zczjx.jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jc_zczjx.jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_htshsj=request.getParameter("jc_zczjx_htshsj");
	if (jc_zczjx_htshsj!=null)
	{
		jc_zczjx_htshsj=jc_zczjx_htshsj.trim();
		if (!(jc_zczjx_htshsj.equals("")))	wheresql+="  and (jc_zczjx.htshsj>=TO_DATE('"+jc_zczjx_htshsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_htshsj=request.getParameter("jc_zczjx_htshsj2");
	if (jc_zczjx_htshsj!=null)
	{
		jc_zczjx_htshsj=jc_zczjx_htshsj.trim();
		if (!(jc_zczjx_htshsj.equals("")))	wheresql+="  and (jc_zczjx.htshsj<=TO_DATE('"+jc_zczjx_htshsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_sshsj=request.getParameter("jc_zczjx_sshsj");
	if (jc_zczjx_sshsj!=null)
	{
		jc_zczjx_sshsj=jc_zczjx_sshsj.trim();
		if (!(jc_zczjx_sshsj.equals("")))	wheresql+="  and (jc_zczjx.sshsj>=TO_DATE('"+jc_zczjx_sshsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_sshsj=request.getParameter("jc_zczjx_sshsj2");
	if (jc_zczjx_sshsj!=null)
	{
		jc_zczjx_sshsj=jc_zczjx_sshsj.trim();
		if (!(jc_zczjx_sshsj.equals("")))	wheresql+="  and (jc_zczjx.sshsj<=TO_DATE('"+jc_zczjx_sshsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_lrr=request.getParameter("jc_zczjx_lrr");
	if (jc_zczjx_lrr!=null)
	{
		jc_zczjx_lrr=cf.GB2Uni(jc_zczjx_lrr);
		if (!(jc_zczjx_lrr.equals("")))	wheresql+=" and  (jc_zczjx.lrr='"+jc_zczjx_lrr+"')";
	}
	jc_zczjx_lrsj=request.getParameter("jc_zczjx_lrsj");
	if (jc_zczjx_lrsj!=null)
	{
		jc_zczjx_lrsj=jc_zczjx_lrsj.trim();
		if (!(jc_zczjx_lrsj.equals("")))	wheresql+="  and (jc_zczjx.lrsj>=TO_DATE('"+jc_zczjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_lrsj=request.getParameter("jc_zczjx_lrsj2");
	if (jc_zczjx_lrsj!=null)
	{
		jc_zczjx_lrsj=jc_zczjx_lrsj.trim();
		if (!(jc_zczjx_lrsj.equals("")))	wheresql+="  and (jc_zczjx.lrsj<=TO_DATE('"+jc_zczjx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_zczjx_dwbh=request.getParameter("jc_zczjx_dwbh");
	if (jc_zczjx_dwbh!=null)
	{
		jc_zczjx_dwbh=cf.GB2Uni(jc_zczjx_dwbh);
		if (!(jc_zczjx_dwbh.equals("")))	wheresql+=" and  (jc_zczjx.dwbh='"+jc_zczjx_dwbh+"')";
	}

	String sxhtsfysh=null;
	sxhtsfysh=request.getParameter("sxhtsfysh");
	if (sxhtsfysh!=null)
	{
		if (sxhtsfysh.equals("Y"))	
		{
			wheresql+=" and  (jc_zczjx.sxhtsfysh='"+sxhtsfysh+"')";
		}
		else{
			wheresql+=" and  (jc_zczjx.sxhtsfysh='"+sxhtsfysh+"' OR jc_zczjx.sxhtsfysh is null)";
		}
	}


	ls_sql="SELECT jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入已完成','02','已确认','04','厂家已接收','03','已送货','05','部分送货','30','单项完结','99','退单'),DECODE(sxhtsfysh,'M','非手写合同','Y','已审核','N','未审核'),crm_khxx.khxm,crm_khxx.fwdz,jc_zczjx.ddbh,jc_zczjx.zcxlbm,jc_zczjx.ppbm,jc_zczjx.zqzjxze,jc_zczjx.zjxze,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.zjxcxhdje,jc_zczjx.zjxfssj,jc_zczjx.lrsj,a.dwmc lrbm,crm_khxx.hth,crm_khxx.khbh,jc_zczjx.gys,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,sq_dwxx a ";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.dwbh=a.dwbh";
    ls_sql+=" and jc_zczjx.clzt not in('00','99')";
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
		ls_sql+=" and (jc_zczjx.clgw='"+yhmc+"' OR jc_zczjx.ztjjgw='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:家居设计师
	{
		ls_sql+=" and (jc_zczjx.jjsjs='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:项目专员
	{
		ls_sql+=" and (jc_zczjx.xmzy='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by jc_zczjx.lrsj desc,jc_zczjx.zjxbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_zczjxSxhtshList.jsp","","","ShsxhtJc_zczjx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","zjxbh","jc_zczjx_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","jc_zczjx_zjxbz","jc_zczjx_zjxze","jc_zczjx_clzt","jc_zczjx_lrsj","jc_zczjx_dwbh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"zjxbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"zjxbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJeJc_zczjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">审核手写合同</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="2%">&nbsp;</td>
	<td  width="4%">增减项序号</td>
	<td  width="4%">处理状态</td>
	<td  width="3%">手写合同审核</td>
	<td  width="3%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="3%">订单编号</td>
	<td  width="5%">主材小类</td>
	<td  width="7%">子品牌</td>
	<td  width="5%">折前增减项总额</td>
	<td  width="5%">折后增减项总额</td>
	<td  width="3%">增减项折扣</td>
	<td  width="4%">增减项计入活动金额</td>
	<td  width="4%">增减项发生时间</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="4%">合同号</td>
	<td  width="3%">客户编号</td>
	<td  width="11%">供应商</td>
	<td  width="11%">备注</td>
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