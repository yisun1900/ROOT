<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

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



	String jc_jjdd_khbh=null;
	String crm_khxx_hth=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_khxm2=null;
	String crm_khxx_fwdz2=null;
	String crm_khxx_sjs=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_kgrq=null;
	String cxhdbm=null;

	String fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}

	jc_jjdd_khbh=request.getParameter("jc_jjdd_khbh");
	if (jc_jjdd_khbh!=null)
	{
		jc_jjdd_khbh=cf.GB2Uni(jc_jjdd_khbh);
		if (!(jc_jjdd_khbh.equals("")))	wheresql+=" and  (jc_jjdd.khbh='"+jc_jjdd_khbh+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}


	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}

	crm_khxx_khxm2=request.getParameter("crm_khxx_khxm2");
	if (crm_khxx_khxm2!=null)
	{
		crm_khxx_khxm2=cf.GB2Uni(crm_khxx_khxm2);
		if (!(crm_khxx_khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm2+"%')";
	}
	crm_khxx_fwdz2=request.getParameter("crm_khxx_fwdz2");
	if (crm_khxx_fwdz2!=null)
	{
		crm_khxx_fwdz2=cf.GB2Uni(crm_khxx_fwdz2);
		if (!(crm_khxx_fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz2+"%')";
	}


	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}

	
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq>=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}
	crm_khxx_kgrq=request.getParameter("crm_khxx_kgrq2");
	if (crm_khxx_kgrq!=null)
	{
		crm_khxx_kgrq=crm_khxx_kgrq.trim();
		if (!(crm_khxx_kgrq.equals("")))	wheresql+="  and (crm_khxx.kgrq<=TO_DATE('"+crm_khxx_kgrq+"','YYYY-MM-DD'))";
	}

	cxhdbm=request.getParameter("cxhdbm");
	if (cxhdbm!=null)
	{
		cxhdbm=cf.GB2Uni(cxhdbm);
		if (!(cxhdbm.equals("")))	wheresql+=" and  (crm_khxx.cxhdbm='"+cxhdbm+"')";
	}

	String crm_khxx_wjbz=null;
	crm_khxx_wjbz=request.getParameter("crm_khxx_wjbz");
	if (crm_khxx_wjbz!=null)
	{
		if (crm_khxx_wjbz.equals("1"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
		}
		else if (crm_khxx_wjbz.equals("2"))//1+未完结&2+已完结
		{
			wheresql+=" and  (crm_khxx.gcjdbm in('5'))";
		}
	}





	String jc_jjdd_ddbh=null;
	jc_jjdd_ddbh=request.getParameter("jc_jjdd_ddbh");
	if (jc_jjdd_ddbh!=null)
	{
		jc_jjdd_ddbh=cf.GB2Uni(jc_jjdd_ddbh);
		if (!(jc_jjdd_ddbh.equals("")))	wheresql+=" and  (jc_jjdd.ddbh='"+jc_jjdd_ddbh+"')";
	}
	String jc_jjdd_clzt=null;
	jc_jjdd_clzt=request.getParameter("jc_jjdd_clzt");
	if (jc_jjdd_clzt!=null)
	{
		jc_jjdd_clzt=cf.GB2Uni(jc_jjdd_clzt);
		if (!(jc_jjdd_clzt.equals("")))	wheresql+=" and  (jc_jjdd.clzt='"+jc_jjdd_clzt+"')";
	}



	String jjsjs=null;
	jjsjs=request.getParameter("jjsjs");
	if (jjsjs!=null)
	{
		jjsjs=cf.GB2Uni(jjsjs);
		if (!(jjsjs.equals("")))	wheresql+=" and  (jc_jjdd.jjsjs='"+jjsjs+"')";
	}


	String clgw=null;
	String ztjjgw=null;
	String xmzy=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (jc_jjdd.clgw='"+clgw+"')";
	}
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (jc_jjdd.ztjjgw='"+ztjjgw+"')";
	}
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (jc_jjdd.xmzy='"+xmzy+"')";
	}


	String pdgcmc=null;
	pdgcmc=request.getParameter("pdgcmc");
	if (pdgcmc!=null)
	{
		pdgcmc=cf.GB2Uni(pdgcmc);
		if (!(pdgcmc.equals("")))	wheresql+=" and  (jc_jjdd.pdgcmc='"+pdgcmc+"')";
	}
	String pdgcmc2=null;
	pdgcmc2=request.getParameter("pdgcmc2");
	if (pdgcmc2!=null)
	{
		pdgcmc2=cf.GB2Uni(pdgcmc2);
		if (!(pdgcmc2.equals("")))	wheresql+=" and  (jc_jjdd.pdgcmc like '%"+pdgcmc2+"%')";
	}
	String jjppmc=null;
	jjppmc=request.getParameter("jjppmc");
	if (jjppmc!=null)
	{
		jjppmc=cf.GB2Uni(jjppmc);
		if (!(jjppmc.equals("")))	wheresql+=" and  (jc_jjdd.jjppmc='"+jjppmc+"')";
	}
	String jjppmc2=null;
	jjppmc2=request.getParameter("jjppmc2");
	if (jjppmc2!=null)
	{
		jjppmc2=cf.GB2Uni(jjppmc2);
		if (!(jjppmc2.equals("")))	wheresql+=" and  (jc_jjdd.jjppmc like '%"+jjppmc2+"%')";
	}
	String jjgys=null;
	jjgys=request.getParameter("jjgys");
	if (jjgys!=null)
	{
		jjgys=cf.GB2Uni(jjgys);
		if (!(jjgys.equals("")))	wheresql+=" and  (jc_jjdd.jjgys='"+jjgys+"')";
	}
	String jjgys2=null;
	jjgys2=request.getParameter("jjgys2");
	if (jjgys2!=null)
	{
		jjgys2=cf.GB2Uni(jjgys2);
		if (!(jjgys2.equals("")))	wheresql+=" and  (jc_jjdd.jjgys like '%"+jjgys2+"%')";
	}

	String xcmgcmc=null;
	xcmgcmc=request.getParameter("xcmgcmc");
	if (xcmgcmc!=null)
	{
		xcmgcmc=cf.GB2Uni(xcmgcmc);
		if (!(xcmgcmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgcmc='"+xcmgcmc+"')";
	}
	String xcmgcmc2=null;
	xcmgcmc2=request.getParameter("xcmgcmc2");
	if (xcmgcmc2!=null)
	{
		xcmgcmc2=cf.GB2Uni(xcmgcmc2);
		if (!(xcmgcmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgcmc like '%"+xcmgcmc2+"%')";
	}
	String xcmppmc=null;
	xcmppmc=request.getParameter("xcmppmc");
	if (xcmppmc!=null)
	{
		xcmppmc=cf.GB2Uni(xcmppmc);
		if (!(xcmppmc.equals("")))	wheresql+=" and  (jc_jjdd.xcmppmc='"+xcmppmc+"')";
	}
	String xcmppmc2=null;
	xcmppmc2=request.getParameter("xcmppmc2");
	if (xcmppmc2!=null)
	{
		xcmppmc2=cf.GB2Uni(xcmppmc2);
		if (!(xcmppmc2.equals("")))	wheresql+=" and  (jc_jjdd.xcmppmc like '%"+xcmppmc2+"%')";
	}
	String xcmgys=null;
	xcmgys=request.getParameter("xcmgys");
	if (xcmgys!=null)
	{
		xcmgys=cf.GB2Uni(xcmgys);
		if (!(xcmgys.equals("")))	wheresql+=" and  (jc_jjdd.xcmgys='"+xcmgys+"')";
	}
	String xcmgys2=null;
	xcmgys2=request.getParameter("xcmgys2");
	if (xcmgys2!=null)
	{
		xcmgys2=cf.GB2Uni(xcmgys2);
		if (!(xcmgys2.equals("")))	wheresql+=" and  (jc_jjdd.xcmgys like '%"+xcmgys2+"%')";
	}

	

	String pgcsj=null;
	pgcsj=request.getParameter("pgcsj");
	if (pgcsj!=null)
	{
		pgcsj=cf.GB2Uni(pgcsj);
		if (!(pgcsj.equals("")))  wheresql+="  and (jc_jjdd.pgcsj>=TO_DATE('"+pgcsj+"','YYYY/MM/DD'))";
	}
	pgcsj=request.getParameter("pgcsj2");
	if (pgcsj!=null)
	{
		pgcsj=cf.GB2Uni(pgcsj);
		if (!(pgcsj.equals("")))  wheresql+="  and (jc_jjdd.pgcsj<=TO_DATE('"+pgcsj+"','YYYY/MM/DD'))";
	}


	String jc_jjdd_pgcr=null;
	jc_jjdd_pgcr=request.getParameter("jc_jjdd_pgcr");
	if (jc_jjdd_pgcr!=null)
	{
		jc_jjdd_pgcr=cf.GB2Uni(jc_jjdd_pgcr);
		if (!(jc_jjdd_pgcr.equals("")))	wheresql+=" and  (jc_jjdd.pgcr='"+jc_jjdd_pgcr+"')";
	}
	String jc_jjdd_dwbh=request.getParameter("jc_jjdd_dwbh");
	if (jc_jjdd_dwbh!=null)
	{
		if (!(jc_jjdd_dwbh.equals("")))	wheresql+=" and  (jc_jjdd.dwbh='"+jc_jjdd_dwbh+"')";
	}



	ls_sql="SELECT jc_jjdd.ddbh,clztmc,crm_khxx.khxm khxm,crm_khxx.fwdz,jc_jjdd.pdgcmc,jc_jjdd.xcmgcmc,jc_jjdd.pgcsj,jc_jjdd.pgcr,jc_jjdd.htze,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.khbh,crm_khxx.sjs ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
	if (yhjs.equals("G0"))
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from jxc_ppgysdzb where gysbm='"+ygbh+"' )";

		ls_sql+=" and (jc_jjdd.jjgys=(select gys from sq_gysbm where gysbm='"+ygbh+"') OR jc_jjdd.xcmgys=(select gys from sq_gysbm where gysbm='"+ygbh+"'))";
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
			ls_sql+=" and (jc_jjdd.clgw='"+yhmc+"' OR jc_jjdd.ztjjgw='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("12"))//12:家居设计师
		{
			ls_sql+=" and (jc_jjdd.jjsjs='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
		}
		if (zwbm.equals("10"))//10:项目专员
		{
			ls_sql+=" and (jc_jjdd.xmzy='"+yhmc+"' OR jc_jjdd.lrr='"+yhmc+"')";
		}
	}

    ls_sql+=wheresql;
    ls_sql+=" order by jc_jjdd.pgcsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_jjddGcjsList.jsp","","","GcjsJc_jjdd.jsp");
	pageObj.setEditStr("接收");//设置每页显示记录数

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"批量接收"};//按钮的显示名称
	String[] buttonLink={"SavePlGcjsJc_jjdd.jsp"};//按钮单击调用的网页，可以增加参数
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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家具订单处理--工厂接收</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">订单编号</td>
	<td  width="6%">处理状态</td>
	<td  width="5%">客户姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="10%">家具工厂</td>
	<td  width="9%">型材门工厂</td>
	<td  width="6%">派工厂时间</td>
	<td  width="5%">派工厂人</td>
	<td  width="7%"><strong>合同总额</strong></td>
	<td  width="4%">家居设计师</td>
	<td  width="4%">项目专员</td>
	<td  width="4%">驻店家居顾问</td>
	<td  width="4%">展厅家居顾问</td>
	<td  width="5%">客户编号</td>
	<td  width="4%">家装设计师</td>
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
