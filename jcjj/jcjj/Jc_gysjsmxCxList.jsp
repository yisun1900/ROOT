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
	String wheresql2="";
	String wheresql3="";


	String cwzq=null;
	cwzq=request.getParameter("cwzq");
	if (cwzq!=null)
	{
		cwzq=cf.GB2Uni(cwzq);
		if (!(cwzq.equals("")))	wheresql+=" and  (jc_gysjs.cwzq like '%"+cwzq+"%')";
	}
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
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
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}


	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql2+=" and  (jc_zcdd.ddbh='"+ddbh+"')";
		if (!(ddbh.equals("")))	wheresql3+=" and  (jc_zczjx.ddbh='"+ddbh+"')";
	}


	String zcdlbm=null;
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql2+=" and  (jc_zcdd.zcdlbm='"+zcdlbm+"')";
		if (!(zcdlbm.equals("")))	wheresql3+=" and  (jc_zczjx.zcdlbm='"+zcdlbm+"')";
	}
	String zcxlbm=null;
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql2+=" and  (jc_zcdd.zcxlbm='"+zcxlbm+"')";
		if (!(zcxlbm.equals("")))	wheresql3+=" and  (jc_zczjx.zcxlbm='"+zcxlbm+"')";
	}
	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql2+=" and  (jc_zcdd.ppbm='"+ppbm+"')";
		if (!(ppbm.equals("")))	wheresql3+=" and  (jc_zczjx.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql2+=" and  (jc_zcdd.ppbm like '%"+ppbm2+"%')";
		if (!(ppbm2.equals("")))	wheresql3+=" and  (jc_zczjx.ppbm like '%"+ppbm2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql2+=" and  (jc_zcdd.ppmc='"+ppmc+"')";
		if (!(ppmc.equals("")))	wheresql3+=" and  (jc_zczjx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql2+=" and  (jc_zcdd.ppmc like '%"+ppmc2+"%')";
		if (!(ppmc2.equals("")))	wheresql3+=" and  (jc_zczjx.ppmc like '%"+ppmc2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql2+=" and  (jc_zcdd.gys='"+gys+"')";
		if (!(gys.equals("")))	wheresql3+=" and  (jc_zczjx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql2+=" and  (jc_zcdd.gys like '%"+gys2+"%')";
		if (!(gys2.equals("")))	wheresql3+=" and  (jc_zczjx.gys like '%"+gys2+"%')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql2+=" and  (jc_zcdd.ztjjgw='"+ztjjgw+"')";
		if (!(ztjjgw.equals("")))	wheresql3+=" and  (jc_zczjx.ztjjgw='"+ztjjgw+"')";
	}
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql2+=" and  (jc_zcdd.clgw='"+clgw+"')";
		if (!(clgw.equals("")))	wheresql3+=" and  (jc_zczjx.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql2+=" and  (jc_zcdd.xmzy='"+xmzy+"')";
		if (!(xmzy.equals("")))	wheresql3+=" and  (jc_zczjx.xmzy='"+xmzy+"')";
	}
	
	
	
	String jsjlh=null;
	String jssj=null;
	String jsr=null;

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+=" and  (jc_gysjs.shbz='"+shbz+"')";
	}
	
	
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=jsjlh.trim();
		if (!(jsjlh.equals("")))	wheresql+=" and (jc_gysjs.jsjlh="+jsjlh+") ";
	}

	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jc_gysjs.jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jc_gysjs.jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (jc_gysjs.jsr='"+jsr+"')";
	}
	
	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (jc_gysjs.shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (jc_gysjs.shsj<=TO_DATE('"+shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	String shr=null;
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (jc_gysjs.shr='"+shr+"')";
	}

	String ddqrsj=null;
	ddqrsj=request.getParameter("ddqrsj");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql2+="  and (jc_zcdd.ddqrsj>=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
		if (!(ddqrsj.equals("")))	wheresql3+="  and (jc_zczjx.qrsj>=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
	}
	ddqrsj=request.getParameter("ddqrsj2");
	if (ddqrsj!=null)
	{
		ddqrsj=ddqrsj.trim();
		if (!(ddqrsj.equals("")))	wheresql2+="  and (jc_zcdd.ddqrsj<=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
		if (!(ddqrsj.equals("")))	wheresql3+="  and (jc_zczjx.qrsj<=TO_DATE('"+ddqrsj+"','YYYY/MM/DD'))";
	}

	String gysjslrsj=null;
	gysjslrsj=request.getParameter("gysjslrsj");
	if (gysjslrsj!=null)
	{
		gysjslrsj=gysjslrsj.trim();
		if (!(gysjslrsj.equals("")))	wheresql2+="  and (jc_zcdd.gysjslrsj>=TO_DATE('"+gysjslrsj+"','YYYY/MM/DD'))";
		if (!(gysjslrsj.equals("")))	wheresql3+="  and (jc_zczjx.jssj>=TO_DATE('"+gysjslrsj+"','YYYY/MM/DD'))";
	}
	gysjslrsj=request.getParameter("gysjslrsj2");
	if (gysjslrsj!=null)
	{
		gysjslrsj=gysjslrsj.trim();
		if (!(gysjslrsj.equals("")))	wheresql2+="  and (jc_zcdd.gysjslrsj<=TO_DATE('"+gysjslrsj+"','YYYY/MM/DD'))";
		if (!(gysjslrsj.equals("")))	wheresql3+="  and (jc_zczjx.jssj<=TO_DATE('"+gysjslrsj+"','YYYY/MM/DD'))";
	}


	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");

	ls_sql="SELECT jc_gysjs.jsjlh,jc_gysjs.jsr,jc_gysjs.jssj,DECODE(jc_gysjs.shbz,'N','未审核','Y','审核','F','结算付款') shbz,jc_gysjs.ppbm,jc_gysjs.gys,TO_CHAR(jc_gysjs.jsje) jsje,TO_CHAR(jc_gysjs.cbzj) cbzj,TO_CHAR(jc_gysjs.ycfzj) ycfzj,TO_CHAR(jc_gysjs.qtfzj) qtfzj,TO_CHAR(jc_gysjs.kcfy) kcfy,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,jc_gysjsmx.ddbh,jc_zcdd.cbze,ROUND(NVL(jc_zcdd.ycf,2)+NVL(jc_zcdd.qtf,2),2),jc_zcdd.clgw ";
	ls_sql+=" FROM jc_gysjs,jc_gysjsmx,crm_khxx,jc_zcdd  ";
    ls_sql+=" where jc_gysjs.jsjlh=jc_gysjsmx.jsjlh";
    ls_sql+=" and jc_gysjsmx.ddbh=jc_zcdd.ddbh";
    ls_sql+=" and jc_zcdd.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_gysjs.lx='2'";//1：订单；2：代购主材
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=wheresql2;

    ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT jc_gysjs.jsjlh,jc_gysjs.jsr,jc_gysjs.jssj,DECODE(jc_gysjs.shbz,'N','未审核','Y','审核','F','结算付款') shbz,jc_gysjs.ppbm,jc_gysjs.gys,TO_CHAR(jc_gysjs.jsje) jsje,TO_CHAR(jc_gysjs.cbzj) cbzj,TO_CHAR(jc_gysjs.ycfzj) ycfzj,TO_CHAR(jc_gysjs.qtfzj) qtfzj,TO_CHAR(jc_gysjs.kcfy) kcfy,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,jc_gysjsmx.ddbh,jc_zczjx.zjxcbze,ROUND(NVL(jc_zczjx.zjxycf,2)+NVL(jc_zczjx.zjxqtf,2),2),jc_zczjx.clgw";
	ls_sql+=" FROM jc_gysjs,jc_gysjsmx,crm_khxx,jc_zczjx  ";
    ls_sql+=" where jc_gysjs.jsjlh=jc_gysjsmx.jsjlh";
    ls_sql+=" and jc_gysjsmx.ddbh=jc_zczjx.zjxbh";
    ls_sql+=" and jc_zczjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_gysjs.lx='2'";//1：订单；2：代购主材
 	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=wheresql3;

//    ls_sql+=" order by jc_gysjs.jsjlh,crm_khxx.khxm,jc_gysjsmx.ddbh desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_gysjsmxCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"jsjlh","gys","jssj","jsr","cbzj","ycfzj","qtfzj","kcfy","jsje","jssm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_gysjs.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">结算明细－查询</font></B>
</CENTER>
<div style="height:100%;width:100%;overflow:auto;">
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150,2,5);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">结算记录号</td>
	<td  width="3%">结算人</td>
	<td  width="5%">结算时间</td>
	<td  width="4%">审核标志</td>
	<td  width="6%">品牌</td>
	<td  width="11%">供应商</td>
	<td  width="5%">结算金额</td>
	<td  width="5%">材料成本</td>
	<td  width="5%">远程费</td>
	<td  width="5%">其它费</td>
	<td  width="5%">扣除费用</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">合同号</td>
	<td  width="13%">房屋地址</td>
	<td  width="4%">订单编号</td>
	<td  width="5%">订单材料成本</td>
	<td  width="5%">订单其它费</td>
	<td  width="3%">家居顾问</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>