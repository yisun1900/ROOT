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

	String jc_cgdd_khbh=null;
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
	String crm_khxx_kgrq=null;
	String crm_khxx_jgrq=null;
	String crm_khxx_qyrq=null;
	String cxhdbm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_cgdd_khbh=request.getParameter("jc_cgdd_khbh");
	if (jc_cgdd_khbh!=null)
	{
		jc_cgdd_khbh=cf.GB2Uni(jc_cgdd_khbh);
		if (!(jc_cgdd_khbh.equals("")))	wheresql+=" and  (jc_cgdd.khbh='"+jc_cgdd_khbh+"')";
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

	
	
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq>=TO_DATE('"+crm_khxx_jgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_jgrq=request.getParameter("crm_khxx_jgrq2");
	if (crm_khxx_jgrq!=null)
	{
		crm_khxx_jgrq=crm_khxx_jgrq.trim();
		if (!(crm_khxx_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq<=TO_DATE('"+crm_khxx_jgrq+"','YYYY-MM-DD'))";
	}

	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY-MM-DD'))";
	}

	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
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



	String jc_cgdd_ddbh=null;
	String jc_cgdd_clzt=null;
	jc_cgdd_ddbh=request.getParameter("jc_cgdd_ddbh");
	if (jc_cgdd_ddbh!=null)
	{
		jc_cgdd_ddbh=cf.GB2Uni(jc_cgdd_ddbh);
		if (!(jc_cgdd_ddbh.equals("")))	wheresql+=" and  (jc_cgdd.ddbh='"+jc_cgdd_ddbh+"')";
	}
	jc_cgdd_clzt=request.getParameter("jc_cgdd_clzt");
	if (jc_cgdd_clzt!=null)
	{
		jc_cgdd_clzt=cf.GB2Uni(jc_cgdd_clzt);
		if (!(jc_cgdd_clzt.equals("")))	wheresql+=" and  (jc_cgdd.clzt='"+jc_cgdd_clzt+"')";
	}


	String sfpsjs=null;
	sfpsjs=request.getParameter("sfpsjs");
	if (sfpsjs!=null)
	{
		sfpsjs=cf.GB2Uni(sfpsjs);
		if (!(sfpsjs.equals("")))	wheresql+=" and  (jc_cgdd.sfpsjs='"+sfpsjs+"')";
	}
	String cgsjs=null;
	cgsjs=request.getParameter("cgsjs");
	if (cgsjs!=null)
	{
		cgsjs=cf.GB2Uni(cgsjs);
		if (!(cgsjs.equals("")))	wheresql+=" and  (jc_cgdd.cgsjs like '%"+cgsjs+"%')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_cgdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_cgdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_cgdd.xmzy='"+xmzy+"')";
	}

	String jc_cgdd_jhccsj=null;
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj>=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_jhccsj=request.getParameter("jc_cgdd_jhccsj2");
	if (jc_cgdd_jhccsj!=null)
	{
		jc_cgdd_jhccsj=jc_cgdd_jhccsj.trim();
		if (!(jc_cgdd_jhccsj.equals("")))	wheresql+="  and (jc_cgdd.jhccsj<=TO_DATE('"+jc_cgdd_jhccsj+"','YYYY/MM/DD'))";
	}
	String jc_cgdd_pdsj=null;
	jc_cgdd_pdsj=request.getParameter("jc_cgdd_pdsj");
	if (jc_cgdd_pdsj!=null)
	{
		jc_cgdd_pdsj=jc_cgdd_pdsj.trim();
		if (!(jc_cgdd_pdsj.equals("")))	wheresql+="  and (jc_cgdd.pdsj>=TO_DATE('"+jc_cgdd_pdsj+"','YYYY/MM/DD'))";
	}
	jc_cgdd_pdsj=request.getParameter("jc_cgdd_pdsj2");
	if (jc_cgdd_pdsj!=null)
	{
		jc_cgdd_pdsj=jc_cgdd_pdsj.trim();
		if (!(jc_cgdd_pdsj.equals("")))	wheresql+="  and (jc_cgdd.pdsj<=TO_DATE('"+jc_cgdd_pdsj+"','YYYY/MM/DD'))";
	}


	String jc_cgdd_lrr=null;
	jc_cgdd_lrr=request.getParameter("jc_cgdd_lrr");
	if (jc_cgdd_lrr!=null)
	{
		jc_cgdd_lrr=cf.GB2Uni(jc_cgdd_lrr);
		if (!(jc_cgdd_lrr.equals("")))	wheresql+=" and  (jc_cgdd.lrr='"+jc_cgdd_lrr+"')";
	}


	ls_sql="SELECT jc_cgdd.ddbh,clztmc,jc_cgdd.pdsj,jc_cgdd.jhccsj,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sjs,DECODE(jc_cgdd.sfpsjs,'1','是','2','否') sfpsjs, jc_cgdd.cgsjs,sq_dwxx.dwmc dm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.lrr,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx,crm_khxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and jc_cgdd.clzt in('01','03','05','07','09','11')";

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
		ls_sql+=" and (jc_cgdd.clgw='"+yhmc+"' OR jc_cgdd.ztjjgw='"+yhmc+"' OR jc_cgdd.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:家居设计师
	{
		ls_sql+=" and (jc_cgdd.cgsjs='"+yhmc+"' OR jc_cgdd.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:项目专员
	{
		ls_sql+=" and (jc_cgdd.xmzy='"+yhmc+"' OR jc_cgdd.lrr='"+yhmc+"')";
	}


	ls_sql+=wheresql;
    ls_sql+=" order by jc_cgdd.pdsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_cgddQxYddList.jsp","","","QxYddJc_cgdd.jsp");

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("取消");

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
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
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
  <B><font size="3">橱柜--取消预订单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="3%">&nbsp;</td>
	<td  width="6%">订单编号</td>
	<td  width="6%">处理状态</td>
	<td  width="6%">派设计师时间</td>
	<td  width="6%">计划初测时间</td>
	<td  width="6%">客户姓名</td>
	<td  width="6%">合同号</td>
	<td  width="15%">房屋地址</td>
	<td  width="5%">家装设计师</td>
	<td  width="4%">需派设计师 </td>
	<td  width="5%">家居设计师</td>
	<td  width="9%">签约店面</td>
	<td  width="5%">项目专员</td>
	<td  width="5%">驻店家居顾问</td>
	<td  width="5%">展厅家居顾问</td>
	<td  width="4%">录入人</td>
	<td  width="4%">客户编号</td>
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