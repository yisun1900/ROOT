<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
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

	String jc_mmydd_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_lxfs2=null;
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

	jc_mmydd_khbh=request.getParameter("jc_mmydd_khbh");
	if (jc_mmydd_khbh!=null)
	{
		jc_mmydd_khbh=cf.GB2Uni(jc_mmydd_khbh);
		if (!(jc_mmydd_khbh.equals("")))	wheresql+=" and  (jc_mmydd.khbh='"+jc_mmydd_khbh+"')";
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
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_lxfs2=request.getParameter("crm_khxx_lxfs2");
	if (crm_khxx_lxfs2!=null)
	{
		crm_khxx_lxfs2=cf.GB2Uni(crm_khxx_lxfs2);
		if (!(crm_khxx_lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs2+"%')";
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


	String jc_mmydd_yddbh=null;
	String jc_mmydd_clzt=null;
	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;

	jc_mmydd_yddbh=request.getParameter("jc_mmydd_yddbh");
	if (jc_mmydd_yddbh!=null)
	{
		jc_mmydd_yddbh=cf.GB2Uni(jc_mmydd_yddbh);
		if (!(jc_mmydd_yddbh.equals("")))	wheresql+=" and  (jc_mmydd.yddbh='"+jc_mmydd_yddbh+"')";
	}
	jc_mmydd_clzt=request.getParameter("jc_mmydd_clzt");
	if (jc_mmydd_clzt!=null)
	{
		jc_mmydd_clzt=cf.GB2Uni(jc_mmydd_clzt);
		if (!(jc_mmydd_clzt.equals("")))	wheresql+=" and  (jc_mmydd.clzt='"+jc_mmydd_clzt+"')";
	}
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_mmydd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_mmydd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_mmydd.xmzy='"+xmzy+"')";
	}

	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_mmydd.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_mmydd.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_mmydd.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_mmydd.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_mmydd.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_mmydd.gys like '%"+gys2+"%')";
	}


	String jc_mmydd_srksj=null;

	jc_mmydd_srksj=request.getParameter("jc_mmydd_srksj");
	if (jc_mmydd_srksj!=null)
	{
		jc_mmydd_srksj=jc_mmydd_srksj.trim();
		if (!(jc_mmydd_srksj.equals("")))	wheresql+="  and (jc_mmydd.srksj>=TO_DATE('"+jc_mmydd_srksj+"','YYYY-MM-DD'))";
	}
	jc_mmydd_srksj=request.getParameter("jc_mmydd_srksj2");
	if (jc_mmydd_srksj!=null)
	{
		jc_mmydd_srksj=jc_mmydd_srksj.trim();
		if (!(jc_mmydd_srksj.equals("")))	wheresql+="  and (jc_mmydd.srksj<=TO_DATE('"+jc_mmydd_srksj+"','YYYY-MM-DD'))";
	}


	String jhazsj=null;

	jhazsj=request.getParameter("jhazsj");
	if (jhazsj!=null)
	{
		jhazsj=jhazsj.trim();
		if (!(jhazsj.equals("")))	wheresql+="  and (jc_mmydd.jhazsj>=TO_DATE('"+jhazsj+"','YYYY-MM-DD'))";
	}
	jhazsj=request.getParameter("jhazsj2");
	if (jhazsj!=null)
	{
		jhazsj=jhazsj.trim();
		if (!(jhazsj.equals("")))	wheresql+="  and (jc_mmydd.jhazsj<=TO_DATE('"+jhazsj+"','YYYY-MM-DD'))";
	}

	ls_sql="SELECT yddbh,crm_khxx.khxm,clztmc,jc_mmydd.htrq,jc_mmydd.jhazsj,jc_mmydd.srksj,jc_mmydd.pdgcmc,jc_mmydd.aztxbz,jc_mmydd.htje,jc_mmydd.mmhtje,jc_mmydd.wjhtje,jc_mmydd.blhtje, DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.lrsj,jc_mmydd.bz,jc_mmydd.khbh,crm_khxx.hth  ";
	ls_sql+=" FROM crm_khxx,jc_mmydd,jdm_mmyddzt  ";
    ls_sql+=" where jc_mmydd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
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
			ls_sql+=" and (jc_mmydd.clgw='"+yhmc+"' OR jc_mmydd.ztjjgw='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_mmydd.jjsjs='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_mmydd.xmzy='"+yhmc+"' OR jc_mmydd.lrr='"+yhmc+"')";
		}
	}

    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmydd.jhazsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmyddAztxList.jsp","","","AztxJc_mmydd.jsp");
	pageObj.setEditStr("录入");


//设置主键
	String[] keyName={"yddbh"};
	pageObj.setKey(keyName);

	pageObj.alignStr[7]="align='left'";

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	if (yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/mmdd/ViewGcJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
	else{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey={"yddbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey;//设置列参数：coluParm.key的主键
		coluParm.link="/jcjj/mmdd/ViewJc_mmydd.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("yddbh",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
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
  <B><font size="3">木门预订单---安装提醒</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">预订单编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="5%">处理状态</td>
	<td  width="4%">签合同时间</td>
	<td  width="4%">合同安装时间</td>
	<td  width="4%">入库时间</td>
	<td  width="5%">派单工厂</td>
	<td  width="17%">安装提醒</td>
	<td  width="4%">合同金额</td>
	<td  width="4%">木门合同金额</td>
	<td  width="4%">五金合同金额</td>
	<td  width="4%">玻璃合同金额</td>
	<td  width="4%">五金情况</td>
	<td  width="3%">项目专员</td>
	<td  width="3%">驻店家居顾问</td>
	<td  width="3%">展厅家居顾问</td>
	<td  width="4%">录入时间</td>
	<td  width="13%">备注</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">家装合同号</td>
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