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


	
	String cw_khjsty_spr=null;
	String cw_khjsty_spsj=null;
	String cw_khjsty_lx=null;
	String cw_khjsty_clzt=null;
	String cw_khjsty_lrr=null;
	String cw_khjsty_lrsj=null;



	cw_khjsty_spr=request.getParameter("cw_khjsty_spr");
	if (cw_khjsty_spr!=null)
	{
		cw_khjsty_spr=cf.GB2Uni(cw_khjsty_spr);
		if (!(cw_khjsty_spr.equals("")))	wheresql+=" and  (cw_khjsty.spr='"+cw_khjsty_spr+"')";
	}
	cw_khjsty_spsj=request.getParameter("cw_khjsty_spsj");
	if (cw_khjsty_spsj!=null)
	{
		cw_khjsty_spsj=cw_khjsty_spsj.trim();
		if (!(cw_khjsty_spsj.equals("")))	wheresql+="  and (cw_khjsty.spsj>=TO_DATE('"+cw_khjsty_spsj+"','YYYY-MM-DD'))";
	}
	cw_khjsty_spsj=request.getParameter("cw_khjsty_spsj2");
	if (cw_khjsty_spsj!=null)
	{
		cw_khjsty_spsj=cw_khjsty_spsj.trim();
		if (!(cw_khjsty_spsj.equals("")))	wheresql+="  and (cw_khjsty.spsj<=TO_DATE('"+cw_khjsty_spsj+"','YYYY-MM-DD'))";
	}
	cw_khjsty_lx=request.getParameter("cw_khjsty_lx");
	if (cw_khjsty_lx!=null)
	{
		cw_khjsty_lx=cf.GB2Uni(cw_khjsty_lx);
		if (!(cw_khjsty_lx.equals("")))	wheresql+=" and  (cw_khjsty.lx='"+cw_khjsty_lx+"')";
	}
	cw_khjsty_clzt=request.getParameter("cw_khjsty_clzt");
	if (cw_khjsty_clzt!=null)
	{
		cw_khjsty_clzt=cf.GB2Uni(cw_khjsty_clzt);
		if (!(cw_khjsty_clzt.equals("")))	wheresql+=" and  (cw_khjsty.clzt='"+cw_khjsty_clzt+"')";
	}
	cw_khjsty_lrr=request.getParameter("cw_khjsty_lrr");
	if (cw_khjsty_lrr!=null)
	{
		cw_khjsty_lrr=cf.GB2Uni(cw_khjsty_lrr);
		if (!(cw_khjsty_lrr.equals("")))	wheresql+=" and  (cw_khjsty.lrr='"+cw_khjsty_lrr+"')";
	}
	cw_khjsty_lrsj=request.getParameter("cw_khjsty_lrsj");
	if (cw_khjsty_lrsj!=null)
	{
		cw_khjsty_lrsj=cw_khjsty_lrsj.trim();
		if (!(cw_khjsty_lrsj.equals("")))	wheresql+="  and (cw_khjsty.lrsj>=TO_DATE('"+cw_khjsty_lrsj+"','YYYY-MM-DD'))";
	}
	cw_khjsty_lrsj=request.getParameter("cw_khjsty_lrsj2");
	if (cw_khjsty_lrsj!=null)
	{
		cw_khjsty_lrsj=cw_khjsty_lrsj.trim();
		if (!(cw_khjsty_lrsj.equals("")))	wheresql+="  and (cw_khjsty.lrsj<=TO_DATE('"+cw_khjsty_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	ls_sql="SELECT DECODE(cw_khjsty.lx,'1','个性化','2','套餐') lx, DECODE(cw_khjsty.clzt,'1','未审批','2','审批同意','3','审批不同意'),cw_khjsty.khbh,crm_khxx.khxm,crm_khxx.fwdz,cw_khjsty.htsjf,cw_khjsty.sssjf,cw_khjsty.wdzgce,cw_khjsty.qye,cw_khjsty.zqljzjx,cw_khjsty.zhljzjx,cw_khjsty.zqhj,cw_khjsty.zhhj,cw_khjsty.jsze,cw_khjsty.yjzxk,cw_khjsty.dj,cw_khjsty.yjwk,cw_khjsty.yhje,cw_khjsty.fqbl,cw_khjsty.fqje,cw_khjsty.djfxje,cw_khjsty.dyq,cw_khjsty.yhze,cw_khjsty.shfqje,cw_khjsty.yjzck,cw_khjsty.zcddjezq,cw_khjsty.zcddyh,cw_khjsty.dgzcjezq,cw_khjsty.dgzcyh,cw_khjsty.zcjsje,cw_khjsty.pck,cw_khjsty.khbjk,cw_khjsty.lrr,cw_khjsty.lrsj,dwmc,cw_khjsty.bz  ";
	ls_sql+=" FROM crm_khxx,cw_khjsty,sq_dwxx  ";
    ls_sql+=" where cw_khjsty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_khjsty.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_khjsty.lx='1'";
    ls_sql+=" and cw_khjsty.clzt='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_khjsty.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_khjstySpList.jsp","","","ShCw_khjsty.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审核");
//设置按钮参数
	String[] buttonName={"批量同意"};//按钮的显示名称
	String[] buttonLink={"SavePlCw_khjsty.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/cwgl/jrkhjs/ViewGxhCw_khjsty.jsp";//为列参数：coluParm.link设置超级链接
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
	<td  width="2%">结算人</td>
	<td  width="2%">结算时间</td>
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