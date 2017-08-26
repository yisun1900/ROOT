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


	
	String cw_jrkhjs_spr=null;
	String cw_jrkhjs_spsj=null;
	String cw_jrkhjs_lx=null;
	String cw_jrkhjs_clzt=null;
	String cw_jrkhjs_lrr=null;
	String cw_jrkhjs_lrsj=null;



	cw_jrkhjs_spr=request.getParameter("cw_jrkhjs_spr");
	if (cw_jrkhjs_spr!=null)
	{
		cw_jrkhjs_spr=cf.GB2Uni(cw_jrkhjs_spr);
		if (!(cw_jrkhjs_spr.equals("")))	wheresql+=" and  (cw_jrkhjs.spr='"+cw_jrkhjs_spr+"')";
	}
	cw_jrkhjs_spsj=request.getParameter("cw_jrkhjs_spsj");
	if (cw_jrkhjs_spsj!=null)
	{
		cw_jrkhjs_spsj=cw_jrkhjs_spsj.trim();
		if (!(cw_jrkhjs_spsj.equals("")))	wheresql+="  and (cw_jrkhjs.spsj=TO_DATE('"+cw_jrkhjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrkhjs_lx=request.getParameter("cw_jrkhjs_lx");
	if (cw_jrkhjs_lx!=null)
	{
		cw_jrkhjs_lx=cf.GB2Uni(cw_jrkhjs_lx);
		if (!(cw_jrkhjs_lx.equals("")))	wheresql+=" and  (cw_jrkhjs.lx='"+cw_jrkhjs_lx+"')";
	}
	cw_jrkhjs_clzt=request.getParameter("cw_jrkhjs_clzt");
	if (cw_jrkhjs_clzt!=null)
	{
		cw_jrkhjs_clzt=cf.GB2Uni(cw_jrkhjs_clzt);
		if (!(cw_jrkhjs_clzt.equals("")))	wheresql+=" and  (cw_jrkhjs.clzt='"+cw_jrkhjs_clzt+"')";
	}
	cw_jrkhjs_lrr=request.getParameter("cw_jrkhjs_lrr");
	if (cw_jrkhjs_lrr!=null)
	{
		cw_jrkhjs_lrr=cf.GB2Uni(cw_jrkhjs_lrr);
		if (!(cw_jrkhjs_lrr.equals("")))	wheresql+=" and  (cw_jrkhjs.lrr='"+cw_jrkhjs_lrr+"')";
	}
	cw_jrkhjs_lrsj=request.getParameter("cw_jrkhjs_lrsj");
	if (cw_jrkhjs_lrsj!=null)
	{
		cw_jrkhjs_lrsj=cw_jrkhjs_lrsj.trim();
		if (!(cw_jrkhjs_lrsj.equals("")))	wheresql+="  and (cw_jrkhjs.lrsj=TO_DATE('"+cw_jrkhjs_lrsj+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT DECODE(cw_jrkhjs.lx,'1','个性化','2','套餐') lx, DECODE(cw_jrkhjs.clzt,'1','未审批','2','审批同意','3','审批不同意'),cw_jrkhjs.khbh,crm_khxx.khxm,crm_khxx.fwdz,cw_jrkhjs.htsjf,cw_jrkhjs.sssjf,cw_jrkhjs.wdzgce,cw_jrkhjs.qye,cw_jrkhjs.zqljzjx,cw_jrkhjs.zhljzjx,cw_jrkhjs.zqhj,cw_jrkhjs.zhhj,cw_jrkhjs.jsze,cw_jrkhjs.yjzxk,cw_jrkhjs.dj,cw_jrkhjs.yjwk,cw_jrkhjs.yhje,cw_jrkhjs.fqbl,cw_jrkhjs.fqje,cw_jrkhjs.djfxje,cw_jrkhjs.dyq,cw_jrkhjs.yhze,cw_jrkhjs.shfqje,cw_jrkhjs.yjzck,cw_jrkhjs.zcddjezq,cw_jrkhjs.zcddyh,cw_jrkhjs.dgzcjezq,cw_jrkhjs.dgzcyh,cw_jrkhjs.zcjsje,cw_jrkhjs.pck,cw_jrkhjs.khbjk,cw_jrkhjs.lrr,cw_jrkhjs.lrsj,dwmc,cw_jrkhjs.bz  ";
	ls_sql+=" FROM crm_khxx,cw_jrkhjs,sq_dwxx  ";
    ls_sql+=" where cw_jrkhjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_jrkhjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_jrkhjs.lx='1'";
    ls_sql+=" and cw_jrkhjs.clzt='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrkhjs.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrkhjsSpList.jsp","","","ShCw_jrkhjs.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");
//设置按钮参数
	String[] buttonName={"批量同意"};//按钮的显示名称
	String[] buttonLink={"SavePlCw_jrkhjs.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/jrkhjs/ViewGxhCw_jrkhjs.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("lx",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
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
  <B><font size="3">结算－审核</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(480);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">类型</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="2%">合同设计费</td>
	<td  width="2%">实收设计费</td>
	<td  width="3%">签约总额－折前</td>
	<td  width="3%">签约总额－折后</td>
	<td  width="2%">增减项总额－折前</td>
	<td  width="2%">增减项总额－折后</td>
	<td  width="3%">工程合计－折前</td>
	<td  width="3%">工程合计－折后</td>
	<td  width="3%">结算施工总额</td>
	<td  width="3%">已交装修款</td>
	<td  width="2%">定金转装修款</td>
	<td  width="2%">应交尾款</td>
	<td  width="3%">折扣优惠</td>
	<td  width="2%">返券比例</td>
	<td  width="2%">返券优惠</td>
	<td  width="2%">订金折现优惠</td>
	<td  width="2%">抵用券</td>
	<td  width="3%">优惠总额</td>
	<td  width="2%">收回返券金额</td>
	<td  width="2%">已交主材款</td>
	<td  width="2%">机电代销</td>
	<td  width="2%">机电代销优惠</td>
	<td  width="2%">代购主材</td>
	<td  width="2%">代购主材优惠</td>
	<td  width="2%">主材结算额</td>
	<td  width="2%">赔偿款延期费</td>
	<td  width="3%">客户补交款</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="32%">备注</td>
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