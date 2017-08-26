<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fjtcbz=null;
	fjtcbz=request.getParameter("fjtcbz");
	if (fjtcbz!=null)
	{
		fjtcbz=cf.GB2Uni(fjtcbz);
		if (!(fjtcbz.equals("")))	wheresql+=" and  (crm_khxx.fjtcbz='"+fjtcbz+"')";
	}


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
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
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	
	String crm_khxx_qyrq=null;
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}

	String jgwzbm=null;
	String cpbm=null;
	String sku=null;
	String tccpdlbm=null;
	String tccplbbm=null;
	String tcsjflbm=null;
	String cpmc=null;
	String ppmc=null;
	String gysmc=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	String xdjldw=null;
	String sfcscp=null;
	String bjjbbm=null;

	jgwzbm=request.getParameter("jgwzbm");
	if (jgwzbm!=null)
	{
		jgwzbm=cf.GB2Uni(jgwzbm);
		if (!(jgwzbm.equals("")))	wheresql+=" and  (bj_khzcxm.jgwzbm='"+jgwzbm+"')";
	}
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (bj_khzcxm.cpbm='"+cpbm+"')";
	}
	sku=request.getParameter("sku");
	if (sku!=null)
	{
		sku=cf.GB2Uni(sku);
		if (!(sku.equals("")))	wheresql+=" and  (bj_khzcxm.sku='"+sku+"')";
	}
	tccpdlbm=request.getParameter("tccpdlbm");
	if (tccpdlbm!=null)
	{
		tccpdlbm=tccpdlbm.trim();
		if (!(tccpdlbm.equals("")))	wheresql+=" and (bj_khzcxm.tccpdlbm="+tccpdlbm+") ";
	}
	tccplbbm=request.getParameter("tccplbbm");
	if (tccplbbm!=null)
	{
		tccplbbm=tccplbbm.trim();
		if (!(tccplbbm.equals("")))	wheresql+=" and (bj_khzcxm.tccplbbm="+tccplbbm+") ";
	}
	tcsjflbm=request.getParameter("tcsjflbm");
	if (tcsjflbm!=null)
	{
		tcsjflbm=cf.GB2Uni(tcsjflbm);
		if (!(tcsjflbm.equals("")))	wheresql+=" and  (bj_khzcxm.tcsjflbm='"+tcsjflbm+"')";
	}
	cpmc=request.getParameter("cpmc");
	if (cpmc!=null)
	{
		cpmc=cf.GB2Uni(cpmc);
		if (!(cpmc.equals("")))	wheresql+=" and  (bj_khzcxm.cpmc like '%"+cpmc+"%')";
	}
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (bj_khzcxm.ppmc='"+ppmc+"')";
	}
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (bj_khzcxm.gysmc='"+gysmc+"')";
	}
	xh=request.getParameter("xh");
	if (xh!=null)
	{
		xh=cf.GB2Uni(xh);
		if (!(xh.equals("")))	wheresql+=" and  (bj_khzcxm.xh like '%"+xh+"%')";
	}
	gg=request.getParameter("gg");
	if (gg!=null)
	{
		gg=cf.GB2Uni(gg);
		if (!(gg.equals("")))	wheresql+=" and  (bj_khzcxm.gg like '%"+gg+"%')";
	}
	jldw=request.getParameter("jldw");
	if (jldw!=null)
	{
		jldw=cf.GB2Uni(jldw);
		if (!(jldw.equals("")))	wheresql+=" and  (bj_khzcxm.jldw='"+jldw+"')";
	}
	xdjldw=request.getParameter("xdjldw");
	if (xdjldw!=null)
	{
		xdjldw=cf.GB2Uni(xdjldw);
		if (!(xdjldw.equals("")))	wheresql+=" and  (bj_khzcxm.xdjldw='"+xdjldw+"')";
	}
	sfcscp=request.getParameter("sfcscp");
	if (sfcscp!=null)
	{
		sfcscp=cf.GB2Uni(sfcscp);
		if (!(sfcscp.equals("")))	wheresql+=" and  (bj_khzcxm.sfcscp='"+sfcscp+"')";
	}
	bjjbbm=request.getParameter("bjjbbm");
	if (bjjbbm!=null)
	{
		bjjbbm=cf.GB2Uni(bjjbbm);
		if (!(bjjbbm.equals("")))	wheresql+=" and  (bj_khzcxm.bjjbbm='"+bjjbbm+"')";
	}

	ls_sql="SELECT DECODE(crm_khxx.fjtcbz,'Y','分解','N','未分解','M','非套餐'),bj_khzcxm.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs    ,bj_khzcxm.cpmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.xdjldw,CEIL(sl*xdb*(100+sh)/100),bj_khzcxm.jsj,ROUND(bj_khzcxm.jsj*CEIL(sl*xdb*(100+sh)/100),2),bj_khzcxm.jldw,bj_khzcxm.xdb,bj_khzcxm.ppmc,bj_khzcxm.gysmc,bj_khzcxm.cpbm,bj_khzcxm.jgwzbm     ,bj_khzcxm.sh, DECODE(bj_khzcxm.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理')  , DECODE(bj_khzcxm.sfcscp,'Y','是','N','否'),bj_khzcxm.sku   ,bj_khzcxm.ptcpsm,bjjbmc,jxc_cldlbm.cldlmc,clxlmc,tcsjflmc,bj_khzcxm.xuhao,bj_khzcxm.bz,crm_khxx.qyrq ";
	ls_sql+=" FROM bj_khzcxm,crm_khxx,jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_tcsjflbm  ";
    ls_sql+=" where bj_khzcxm.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.tcsjflbm=bj_tcsjflbm.tcsjflbm(+)";
	ls_sql+=" and crm_khxx.zt not in('3')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by bj_khzcxm.khbh,bj_khzcxm.cpmc ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_khzcxmCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"khbh","jgwzbm","cpbm"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

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
  <B><font size="3">套餐客户主材查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">分解标志</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">客户姓名</td>
	<td  width="6%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="2%">设计师</td>

	<td  width="5%">产品名称</td>
	<td  width="5%">型号</td>
	<td  width="5%">规格</td>
	<td  width="2%">订货单位</td>
	<td  width="2%">订货数量</td>
	<td  width="2%">结算价</td>
	<td  width="2%">结算金额</td>
	<td  width="2%">报价计量单位</td>
	<td  width="2%">下单比</td>
	<td  width="5%">品牌</td>
	<td  width="5%">供应商名称</td>
	<td  width="3%">产品编码</td>
	<td  width="3%">结构位置</td>
	<td  width="2%">损耗</td>
	<td  width="2%">是否需处理小数</td>
	<td  width="2%">是否超市产品</td>
	<td  width="3%">SKU号</td>
	<td  width="6%">配套产品说明</td>
	<td  width="3%">报价级别</td>
	<td  width="5%">产品大类</td>
	<td  width="5%">产品类别</td>
	<td  width="3%">套餐升级分类</td>
	<td  width="1%">排序序号</td>
	<td  width="6%">备注</td>
	<td  width="4%">签约日期</td>
</tr>
<%
	pageObj.printDateSum();
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