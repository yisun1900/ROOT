<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";

	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (clzt.equals("1"))
		{
			wheresql+=" and  (crm_tsbm.clzt in('1','2'))";
		}
		else if (clzt.equals("3"))
		{
			wheresql+=" and  (crm_tsbm.clzt in('3'))";
		}
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
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String sgbz=null;
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+sgbz+"')";
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




	String crm_tsbm_tsxlbm=null;
	String crm_tsbm_tslxbm=null;
	crm_tsbm_tslxbm=request.getParameter("crm_tsbm_tslxbm");
	if (crm_tsbm_tslxbm!=null)
	{
		crm_tsbm_tslxbm=cf.GB2Uni(crm_tsbm_tslxbm);
		if (!(crm_tsbm_tslxbm.equals("")))	wheresql+=" and  (crm_tsbm.tslxbm='"+crm_tsbm_tslxbm+"')";
	}
	crm_tsbm_tsxlbm=request.getParameter("crm_tsbm_tsxlbm");
	if (crm_tsbm_tsxlbm!=null)
	{
		crm_tsbm_tsxlbm=cf.GB2Uni(crm_tsbm_tsxlbm);
		if (!(crm_tsbm_tsxlbm.equals("")))	wheresql+=" and  (crm_tsbm.tsxlbm='"+crm_tsbm_tsxlbm+"')";
	}


	String crm_tsbm_tspp=null;
	crm_tsbm_tspp=request.getParameter("crm_tsbm_tspp");
	if (crm_tsbm_tspp!=null)
	{
		crm_tsbm_tspp=cf.GB2Uni(crm_tsbm_tspp);
		if (!(crm_tsbm_tspp.equals("")))	wheresql+=" and  (crm_tsbm.tspp='"+crm_tsbm_tspp+"')";
	}

	String crm_tsbm_tspp2=null;
	crm_tsbm_tspp2=request.getParameter("crm_tsbm_tspp2");
	if (crm_tsbm_tspp2!=null)
	{
		crm_tsbm_tspp2=cf.GB2Uni(crm_tsbm_tspp2);
		if (!(crm_tsbm_tspp2.equals("")))	wheresql+=" and  (crm_tsbm.tspp like '%"+crm_tsbm_tspp2+"%')";
	}

	String slsj=null;
	String slsj2=null;
	slsj=request.getParameter("slsj");
	if (slsj!=null)
	{
		if (!(slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+slsj+"','YYYY/MM/DD'))";
	}
	slsj2=request.getParameter("slsj2");
	if (slsj2!=null)
	{
		if (!(slsj2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+slsj2+"','YYYY/MM/DD'))";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}



	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_tsbm.ssfgs='"+fgs+"')";
	if (!(fgs.equals("")))	wheresql1+=" and  (crm_tshffkbm.dwbh in(select dwbh from sq_dwxx where ssdw='"+fgs+"'))";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_tsbm.dwbh='"+dwbh+"')";
		if (!(dwbh.equals("")))	wheresql1+=" and  (crm_tshffkbm.dwbh='"+dwbh+"')";
	}

%>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>投诉处理－特权（<font color="#FF0000">已结案记录不再显示</font>）</B> 
</CENTER>
<%
	ls_sql="SELECT '处理' cl ,crm_tsjl.tsjlh as tsjlh,crm_tsjl.khbh as khbh,tsxlmc,dm_slfsbm.slfsmc as dm_slfsbm_slfsmc,crm_khxx.khxm";
	ls_sql+=" ,crm_tsjl.slsj as crm_tsjl_slsj,crm_tsbm.dwbh,sq_dwxx.dwmc zrbm,crm_tsbm.tzsj,crm_tsbm.tsyybm,crm_tsbm.tspp";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') as clzt,crm_khxx.sjs";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','未受理','1','已受理','4','已接收','5','已出现场','6','已出方案','7','方案审核通过','2','在处理','3','结案','9','不立案') as jazt,sgdmc";

	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,crm_tsbm,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tsjlh=crm_tsbm.tsjlh";
    ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tsjl.lx='1'";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_tsjl.clzt in('1','2')";//0：非受理；1：已受理；2：在处理；3：结案；9:不立案
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.slsj desc" ;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(300);//设置每页显示记录数
//设置显示列
	String[] disColName={"tsjlh","zrbm","tsxlmc","clzt","cl","khxm","sjs","sgdmc","dm_slfsbm_slfsmc","crm_tsjl_slsj","jazt","tspp"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"tsjlh","tsyybm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("tsjlh","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

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
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"tsjlh","tsyybm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="ClCrm_tsbm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cl",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表



	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">投诉序号</td>
	<td  width="11%">责任部门</td>
	<td  width="14%">投诉原因</td>
	<td  width="6%">处理状态</td>
	<td  width="4%">&nbsp;</td>
	<td  width="6%">姓名</td>
	<td  width="7%">设计师</td>
	<td  width="5%">施工队</td>
	<td  width="6%">投诉来源</td>
	<td  width="7%">受理时间</td>
	<td  width="7%">结案</td>
	<td  width="20%">涉及厂商</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

<CENTER ><B>投诉回访反馈问题</B></CENTER>
<%
	ls_sql="SELECT crm_tshfjl.hfjlh as hfjlh,crm_tshffkbm.dwbh,a.dwmc fkbm,b.dwmc dmmc,DECODE(crm_tshffkbm.clzt,'0','未通知','1','未查看','2','已查看') as clzt,crm_tshfjl.khbh as khbh,crm_khxx.khxm,crm_tshfjl.hfsj,crm_tshfjl.hfr,khhfqk,cxxwt";
	ls_sql+=" FROM crm_tshffkbm,crm_tshfjl,crm_khxx,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where crm_tshfjl.hfjlh=crm_tshffkbm.hfjlh and crm_tshffkbm.dwbh=a.dwbh and crm_khxx.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tshfjl.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_tshffkbm.clzt in('0','1')";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql1;
    ls_sql+=" order by crm_tshfjl.hfjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","SaveCrm_hfbm.jsp");
	pageObj.setPageRow(2000);//设置每页显示记录数
	pageObj.setEditStr("查看");
//设置显示列
	String[] disColName2={"fkbm","clzt","hfjlh","khxm","dmmc","hfsj","hfr","khhfqk","cxxwt"};
	pageObj.setDisColName(disColName2);
/*
*/

//设置主键
	String[] keyName2={"hfjlh","dwbh"};
	pageObj.setKey(keyName2);

//设置列超级连接

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey5={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey5;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey6={"hfjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey6;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/tshf/ViewCrm_tshfjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hfjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="10%">反馈部门</td>
	<td  width="6%">通知状态</td>
	<td  width="6%">回访记录</td>
	<td  width="6%">姓名</td>
	<td  width="11%">签约店面</td>
	<td  width="7%">回访时间</td>
	<td  width="5%">回访人</td>
	<td  width="25%">客户回访情况</td>
	<td  width="20%">回访中出现的新问题</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</body>
</html>