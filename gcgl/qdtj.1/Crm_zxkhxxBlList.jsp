<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String crm_zxkhxx_khbh=null;
	String crm_zxkhxx_xb=null;
	String crm_zxkhxx_fwdz=null;
	String crm_zxkhxx_lxfs=null;
	String crm_zxkhxx_fwlxbm=null;
	String crm_zxkhxx_hxbm=null;
	String crm_zxkhxx_fwmj=null;
	String crm_zxkhxx_fgyqbm=null;
	String crm_zxkhxx_xxlybm=null;
	String crm_zxkhxx_zxysbm=null;
	String crm_zxkhxx_zxzt=null;
	String crm_zxkhxx_zxdm=null;
	String crm_zxkhxx_qtqk=null;
	String crm_zxkhxx_sbyybm=null;
	String crm_zxkhxx_zxhfsj=null;
	String crm_zxkhxx_sfxhf=null;
	String crm_zxkhxx_hfrq=null;
	String crm_zxkhxx_hflxbm=null;
	String crm_zxkhxx_hdbz=null;
	String crm_zxkhxx_khlxbm=null;
	String crm_zxkhxx_lrr=null;
	String crm_zxkhxx_lrsj=null;
	String ybjsgd=null;
	String ybjdz=null;
	String crm_zxkhxx_sffpdm=null;
	String crm_zxkhxx_zxdjbm=null;


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
	
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}


	
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	crm_zxkhxx_zxdjbm=request.getParameter("crm_zxkhxx_zxdjbm");
	if (crm_zxkhxx_zxdjbm!=null)
	{
		if (!(crm_zxkhxx_zxdjbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdjbm='"+crm_zxkhxx_zxdjbm+"')";
	}
	crm_zxkhxx_sffpdm=request.getParameter("crm_zxkhxx_sffpdm");
	if (crm_zxkhxx_sffpdm!=null)
	{
		if (!(crm_zxkhxx_sffpdm.equals("")))	wheresql+=" and  (crm_zxkhxx.sffpdm='"+crm_zxkhxx_sffpdm+"')";
	}
	ybjsgd=request.getParameter("ybjsgd");
	if (ybjsgd!=null)
	{
		ybjsgd=cf.GB2Uni(ybjsgd);
		if (!(ybjsgd.equals("")))	wheresql+=" and  (crm_zxkhxx.ybjsgd='"+ybjsgd+"')";
	}
	ybjdz=request.getParameter("ybjdz");
	if (ybjdz!=null)
	{
		ybjdz=cf.GB2Uni(ybjdz);
		if (!(ybjdz.equals("")))	wheresql+=" and  (crm_zxkhxx.ybjdz like '%"+ybjdz+"%')";
	}

	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.cqbm='"+cqbm+"')";
	}
	String hdsgd=null;
	hdsgd=request.getParameter("hdsgd");
	if (hdsgd!=null)
	{
		hdsgd=cf.GB2Uni(hdsgd);
		if (!(hdsgd.equals("")))	wheresql+=" and  (crm_zxkhxx.hdsgd='"+hdsgd+"')";
	}
	String hdsgbz=null;
	hdsgbz=request.getParameter("hdsgbz");
	if (hdsgbz!=null)
	{
		hdsgbz=cf.GB2Uni(hdsgbz);
		if (!(hdsgbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hdsgbz='"+hdsgbz+"')";
	}
	String hdsjs=null;
	hdsjs=request.getParameter("hdsjs");
	if (hdsjs!=null)
	{
		hdsjs=cf.GB2Uni(hdsjs);
		if (!(hdsjs.equals("")))	wheresql+=" and  (crm_zxkhxx.hdsjs='"+hdsjs+"')";
	}
	String cgdz=null;
	cgdz=request.getParameter("cgdz");
	if (cgdz!=null)
	{
		cgdz=cf.GB2Uni(cgdz);
		if (!(cgdz.equals("")))	wheresql+=" and  (crm_zxkhxx.cgdz like '%"+cgdz+"%')";
	}
	
	
	crm_zxkhxx_khbh=request.getParameter("crm_zxkhxx_khbh");
	if (crm_zxkhxx_khbh!=null)
	{
		crm_zxkhxx_khbh=cf.GB2Uni(crm_zxkhxx_khbh);
		if (!(crm_zxkhxx_khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+crm_zxkhxx_khbh+"')";
	}
	crm_zxkhxx_xb=request.getParameter("crm_zxkhxx_xb");
	if (crm_zxkhxx_xb!=null)
	{
		crm_zxkhxx_xb=cf.GB2Uni(crm_zxkhxx_xb);
		if (!(crm_zxkhxx_xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+crm_zxkhxx_xb+"')";
	}
	crm_zxkhxx_fwdz=request.getParameter("crm_zxkhxx_fwdz");
	if (crm_zxkhxx_fwdz!=null)
	{
		crm_zxkhxx_fwdz=cf.GB2Uni(crm_zxkhxx_fwdz);
		if (!(crm_zxkhxx_fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+crm_zxkhxx_fwdz+"%')";
	}
	crm_zxkhxx_lxfs=request.getParameter("crm_zxkhxx_lxfs");
	if (crm_zxkhxx_lxfs!=null)
	{
		crm_zxkhxx_lxfs=cf.GB2Uni(crm_zxkhxx_lxfs);
		if (!(crm_zxkhxx_lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+crm_zxkhxx_lxfs+"')";
	}
	crm_zxkhxx_fwlxbm=request.getParameter("crm_zxkhxx_fwlxbm");
	if (crm_zxkhxx_fwlxbm!=null)
	{
		crm_zxkhxx_fwlxbm=cf.GB2Uni(crm_zxkhxx_fwlxbm);
		if (!(crm_zxkhxx_fwlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fwlxbm='"+crm_zxkhxx_fwlxbm+"')";
	}
	crm_zxkhxx_hxbm=request.getParameter("crm_zxkhxx_hxbm");
	if (crm_zxkhxx_hxbm!=null)
	{
		crm_zxkhxx_hxbm=cf.GB2Uni(crm_zxkhxx_hxbm);
		if (!(crm_zxkhxx_hxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hxbm='"+crm_zxkhxx_hxbm+"')";
	}
	crm_zxkhxx_fwmj=request.getParameter("crm_zxkhxx_fwmj");
	if (crm_zxkhxx_fwmj!=null)
	{
		crm_zxkhxx_fwmj=crm_zxkhxx_fwmj.trim();
		if (!(crm_zxkhxx_fwmj.equals("")))	wheresql+=" and (crm_zxkhxx.fwmj="+crm_zxkhxx_fwmj+") ";
	}
	crm_zxkhxx_fgyqbm=request.getParameter("crm_zxkhxx_fgyqbm");
	if (crm_zxkhxx_fgyqbm!=null)
	{
		crm_zxkhxx_fgyqbm=cf.GB2Uni(crm_zxkhxx_fgyqbm);
		if (!(crm_zxkhxx_fgyqbm.equals("")))	wheresql+=" and  (crm_zxkhxx.fgyqbm='"+crm_zxkhxx_fgyqbm+"')";
	}
	crm_zxkhxx_xxlybm=request.getParameter("crm_zxkhxx_xxlybm");
	if (crm_zxkhxx_xxlybm!=null)
	{
		crm_zxkhxx_xxlybm=cf.GB2Uni(crm_zxkhxx_xxlybm);
		if (!(crm_zxkhxx_xxlybm.equals("")))	wheresql+=" and  (crm_zxkhxx.xxlybm='"+crm_zxkhxx_xxlybm+"')";
	}
	crm_zxkhxx_zxysbm=request.getParameter("crm_zxkhxx_zxysbm");
	if (crm_zxkhxx_zxysbm!=null)
	{
		crm_zxkhxx_zxysbm=cf.GB2Uni(crm_zxkhxx_zxysbm);
		if (!(crm_zxkhxx_zxysbm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxysbm='"+crm_zxkhxx_zxysbm+"')";
	}

	crm_zxkhxx_zxdm=request.getParameter("crm_zxkhxx_zxdm");
	if (crm_zxkhxx_zxdm!=null)
	{
		crm_zxkhxx_zxdm=cf.GB2Uni(crm_zxkhxx_zxdm);
		if (!(crm_zxkhxx_zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+crm_zxkhxx_zxdm+"')";
	}
	crm_zxkhxx_qtqk=request.getParameter("crm_zxkhxx_qtqk");
	if (crm_zxkhxx_qtqk!=null)
	{
		crm_zxkhxx_qtqk=cf.GB2Uni(crm_zxkhxx_qtqk);
		if (!(crm_zxkhxx_qtqk.equals("")))	wheresql+=" and  (crm_zxkhxx.qtqk='"+crm_zxkhxx_qtqk+"')";
	}
	crm_zxkhxx_sbyybm=request.getParameter("crm_zxkhxx_sbyybm");
	if (crm_zxkhxx_sbyybm!=null)
	{
		crm_zxkhxx_sbyybm=cf.GB2Uni(crm_zxkhxx_sbyybm);
		if (!(crm_zxkhxx_sbyybm.equals("")))	wheresql+=" and  (crm_zxkhxx.sbyybm='"+crm_zxkhxx_sbyybm+"')";
	}
	crm_zxkhxx_zxhfsj=request.getParameter("crm_zxkhxx_zxhfsj");
	if (crm_zxkhxx_zxhfsj!=null)
	{
		crm_zxkhxx_zxhfsj=crm_zxkhxx_zxhfsj.trim();
		if (!(crm_zxkhxx_zxhfsj.equals("")))	wheresql+="  and (crm_zxkhxx.zxhfsj=TO_DATE('"+crm_zxkhxx_zxhfsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_sfxhf=request.getParameter("crm_zxkhxx_sfxhf");
	if (crm_zxkhxx_sfxhf!=null)
	{
		crm_zxkhxx_sfxhf=cf.GB2Uni(crm_zxkhxx_sfxhf);
		if (!(crm_zxkhxx_sfxhf.equals("")))	wheresql+=" and  (crm_zxkhxx.sfxhf='"+crm_zxkhxx_sfxhf+"')";
	}
	crm_zxkhxx_hfrq=request.getParameter("crm_zxkhxx_hfrq");
	if (crm_zxkhxx_hfrq!=null)
	{
		crm_zxkhxx_hfrq=crm_zxkhxx_hfrq.trim();
		if (!(crm_zxkhxx_hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq>=TO_DATE('"+crm_zxkhxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_hfrq=request.getParameter("crm_zxkhxx_hfrq2");
	if (crm_zxkhxx_hfrq!=null)
	{
		crm_zxkhxx_hfrq=crm_zxkhxx_hfrq.trim();
		if (!(crm_zxkhxx_hfrq.equals("")))	wheresql+="  and (crm_zxkhxx.hfrq<=TO_DATE('"+crm_zxkhxx_hfrq+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_hflxbm=request.getParameter("crm_zxkhxx_hflxbm");
	if (crm_zxkhxx_hflxbm!=null)
	{
		crm_zxkhxx_hflxbm=cf.GB2Uni(crm_zxkhxx_hflxbm);
		if (!(crm_zxkhxx_hflxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.hflxbm='"+crm_zxkhxx_hflxbm+"')";
	}
	crm_zxkhxx_hdbz=request.getParameter("crm_zxkhxx_hdbz");
	if (crm_zxkhxx_hdbz!=null)
	{
		crm_zxkhxx_hdbz=cf.GB2Uni(crm_zxkhxx_hdbz);
		if (!(crm_zxkhxx_hdbz.equals("")))	wheresql+=" and  (crm_zxkhxx.hdbz='"+crm_zxkhxx_hdbz+"')";
	}
	crm_zxkhxx_khlxbm=request.getParameter("crm_zxkhxx_khlxbm");
	if (crm_zxkhxx_khlxbm!=null)
	{
		crm_zxkhxx_khlxbm=cf.GB2Uni(crm_zxkhxx_khlxbm);
		if (!(crm_zxkhxx_khlxbm.equals("")))	wheresql+=" and  (crm_zxkhxx.khlxbm='"+crm_zxkhxx_khlxbm+"')";
	}
	crm_zxkhxx_lrr=request.getParameter("crm_zxkhxx_lrr");
	if (crm_zxkhxx_lrr!=null)
	{
		crm_zxkhxx_lrr=cf.GB2Uni(crm_zxkhxx_lrr);
		if (!(crm_zxkhxx_lrr.equals("")))	wheresql+=" and  (crm_zxkhxx.lrr='"+crm_zxkhxx_lrr+"')";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}
	crm_zxkhxx_lrsj=request.getParameter("crm_zxkhxx_lrsj2");
	if (crm_zxkhxx_lrsj!=null)
	{
		crm_zxkhxx_lrsj=crm_zxkhxx_lrsj.trim();
		if (!(crm_zxkhxx_lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+crm_zxkhxx_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT '签单' qd,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,DECODE(shbz,'N','未审核','Y','审核'),DECODE(sfzdzbj,'N','未做','Y','已做'),dzbjze,bjjbmc,sjs,ywy,lrsj,b.dwmc as zxdm,a.dwmc zxdjbm,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(crm_zxkhxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') as crm_zxkhxx_hdbz,crm_zxkhxx.khbh as khbh  ";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,bdm_bjjbbm ";
    ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) and zxzt not in('2','3','4')";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and rownum<50";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.zxdm,lrsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_fwlxbm","crm_zxkhxx_sfxhf","crm_zxkhxx_hfrq","crm_zxkhxx_hflxbm","crm_zxkhxx_hdbz","crm_zxkhxx_zxzt","crm_zxkhxx_khlxbm"};
	pageObj.setDisColName(disColName);
*/

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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="InsertBlCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("qd",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">补录签单信息（<font color="#FF0000">必须首先进行咨询登记</font>）</font></B> 
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
%>
<table border="1" width="145%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="5%">审核标志</td>
	<td  width="5%">电子报价</td>
	<td  width="7%">电子报价总额</td>
	<td  width="5%">报价级别</td>
	<td  width="5%">设计师</td>
	<td  width="5%">业务员</td>
	<td  width="7%">录入时间</td>
	<td  width="9%">咨询店面</td>
	<td  width="9%">咨询登记部门</td>
	<td  width="7%">咨询状态</td>
	<td  width="5%">回单标志</td>
	<td  width="5%">客户编号</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</body>
</html>