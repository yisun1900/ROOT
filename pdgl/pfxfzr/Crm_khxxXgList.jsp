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
		if (!(pdsj.equals("")))	wheresql+="  and (crm_khxx.pdsj>=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
	}
	pdsj=request.getParameter("pdsj2");
	if (pdsj!=null)
	{
		if (!(pdsj.equals("")))	wheresql+="  and (crm_khxx.pdsj<=TO_DATE('"+pdsj+"','YYYY/MM/DD'))";
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

	pdlx=request.getParameter("pdlx");
	if (pdlx!=null)
	{
		pdlx=cf.GB2Uni(pdlx);
		if (!(pdlx.equals("")))	wheresql+=" and  (crm_khxx.pdlx='"+pdlx+"')";
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

	ls_sql="SELECT crm_khxx.khbh,hth,DECODE(pdclzt,'1','申请派单','2','人工派单','5','电子派单','6','特权派单','7','拒单','8','换施工队','4','不许修改派单') pdclzt,DECODE(kgsjqd,'Y','已确定','N','<font color=\"#FF00FF\">未确定</font>') kgsjqd";
	ls_sql+=" ,pd_pdjl.sgd,sgdmc,crm_khxx.sgbz,crm_khxx.zjxm,DECODE(crm_khxx.jlbz,'0','人工派单','1','回单奖励','2','公司奖励','3','设计师指定派单','4','客户指定派单','5','大单抵小单','6','小单抵大单','7','特殊情况','8','电子派单','9','同小区派单') jlbz,crm_khxx.pdsm,crm_khxx.pdsj,crm_khxx.pdr,DECODE(pd_pdjl.shzzb,'Y','占指标','N','不占') shzzb,pd_pdjl.sgdyxj,jyjdrq,DECODE(hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他') hdbz,khxm,fwdz";
	ls_sql+=" ,sjs,sq_dwxx.dwmc sqdm";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,pd_pdjl ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and pd_pdjl.sgd=sq_sgd.sgd(+)  and zt='2'";
    ls_sql+=" and crm_khxx.pdsj is not null and gcjdbm!='5' ";
	ls_sql+=" and crm_khxx.khbh=pd_pdjl.khbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
//	ls_sql+=" and crm_khxx.pdclzt='2'";//1：申请派单；2：人工派单；5：电子派单；6：特权派单；7：拒单；8：换施工队；4：不许修改派单
	ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.pdsj desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxXgList.jsp","SelectXgCrm_khxx.jsp","","EditXgCrm_khxxMain.jsp");
	pageObj.setPageRow(15);//设置每页显示记录数
//设置显示列
	String[] disColName={"hth","khxm","pdclzt","sgdmc","sgbz","zjxm","jlbz","pdsj","pdr","shzzb","pdsm","kgsjqd","jyjdrq","hdbz","fwdz","sjs","sqdm"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"khbh","sgd"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("派单");
//设置按钮参数
	String[] buttonName={"删除派单信息"};//按钮的显示名称
	String[] buttonLink={"deletepd.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
*/
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
  <B><font size="3"> 修改派工（注意：已完结不能再修改）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="4%">派单状态</td>
	<td  width="4%">施工队</td>
	<td  width="3%">班组</td>
	<td  width="3%">质检</td>
	<td  width="6%">派单类型</td>
	<td  width="5%">派单时间</td>
	<td  width="3%">派单人</td>
	<td  width="3%">是否占指标</td>
	<td  width="14%">派单说明</td>
	<td  width="3%">开工时间</td>
	<td  width="5%">交底日期</td>
	<td  width="5%">回单标志</td>
	<td  width="14%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="9%">签约店面</td>
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