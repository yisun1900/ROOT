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
	String khbh=null;
	String khxm=null;
	String xb=null;
	String fwdz=null;
	String lxfs=null;
	String fgflbm=null;
	String zxjwbm=null;
	String hxmjbm=null;
	String ysbm=null;
	String hth=null;
	String sjs=null;
	String qye=null;
	String sfyyh=null;
	String yhzj=null;
	String jyjdrq=null;
	String qyrq=null;
	String kgrq=null;
	String skje=null;
	String skrq=null;
	String zkje=null;
	String fzxm=null;
	String lrsj=null;
	String pdlx=null;
	String zpsgd=null;
	String zpyy=null;
	String pdclzt=null;
	String hdbz=null;
	String zt=null;
	String khlxbm=null;
	String lrr=null;

	String hfjl=null;
	hfjl=request.getParameter("hfjl");
	if (hfjl!=null)
	{
		if (!(hfjl.equals("")))	wheresql+=" and  (pd_pdjl.hfjl='"+hfjl+"')";
	}

	String shzzb=null;
	shzzb=request.getParameter("shzzb");
	if (shzzb!=null)
	{
		shzzb=cf.GB2Uni(shzzb);
		if (!(shzzb.equals("")))	wheresql+=" and  (pd_pdjl.shzzb='"+shzzb+"')";
	}
	String pdr=null;
	pdr=request.getParameter("pdr");
	if (pdr!=null)
	{
		pdr=cf.GB2Uni(pdr);
		if (!(pdr.equals("")))	wheresql+=" and  (pd_pdjl.pdr='"+pdr+"')";
	}
	String sgdyxj=null;
	sgdyxj=request.getParameter("sgdyxj");
	if (sgdyxj!=null)
	{
		sgdyxj=cf.GB2Uni(sgdyxj);
		if (!(sgdyxj.equals("")))	wheresql+=" and  (pd_pdjl.sgdyxj>="+sgdyxj+")";
	}
	sgdyxj=request.getParameter("sgdyxj2");
	if (sgdyxj!=null)
	{
		sgdyxj=cf.GB2Uni(sgdyxj);
		if (!(sgdyxj.equals("")))	wheresql+=" and  (pd_pdjl.sgdyxj<="+sgdyxj+")";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String jlbz=null;
	jlbz=request.getParameter("jlbz");
	if (jlbz!=null)
	{
		if (!(jlbz.equals("")))	wheresql+=" and  (pd_pdjl.jlbz='"+jlbz+"')";
	}
	String pdsm=null;
	pdsm=request.getParameter("pdsm");
	if (pdsm!=null)
	{
		pdsm=cf.GB2Uni(pdsm);
		if (!(pdsm.equals("")))	wheresql+=" and  (pd_pdjl.pdsm like '%"+pdsm+"%')";
	}
	String cqbm=null;
	cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		cqbm=cf.GB2Uni(cqbm);
		if (!(cqbm.equals("")))	wheresql+=" and  (crm_khxx.cqbm='"+cqbm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (pd_pdjl.sgd='"+sgd+"')";
	}
	String pdsj=null;
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (pd_pdjl.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (pd_pdjl.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}

	
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (crm_khxx.xb='"+xb+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}
	fgflbm=request.getParameter("fgflbm");
	if (fgflbm!=null)
	{
		fgflbm=cf.GB2Uni(fgflbm);
		if (!(fgflbm.equals("")))	wheresql+=" and  (crm_khxx.fgflbm='"+fgflbm+"')";
	}
	zxjwbm=request.getParameter("zxjwbm");
	if (zxjwbm!=null)
	{
		zxjwbm=cf.GB2Uni(zxjwbm);
		if (!(zxjwbm.equals("")))	wheresql+=" and  (crm_khxx.zxjwbm='"+zxjwbm+"')";
	}
	hxmjbm=request.getParameter("hxmjbm");
	if (hxmjbm!=null)
	{
		hxmjbm=cf.GB2Uni(hxmjbm);
		if (!(hxmjbm.equals("")))	wheresql+=" and  (crm_khxx.hxmjbm='"+hxmjbm+"')";
	}
	ysbm=request.getParameter("ysbm");
	if (ysbm!=null)
	{
		ysbm=cf.GB2Uni(ysbm);
		if (!(ysbm.equals("")))	wheresql+=" and  (crm_khxx.ysbm='"+ysbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	qye=request.getParameter("qye");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (crm_khxx.qye>="+qye+") ";
	}
	qye=request.getParameter("qye2");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (crm_khxx.qye<="+qye+") ";
	}
	sfyyh=request.getParameter("sfyyh");
	if (sfyyh!=null)
	{
		sfyyh=cf.GB2Uni(sfyyh);
		if (!(sfyyh.equals("")))	wheresql+=" and  (crm_khxx.sfyyh='"+sfyyh+"')";
	}
	yhzj=request.getParameter("yhzj");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (crm_khxx.yhzj>="+yhzj+") ";
	}
	yhzj=request.getParameter("yhzj2");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (crm_khxx.yhzj<="+yhzj+") ";
	}
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (crm_khxx.jyjdrq>=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq2");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (crm_khxx.jyjdrq<=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq2");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	skje=request.getParameter("skje");
	if (skje!=null)
	{
		skje=skje.trim();
		if (!(skje.equals("")))	wheresql+=" and (crm_khxx.skje="+skje+") ";
	}
	skrq=request.getParameter("skrq");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (crm_khxx.skrq>=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	skrq=request.getParameter("skrq2");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (crm_khxx.skrq<=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	zkje=request.getParameter("zkje");
	if (zkje!=null)
	{
		zkje=zkje.trim();
		if (!(zkje.equals("")))	wheresql+=" and (crm_khxx.zkje="+zkje+") ";
	}
	fzxm=request.getParameter("fzxm");
	if (fzxm!=null)
	{
		fzxm=cf.GB2Uni(fzxm);
		if (!(fzxm.equals("")))	wheresql+=" and  (crm_khxx.fzxm='"+fzxm+"')";
	}


	zpsgd=request.getParameter("zpsgd");
	if (zpsgd!=null)
	{
		zpsgd=cf.GB2Uni(zpsgd);
		if (!(zpsgd.equals("")))	wheresql+=" and  (crm_khxx.zpsgd='"+zpsgd+"')";
	}
	zpyy=request.getParameter("zpyy");
	if (zpyy!=null)
	{
		zpyy=cf.GB2Uni(zpyy);
		if (!(zpyy.equals("")))	wheresql+=" and  (crm_khxx.zpyy='"+zpyy+"')";
	}
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+pdclzt+"')";
	}
	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (crm_khxx.hdbz='"+hdbz+"')";
	}
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+zt+"')";
	}
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (crm_khxx.khlxbm='"+khlxbm+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_khxx.lrr='"+lrr+"')";
	}

	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,DECODE(crm_khxx.pdclzt,'1','申请派单','2','人工派单','5','电子派单','6','特权派单','7','拒单','8','换施工队','4','不许修改派单') pdclzt";
	ls_sql+=" ,DECODE(pd_pdjl.kczbbl,'0','不扣指标','1','扣除单倍派单额','2','扣除2倍派单额','3','扣除3倍派单额') kczbbl,sgdmc,pd_pdjl.sgbz,pd_pdjl.zjxm";
	ls_sql+=" ,DECODE(pd_pdjl.jlbz,'0','人工派单','1','回单奖励','2','公司奖励','3','设计师指定派单','4','客户指定派单','5','大单抵小单','6','小单抵大单','7','特殊情况','8','电子派单','9','同小区派单') jlbz";
	ls_sql+=" ,pd_pdjl.pdsm,pd_pdjl.pdsj,pd_pdjl.pdr,DECODE(pd_pdjl.shzzb,'Y','占指标','N','不占') shzzb,pd_pdjl.sgdyxj,jyjdrq";
	ls_sql+=" ,DECODE(crm_khxx.hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') hdbz";
	ls_sql+=" ,pd_pdjl.sgd,khxm,fwdz,sjs,sq_dwxx.dwmc,DECODE(pd_pdjl.hfjl,'0','接受','3','拒单') hfjl,pd_pdjl.hfr,pd_pdjl.hfsj,pd_pdjl.jjyy";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,pd_pdjl ";
    ls_sql+=" where pd_pdjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and pd_pdjl.sgd=sq_sgd.sgd(+)  ";
	ls_sql+=" and pd_pdjl.kppdbz='2'";//1：非考评派单；2：考评派单
	ls_sql+=wheresql;
    ls_sql+=" order by pd_pdjl.pdsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxScList.jsp","SelectScCrm_khxx.jsp","","");
	pageObj.setPageRow(50);//设置每页显示记录数
//设置显示列
	String[] disColName={"hth","khxm","pdclzt","sgdmc","jlbz","pdsj","pdr","shzzb","hfjl","kczbbl","hfsj","hfr","jjyy","pdsm","fwdz","sjs","dwmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"khbh","sgd"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除拒单信息"};//按钮的显示名称
	String[] buttonLink={"DeletePd_sgdjdjl.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);


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
  <B><font size="3">删除--拒绝接单信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">合同号</td>
	<td  width="4%">姓名</td>
	<td  width="4%">派单状态</td>
	<td  width="4%">施工队</td>
	<td  width="4%">派单类型</td>
	<td  width="5%">派单时间</td>
	<td  width="3%">派单人</td>
	<td  width="3%">是否占指标</td>
	<td  width="3%">是否拒单</td>
	<td  width="6%">拒单扣除派单指标比例</td>
	<td  width="5%">拒单录入时间</td>
	<td  width="3%">拒单录入人</td>
	<td  width="13%">拒单原因</td>
	<td  width="13%">派单说明</td>
	<td  width="12%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="7%">签约店面</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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