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

	String ywybm=null;
	ywybm=request.getParameter("ywybm");
	if (ywybm!=null)
	{
		ywybm=cf.GB2Uni(ywybm);
		if (!(ywybm.equals("")))	wheresql+=" and  (crm_zxkhxx.ywybm='"+ywybm+"')";
	}
	String ywyssxz=null;
	ywyssxz=request.getParameter("ywyssxz");
	if (ywyssxz!=null)
	{
		ywyssxz=cf.GB2Uni(ywyssxz);
		if (!(ywyssxz.equals("")))	wheresql+=" and  (crm_zxkhxx.ywyssxz='"+ywyssxz+"')";
	}
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String ywy1=null;
	ywy1=request.getParameter("ywy1");
	if (ywy1!=null)
	{
		ywy1=cf.GB2Uni(ywy1);
		if (!(ywy1.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy1+"')";
	}

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxhfjl.ssfgs='"+ssfgs+"')";

	String crm_zxkhxx_zxdm=null;
	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";


	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String crm_zxkhxx_khxm=null;
	crm_zxkhxx_khxm=request.getParameter("crm_zxkhxx_khxm");
	if (crm_zxkhxx_khxm!=null)
	{
		crm_zxkhxx_khxm=cf.GB2Uni(crm_zxkhxx_khxm);
		if (!(crm_zxkhxx_khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+crm_zxkhxx_khxm+"')";
	}
	String crm_zxkhxx_khxm2=null;
	crm_zxkhxx_khxm2=request.getParameter("crm_zxkhxx_khxm2");
	if (crm_zxkhxx_khxm2!=null)
	{
		crm_zxkhxx_khxm2=cf.GB2Uni(crm_zxkhxx_khxm2);
		if (!(crm_zxkhxx_khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+crm_zxkhxx_khxm2+"%')";
	}
	
	String crm_zxkhxx_fwdz=null;
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+crm_zxkhxx_fwdz+"')";
	}
	String crm_zxkhxx_fwdz2=null;
	crm_zxkhxx_fwdz2=request.getParameter("crm_zxkhxx_fwdz2");
	if (crm_zxkhxx_fwdz2!=null)
	{
		crm_zxkhxx_fwdz2=cf.GB2Uni(crm_zxkhxx_fwdz2);
		if (!(crm_zxkhxx_fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz2+"%')";
	}
	String crm_zxkhxx_lxfs=null;
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	String crm_zxkhxx_lxfs2=null;
	crm_zxkhxx_lxfs2=request.getParameter("crm_zxkhxx_lxfs2");
	if (crm_zxkhxx_lxfs2!=null)
	{
		crm_zxkhxx_lxfs2=cf.GB2Uni(crm_zxkhxx_lxfs2);
		if (!(crm_zxkhxx_lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+crm_zxkhxx_lxfs2+"%')";
	}

	String crm_zxkhxx_khbh=null;
	
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}


	String crm_zxhfjl_hfjlh=null;
	String crm_zxhfjl_lfbz=null;
	String crm_zxhfjl_lfsj=null;
	String crm_zxhfjl_ctbz=null;
	String crm_zxhfjl_ctsj=null;
	String crm_zxhfjl_yqghdm=null;
	String crm_zxhfjl_yqghsjs=null;
	String crm_zxhfjl_sjszysp=null;
	String crm_zxhfjl_sjsfw=null;
	String crm_zxhfjl_qtryfw=null;
	String crm_zxhfjl_gcbj=null;
	String crm_zxhfjl_gsztyx=null;
	String crm_zxhfjl_xwgjfm=null;
	String crm_zxhfjl_sfjxhf=null;
	String crm_zxhfjl_xchfrq=null;
	String crm_zxhfjl_hfsj=null;
	String crm_zxhfjl_hfr=null;
	String crm_zxhfjl_hfbm=null;
	String crm_zxhfjl_clfs=null;


	String hfcs=null;
	hfcs=request.getParameter("hfcs");
	if (hfcs!=null)
	{
		hfcs=cf.GB2Uni(hfcs);
		if (!(hfcs.equals("")))	wheresql+=" and  (crm_zxhfjl.hfcs='"+hfcs+"')";
	}

	crm_zxhfjl_hfjlh=request.getParameter("crm_zxhfjl_hfjlh");
	if (crm_zxhfjl_hfjlh!=null)
	{
		crm_zxhfjl_hfjlh=cf.GB2Uni(crm_zxhfjl_hfjlh);
		if (!(crm_zxhfjl_hfjlh.equals("")))	wheresql+=" and  (crm_zxhfjl.hfjlh='"+crm_zxhfjl_hfjlh+"')";
	}
	crm_zxhfjl_lfbz=request.getParameter("crm_zxhfjl_lfbz");
	if (crm_zxhfjl_lfbz!=null)
	{
		crm_zxhfjl_lfbz=cf.GB2Uni(crm_zxhfjl_lfbz);
		if (!(crm_zxhfjl_lfbz.equals("")))	wheresql+=" and  (crm_zxhfjl.lfbz='"+crm_zxhfjl_lfbz+"')";
	}
	crm_zxhfjl_lfsj=request.getParameter("crm_zxhfjl_lfsj");
	if (crm_zxhfjl_lfsj!=null)
	{
		crm_zxhfjl_lfsj=crm_zxhfjl_lfsj.trim();
		if (!(crm_zxhfjl_lfsj.equals("")))	wheresql+="  and (crm_zxhfjl.lfsj=TO_DATE('"+crm_zxhfjl_lfsj+"','YYYY/MM/DD'))";
	}
	crm_zxhfjl_ctbz=request.getParameter("crm_zxhfjl_ctbz");
	if (crm_zxhfjl_ctbz!=null)
	{
		crm_zxhfjl_ctbz=cf.GB2Uni(crm_zxhfjl_ctbz);
		if (!(crm_zxhfjl_ctbz.equals("")))	wheresql+=" and  (crm_zxhfjl.ctbz='"+crm_zxhfjl_ctbz+"')";
	}
	crm_zxhfjl_ctsj=request.getParameter("crm_zxhfjl_ctsj");
	if (crm_zxhfjl_ctsj!=null)
	{
		crm_zxhfjl_ctsj=crm_zxhfjl_ctsj.trim();
		if (!(crm_zxhfjl_ctsj.equals("")))	wheresql+="  and (crm_zxhfjl.ctsj=TO_DATE('"+crm_zxhfjl_ctsj+"','YYYY/MM/DD'))";
	}
	crm_zxhfjl_yqghdm=request.getParameter("crm_zxhfjl_yqghdm");
	if (crm_zxhfjl_yqghdm!=null)
	{
		crm_zxhfjl_yqghdm=cf.GB2Uni(crm_zxhfjl_yqghdm);
		if (!(crm_zxhfjl_yqghdm.equals("")))	wheresql+=" and  (crm_zxhfjl.yqghdm='"+crm_zxhfjl_yqghdm+"')";
	}
	crm_zxhfjl_yqghsjs=request.getParameter("crm_zxhfjl_yqghsjs");
	if (crm_zxhfjl_yqghsjs!=null)
	{
		crm_zxhfjl_yqghsjs=cf.GB2Uni(crm_zxhfjl_yqghsjs);
		if (!(crm_zxhfjl_yqghsjs.equals("")))	wheresql+=" and  (crm_zxhfjl.yqghsjs='"+crm_zxhfjl_yqghsjs+"')";
	}
	crm_zxhfjl_sjszysp=request.getParameter("crm_zxhfjl_sjszysp");
	if (crm_zxhfjl_sjszysp!=null)
	{
		crm_zxhfjl_sjszysp=cf.GB2Uni(crm_zxhfjl_sjszysp);
		if (!(crm_zxhfjl_sjszysp.equals("")))	wheresql+=" and  (crm_zxhfjl.sjszysp='"+crm_zxhfjl_sjszysp+"')";
	}
	crm_zxhfjl_sjsfw=request.getParameter("crm_zxhfjl_sjsfw");
	if (crm_zxhfjl_sjsfw!=null)
	{
		crm_zxhfjl_sjsfw=cf.GB2Uni(crm_zxhfjl_sjsfw);
		if (!(crm_zxhfjl_sjsfw.equals("")))	wheresql+=" and  (crm_zxhfjl.sjsfw='"+crm_zxhfjl_sjsfw+"')";
	}
	crm_zxhfjl_qtryfw=request.getParameter("crm_zxhfjl_qtryfw");
	if (crm_zxhfjl_qtryfw!=null)
	{
		crm_zxhfjl_qtryfw=cf.GB2Uni(crm_zxhfjl_qtryfw);
		if (!(crm_zxhfjl_qtryfw.equals("")))	wheresql+=" and  (crm_zxhfjl.qtryfw='"+crm_zxhfjl_qtryfw+"')";
	}
	crm_zxhfjl_gcbj=request.getParameter("crm_zxhfjl_gcbj");
	if (crm_zxhfjl_gcbj!=null)
	{
		crm_zxhfjl_gcbj=cf.GB2Uni(crm_zxhfjl_gcbj);
		if (!(crm_zxhfjl_gcbj.equals("")))	wheresql+=" and  (crm_zxhfjl.gcbj='"+crm_zxhfjl_gcbj+"')";
	}
	crm_zxhfjl_gsztyx=request.getParameter("crm_zxhfjl_gsztyx");
	if (crm_zxhfjl_gsztyx!=null)
	{
		crm_zxhfjl_gsztyx=cf.GB2Uni(crm_zxhfjl_gsztyx);
		if (!(crm_zxhfjl_gsztyx.equals("")))	wheresql+=" and  (crm_zxhfjl.gsztyx='"+crm_zxhfjl_gsztyx+"')";
	}
	crm_zxhfjl_xwgjfm=request.getParameter("crm_zxhfjl_xwgjfm");
	if (crm_zxhfjl_xwgjfm!=null)
	{
		crm_zxhfjl_xwgjfm=cf.GB2Uni(crm_zxhfjl_xwgjfm);
		if (!(crm_zxhfjl_xwgjfm.equals("")))	wheresql+=" and  (crm_zxhfjl.xwgjfm='"+crm_zxhfjl_xwgjfm+"')";
	}
	crm_zxhfjl_sfjxhf=request.getParameter("crm_zxhfjl_sfjxhf");
	if (crm_zxhfjl_sfjxhf!=null)
	{
		crm_zxhfjl_sfjxhf=cf.GB2Uni(crm_zxhfjl_sfjxhf);
		if (!(crm_zxhfjl_sfjxhf.equals("")))	wheresql+=" and  (crm_zxhfjl.sfjxhf='"+crm_zxhfjl_sfjxhf+"')";
	}
	crm_zxhfjl_xchfrq=request.getParameter("crm_zxhfjl_xchfrq");
	if (crm_zxhfjl_xchfrq!=null)
	{
		crm_zxhfjl_xchfrq=crm_zxhfjl_xchfrq.trim();
		if (!(crm_zxhfjl_xchfrq.equals("")))	wheresql+="  and (crm_zxhfjl.xchfrq=TO_DATE('"+crm_zxhfjl_xchfrq+"','YYYY/MM/DD'))";
	}
	crm_zxhfjl_hfsj=request.getParameter("crm_zxhfjl_hfsj");
	if (crm_zxhfjl_hfsj!=null)
	{
		crm_zxhfjl_hfsj=crm_zxhfjl_hfsj.trim();
		if (!(crm_zxhfjl_hfsj.equals("")))	wheresql+="  and (crm_zxhfjl.hfsj>=TO_DATE('"+crm_zxhfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_zxhfjl_hfsj=request.getParameter("crm_zxhfjl_hfsj2");
	if (crm_zxhfjl_hfsj!=null)
	{
		crm_zxhfjl_hfsj=crm_zxhfjl_hfsj.trim();
		if (!(crm_zxhfjl_hfsj.equals("")))	wheresql+="  and (crm_zxhfjl.hfsj<=TO_DATE('"+crm_zxhfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_zxhfjl_hfr=request.getParameter("crm_zxhfjl_hfr");
	if (crm_zxhfjl_hfr!=null)
	{
		crm_zxhfjl_hfr=cf.GB2Uni(crm_zxhfjl_hfr);
		if (!(crm_zxhfjl_hfr.equals("")))	wheresql+=" and  (crm_zxhfjl.hfr='"+crm_zxhfjl_hfr+"')";
	}
	crm_zxhfjl_hfbm=request.getParameter("crm_zxhfjl_hfbm");
	if (crm_zxhfjl_hfbm!=null)
	{
		crm_zxhfjl_hfbm=cf.GB2Uni(crm_zxhfjl_hfbm);
		if (!(crm_zxhfjl_hfbm.equals("")))	wheresql+=" and  (crm_zxhfjl.hfbm='"+crm_zxhfjl_hfbm+"')";
	}
	crm_zxhfjl_clfs=request.getParameter("crm_zxhfjl_clfs");
	if (crm_zxhfjl_clfs!=null)
	{
		crm_zxhfjl_clfs=cf.GB2Uni(crm_zxhfjl_clfs);
		if (!(crm_zxhfjl_clfs.equals("")))	wheresql+=" and  (crm_zxhfjl.clfs='"+crm_zxhfjl_clfs+"')";
	}

	ls_sql="SELECT crm_zxhfjl.hfjlh,crm_zxhfjl.hfcs,DECODE(crm_zxhfjl.clfs,'0','不提醒','1','提醒店面','2','提醒设计师'),crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxhfjl.hfsj,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk,sq_dwxx.dwmc hfbm, DECODE(crm_zxhfjl.lfbz,'N','未量房','Y','已量房'),crm_zxhfjl.lfsj, DECODE(crm_zxhfjl.ctbz,'N','未出图','Y','已出图'),crm_zxhfjl.ctsj, DECODE(crm_zxhfjl.yqghdm,'N','不要求','Y','要求更换'), DECODE(crm_zxhfjl.yqghsjs,'N','不要求','Y','要求更换'),c.hfjgmc sjszysp,d.hfjgmc sjsfw,e.hfjgmc qtryfw,f.hfjgmc gcbj,g.hfjgmc gsztyx,h.hfjgmc xwgjfm, DECODE(crm_zxhfjl.sfjxhf,'Y','继续回访','N','回访结束'),crm_zxhfjl.xchfrq,crm_zxhfjl.khbh  ";
	ls_sql+=" FROM crm_zxhfjl,crm_zxkhxx,sq_dwxx";
	ls_sql+=" ,dm_hfjgbm c,dm_hfjgbm d,dm_hfjgbm e,dm_hfjgbm f,dm_hfjgbm g,dm_hfjgbm h";
    ls_sql+=" where crm_zxhfjl.hfbm=sq_dwxx.dwbh and crm_zxhfjl.khbh=crm_zxkhxx.khbh ";
	ls_sql+=" and crm_zxhfjl.sjszysp=c.hfjgbm(+) and crm_zxhfjl.sjsfw=d.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.qtryfw=e.hfjgbm(+) and crm_zxhfjl.gcbj=f.hfjgbm(+)";
	ls_sql+=" and crm_zxhfjl.gsztyx=g.hfjgbm(+) and crm_zxhfjl.xwgjfm=h.hfjgbm(+)";
	
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

    ls_sql+=wheresql;
    ls_sql+=" order by crm_zxhfjl.hfsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_zxhfjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"crm_zxhfjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_sjs","hfjlh","crm_zxhfjl_khhfqk","crm_zxhfjl_lfbz","crm_zxhfjl_lfsj","crm_zxhfjl_ctbz","crm_zxhfjl_ctsj","crm_zxhfjl_yqghdm","crm_zxhfjl_yqghsjs","crm_zxhfjl_sjszysp","crm_zxhfjl_sjsfw","crm_zxhfjl_qtryfw","crm_zxhfjl_gcbj","crm_zxhfjl_gsztyx","crm_zxhfjl_xwgjfm","crm_zxhfjl_sfjxhf","crm_zxhfjl_xchfrq","crm_zxhfjl_hfsj","crm_zxhfjl_hfr","crm_zxhfjl_hfbm","crm_zxhfjl_clfs","sq_dwxx_dwmc","crm_zxhfjl_ckr","crm_zxhfjl_cksj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);
	pageObj.alignStr[8]="align='left'";
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hfjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParm.link="ViewCrm_zxhfjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hfjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置列超级连接

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">回访记录号</td>
	<td  width="2%">回访次数</td>
	<td  width="3%">是否提醒责任人</td>
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">回访时间</td>
	<td  width="2%">回访人</td>
	<td  width="21%">客户回访情况</td>
	<td  width="5%">回访部门</td>
	<td  width="3%">量房标志</td>
	<td  width="3%">量房时间</td>
	<td  width="3%">出平面图标志</td>
	<td  width="3%">出平面图时间</td>
	<td  width="3%">要求更换店面</td>
	<td  width="3%">要求更换设计师</td>
	<td  width="3%">设计师专业水平</td>
	<td  width="3%">设计师服务</td>
	<td  width="3%">其它人员服务</td>
	<td  width="3%">工程报价</td>
	<td  width="3%">公司总体印象</td>
	<td  width="5%">希望改进方面</td>
	<td  width="3%">是否继续回访</td>
	<td  width="3%">下次回访日期</td>
	<td  width="3%">客户编号</td>
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