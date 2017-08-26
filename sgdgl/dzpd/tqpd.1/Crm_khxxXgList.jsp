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

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
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
		if (!(jlbz.equals("")))	wheresql+=" and  (crm_khxx.jlbz='"+jlbz+"')";
	}
	String pdsm=null;
	pdsm=request.getParameter("pdsm");
	if (pdsm!=null)
	{
		pdsm=cf.GB2Uni(pdsm);
		if (!(pdsm.equals("")))	wheresql+=" and  (crm_khxx.pdsm like '%"+pdsm+"%')";
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
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String pdsj=null;
	pdsj=request.getParameter("pdsj");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}

	
	
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm='"+khxm+"')";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (xb='"+xb+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (fwdz='"+fwdz+"')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (lxfs='"+lxfs+"')";
	}
	fgflbm=request.getParameter("fgflbm");
	if (fgflbm!=null)
	{
		fgflbm=cf.GB2Uni(fgflbm);
		if (!(fgflbm.equals("")))	wheresql+=" and  (fgflbm='"+fgflbm+"')";
	}
	zxjwbm=request.getParameter("zxjwbm");
	if (zxjwbm!=null)
	{
		zxjwbm=cf.GB2Uni(zxjwbm);
		if (!(zxjwbm.equals("")))	wheresql+=" and  (zxjwbm='"+zxjwbm+"')";
	}
	hxmjbm=request.getParameter("hxmjbm");
	if (hxmjbm!=null)
	{
		hxmjbm=cf.GB2Uni(hxmjbm);
		if (!(hxmjbm.equals("")))	wheresql+=" and  (hxmjbm='"+hxmjbm+"')";
	}
	ysbm=request.getParameter("ysbm");
	if (ysbm!=null)
	{
		ysbm=cf.GB2Uni(ysbm);
		if (!(ysbm.equals("")))	wheresql+=" and  (ysbm='"+ysbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (hth='"+hth+"')";
	}
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (sjs='"+sjs+"')";
	}
	qye=request.getParameter("qye");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (qye>="+qye+") ";
	}
	qye=request.getParameter("qye2");
	if (qye!=null)
	{
		qye=qye.trim();
		if (!(qye.equals("")))	wheresql+=" and (qye<="+qye+") ";
	}
	sfyyh=request.getParameter("sfyyh");
	if (sfyyh!=null)
	{
		sfyyh=cf.GB2Uni(sfyyh);
		if (!(sfyyh.equals("")))	wheresql+=" and  (sfyyh='"+sfyyh+"')";
	}
	yhzj=request.getParameter("yhzj");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (yhzj>="+yhzj+") ";
	}
	yhzj=request.getParameter("yhzj2");
	if (yhzj!=null)
	{
		yhzj=yhzj.trim();
		if (!(yhzj.equals("")))	wheresql+=" and (yhzj<="+yhzj+") ";
	}
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (jyjdrq>=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	jyjdrq=request.getParameter("jyjdrq2");
	if (jyjdrq!=null)
	{
		if (!(jyjdrq.equals("")))	wheresql+="  and (jyjdrq<=TO_DATE('"+jyjdrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq>=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	kgrq=request.getParameter("kgrq2");
	if (kgrq!=null)
	{
		kgrq=kgrq.trim();
		if (!(kgrq.equals("")))	wheresql+="  and (kgrq<=TO_DATE('"+kgrq+"','YYYY/MM/DD'))";
	}
	skje=request.getParameter("skje");
	if (skje!=null)
	{
		skje=skje.trim();
		if (!(skje.equals("")))	wheresql+=" and (skje="+skje+") ";
	}
	skrq=request.getParameter("skrq");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (skrq>=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	skrq=request.getParameter("skrq2");
	if (skrq!=null)
	{
		skrq=skrq.trim();
		if (!(skrq.equals("")))	wheresql+="  and (skrq<=TO_DATE('"+skrq+"','YYYY/MM/DD'))";
	}
	zkje=request.getParameter("zkje");
	if (zkje!=null)
	{
		zkje=zkje.trim();
		if (!(zkje.equals("")))	wheresql+=" and (zkje="+zkje+") ";
	}
	fzxm=request.getParameter("fzxm");
	if (fzxm!=null)
	{
		fzxm=cf.GB2Uni(fzxm);
		if (!(fzxm.equals("")))	wheresql+=" and  (fzxm='"+fzxm+"')";
	}

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	pdlx=request.getParameter("pdlx");
	if (pdlx!=null)
	{
		pdlx=cf.GB2Uni(pdlx);
		if (!(pdlx.equals("")))	wheresql+=" and  (pdlx='"+pdlx+"')";
	}
	zpsgd=request.getParameter("zpsgd");
	if (zpsgd!=null)
	{
		zpsgd=cf.GB2Uni(zpsgd);
		if (!(zpsgd.equals("")))	wheresql+=" and  (zpsgd='"+zpsgd+"')";
	}
	zpyy=request.getParameter("zpyy");
	if (zpyy!=null)
	{
		zpyy=cf.GB2Uni(zpyy);
		if (!(zpyy.equals("")))	wheresql+=" and  (zpyy='"+zpyy+"')";
	}
	pdclzt=request.getParameter("pdclzt");
	if (pdclzt!=null)
	{
		pdclzt=cf.GB2Uni(pdclzt);
		if (!(pdclzt.equals("")))	wheresql+=" and  (pdclzt='"+pdclzt+"')";
	}
	hdbz=request.getParameter("hdbz");
	if (hdbz!=null)
	{
		hdbz=cf.GB2Uni(hdbz);
		if (!(hdbz.equals("")))	wheresql+=" and  (hdbz='"+hdbz+"')";
	}
	zt=request.getParameter("zt");
	if (zt!=null)
	{
		zt=cf.GB2Uni(zt);
		if (!(zt.equals("")))	wheresql+=" and  (zt='"+zt+"')";
	}
	khlxbm=request.getParameter("khlxbm");
	if (khlxbm!=null)
	{
		khlxbm=cf.GB2Uni(khlxbm);
		if (!(khlxbm.equals("")))	wheresql+=" and  (khlxbm='"+khlxbm+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}

	ls_sql="SELECT khbh,DECODE(pdclzt,'1','申请派单','2','派单','3','拒绝派单','4','接受','5','保持原派','6','同意改派')";
	ls_sql+=" ,sgdmc sgd,sgbz,zjxm,DECODE(jlbz,1,'回单奖励',2,'公司奖励'),pdsm,pdsj,pdr,jyjdrq,DECODE(hdbz,'1','非回单','2','设计师回单','3','施工队回单'),khxm,fwdz";
	ls_sql+=" ,sjs,a.dwmc sqdm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd ";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)  and zt='2' ";
	ls_sql+=wheresql;
    ls_sql+=" order by khbh desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxXgList.jsp","SelectXgCrm_khxx.jsp","","EditXgCrm_khxx.jsp");
//	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","khxm","xb","fwdz","lxfs","qyrq","kgrq","dwbh","lrsj","hdbz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("派单");
//设置按钮参数
	String[] buttonName={"派单完成","删除派单信息"};//按钮的显示名称
	String[] buttonLink={"endpd.jsp","deletepd.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(145);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">客户编号</td>
	<td  width="4%">派单状态</td>
	<td  width="4%">施工队</td>
	<td  width="4%">班组</td>
	<td  width="4%">质检</td>
	<td  width="5%">派单奖励</td>
	<td  width="10%">派单说明</td>
	<td  width="6%">派单时间</td>
	<td  width="4%">派单人</td>
	<td  width="6%">交底日期</td>
	<td  width="5%">回单标志</td>
	<td  width="4%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="7%">签约店面</td>
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