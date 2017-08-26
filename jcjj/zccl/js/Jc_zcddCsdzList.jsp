<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String yhmc=(String)session.getAttribute("yhmc");
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
	String wheresql2="";
	String wheresql3="";


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

	String wjsj=null;
	wjsj=request.getParameter("wjsj");
	if (wjsj!=null)
	{
		wjsj=wjsj.trim();
		if (!(wjsj.equals("")))	wheresql2+="  and (jc_zcdd.wjsj>=TO_DATE('"+wjsj+"','YYYY-MM-DD'))";
	}
	wjsj=request.getParameter("wjsj2");
	if (wjsj!=null)
	{
		wjsj=wjsj.trim();
		if (!(wjsj.equals("")))	wheresql2+="  and (jc_zcdd.wjsj<=TO_DATE('"+wjsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	String sshsj=null;
	sshsj=request.getParameter("sshsj");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql2+="  and (jc_zcdd.sshsj>=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
		if (!(sshsj.equals("")))	wheresql3+="  and (jc_zczjx.sshsj>=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
	}
	sshsj=request.getParameter("sshsj2");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql2+="  and (jc_zcdd.sshsj<=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
		if (!(sshsj.equals("")))	wheresql3+="  and (jc_zczjx.sshsj<=TO_DATE('"+sshsj+"','YYYY/MM/DD'))";
	}
	String sxhtsfysh=null;
	sxhtsfysh=request.getParameter("sxhtsfysh");
	if (sxhtsfysh!=null)
	{
		if (!(sxhtsfysh.equals("")))	wheresql2+=" and  (jc_zcdd.sxhtsfysh='"+sxhtsfysh+"')";
		if (!(sxhtsfysh.equals("")))	wheresql3+=" and  (jc_zczjx.sxhtsfysh='"+sxhtsfysh+"')";
	}

	String sfjs=null;
	sfjs=request.getParameter("sfjs");
	if (sfjs!=null)
	{
		sfjs=cf.GB2Uni(sfjs);
		if (!(sfjs.equals("")))	wheresql2+=" and  (jc_zcdd.sfjs='"+sfjs+"')";
		if (!(sfjs.equals("")))	wheresql3+=" and  (jc_zczjx.sfjs='"+sfjs+"')";
	}

    ls_sql=" select * ";
    ls_sql+=" FROM ( ";
	ls_sql+=" SELECT jc_zcdd.ddbh,DECODE(jc_zcdd.sfjs,'N','未结算','C','设置标志','Y','已结算','M','结算已审核') sfjs,DECODE(jc_zcdd.sxhtsfysh,'M','非手写','Y','已审核','N','未审'),clztmc,jc_zcdd.sshsj,ppbm,jc_zcdd.gys,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy";
	ls_sql+=" FROM crm_khxx,jc_zcdd,jdm_zcddzt ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
    ls_sql+=" and jc_zcdd.clzt in('30')";
    ls_sql+=" and jc_zcdd.ddlx not in('9','C','E')";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
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
			ls_sql+=" and (jc_zcdd.clgw='"+yhmc+"' OR jc_zcdd.ztjjgw='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_zcdd.jjsjs='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_zcdd.xmzy='"+yhmc+"' OR jc_zcdd.lrr='"+yhmc+"')";
		}
	}
    ls_sql+=wheresql;
    ls_sql+=wheresql2;

    ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT jc_zczjx.zjxbh ddbh,DECODE(jc_zczjx.sfjs,'N','未结算','C','设置标志','Y','已结算','M','结算已审核') sfjs,DECODE(jc_zczjx.sxhtsfysh,'M','非手写','Y','已审核','N','未审'),DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入已完成','02','已确认','04','厂家已接收','03','已送货','05','部分送货','30','单项完结','99','退单') clztmc,jc_zczjx.sshsj,ppbm,jc_zczjx.gys,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,jc_zczjx.clgw,jc_zczjx.ztjjgw,jc_zczjx.xmzy";
	ls_sql+=" FROM crm_khxx,jc_zczjx ";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh";
    ls_sql+=" and jc_zczjx.sfjs in('N','C')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
    ls_sql+=" and jc_zczjx.clzt='30'";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";
	}
	else{
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
			ls_sql+=" and (jc_zczjx.clgw='"+yhmc+"' OR jc_zczjx.ztjjgw='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_zczjx.jjsjs='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_zczjx.xmzy='"+yhmc+"' OR jc_zczjx.lrr='"+yhmc+"')";
		}
	}


    ls_sql+=wheresql;
    ls_sql+=wheresql3;

    ls_sql+=" ) ";
	ls_sql+=" order by sfjs,khxm,ddbh ";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Jc_zcddCsdzList.jsp","","","");
	pageObj.setEditStr("结算");//设置每页显示记录数
	pageObj.setPageRow(300);
/*
//设置显示列
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","jc_zcdd_clgw","jc_zcdd_jkxz","jc_zcdd_jkdd","jc_zcdd_ddshbz","jc_zcdd_hkze","jc_zcdd_xclbz","jc_zcdd_clzt","jc_zcdd_lrsj","jc_zcdd_dwbh","jc_zcdd_bz","jc_zcdd_xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"批量结算"};//按钮的显示名称
	String[] buttonLink={"InsertJc_gysjsCsdz.jsp?ssfgs="+fgs};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewDdmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	if (!yhjs.equals("G0"))
	{
		coluParm=new ColuParm();//生成一个列参数对象
		String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
		coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
		coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
		coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
		coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
		pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
	}
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
  <B><font size="3">厂商结算对账</B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">订单编号</td>
	<td  width="5%">结算状态</td>
	<td  width="5%">手写合同是否审核</td>
	<td  width="5%">处理状态</td>
	<td  width="6%">送货时间</td>
	<td  width="8%">子品牌</td>
	<td  width="15%">供应商</td>
	<td  width="7%">客户姓名</td>
	<td  width="6%">合同号</td>
	<td  width="14%">房屋地址</td>
	<td  width="5%">驻店家居顾问</td>
	<td  width="5%">展厅家居顾问</td>
	<td  width="5%">项目专员</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>

