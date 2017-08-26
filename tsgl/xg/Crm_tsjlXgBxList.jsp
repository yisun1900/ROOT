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
	String crm_tsjl_tsjlh=null;
	String crm_tsjl_slfsbm=null;
	String hth=null;
	String crm_tsjl_khbh=null;
	String crm_tsjl_sjs=null;
	String crm_tsjl_sgd=null;
	String crm_tsjl_zjy=null;
	String crm_tsjl_jgrq=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_hfsj=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_clzt=null;

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


	String crm_tsjl_yqjjsj=null;
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj>=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj2");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj<=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}

	String yzcdbm=null;
	yzcdbm=request.getParameter("yzcdbm");
	if (yzcdbm!=null)
	{
		if (!(yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+yzcdbm+"')";
	}
	String slbm=null;
	slbm=request.getParameter("slbm");
	if (!(slbm.equals("")))	wheresql+=" and  (crm_tsjl.slbm='"+slbm+"')";


	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=crm_tsjl_tsjlh.trim();
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and (crm_tsjl.tsjlh="+crm_tsjl_tsjlh+") ";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	crm_tsjl_khbh=request.getParameter("crm_tsjl_khbh");
	if (crm_tsjl_khbh!=null)
	{
		crm_tsjl_khbh=cf.GB2Uni(crm_tsjl_khbh);
		if (!(crm_tsjl_khbh.equals("")))	wheresql+=" and  (crm_tsjl.khbh='"+crm_tsjl_khbh+"')";
	}
	crm_tsjl_sjs=request.getParameter("crm_tsjl_sjs");
	if (crm_tsjl_sjs!=null)
	{
		crm_tsjl_sjs=cf.GB2Uni(crm_tsjl_sjs);
		if (!(crm_tsjl_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_tsjl_sjs+"')";
	}
	crm_tsjl_sgd=request.getParameter("crm_tsjl_sgd");
	if (crm_tsjl_sgd!=null)
	{
		crm_tsjl_sgd=cf.GB2Uni(crm_tsjl_sgd);
		if (!(crm_tsjl_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_tsjl_sgd+"')";
	}
	crm_tsjl_zjy=request.getParameter("crm_tsjl_zjy");
	if (crm_tsjl_zjy!=null)
	{
		crm_tsjl_zjy=cf.GB2Uni(crm_tsjl_zjy);
		if (!(crm_tsjl_zjy.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_tsjl_zjy+"')";
	}
	crm_tsjl_jgrq=request.getParameter("crm_tsjl_jgrq");
	if (crm_tsjl_jgrq!=null)
	{
		crm_tsjl_jgrq=crm_tsjl_jgrq.trim();
		if (!(crm_tsjl_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq=TO_DATE('"+crm_tsjl_jgrq+"','YYYY/MM/DD'))";
	}
	crm_tsjl_sfxhf=request.getParameter("crm_tsjl_sfxhf");
	if (crm_tsjl_sfxhf!=null)
	{
		crm_tsjl_sfxhf=cf.GB2Uni(crm_tsjl_sfxhf);
		if (!(crm_tsjl_sfxhf.equals("")))	wheresql+=" and  (crm_tsjl.sfxhf='"+crm_tsjl_sfxhf+"')";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	wheresql+="  and (crm_tsjl.hfsj>=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj2");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	wheresql+="  and (crm_tsjl.hfsj<=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj2");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slr=request.getParameter("crm_tsjl_slr");
	if (crm_tsjl_slr!=null)
	{
		crm_tsjl_slr=cf.GB2Uni(crm_tsjl_slr);
		if (!(crm_tsjl_slr.equals("")))	wheresql+=" and  (crm_tsjl.slr='"+crm_tsjl_slr+"')";
	}
	crm_tsjl_clzt=request.getParameter("crm_tsjl_clzt");
	if (crm_tsjl_clzt!=null)
	{
		crm_tsjl_clzt=cf.GB2Uni(crm_tsjl_clzt);
		if (!(crm_tsjl_clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+crm_tsjl_clzt+"')";
	}

	ls_sql="SELECT crm_tsjl.tsjlh as tsjlh,crm_khxx.hth,crm_khxx.khbh,slfsmc,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_tsjl.slsj,crm_tsjl.hfsj,crm_tsjl.tsnr,DECODE(crm_tsjl.clzt,0,'未受理',1,'已受理',2,'在处理',3,'结案','9','不立案') as clzt";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and lx='2'";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsjl.tsjlh";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("Crm_tsjlXgBxList.jsp","SelectXgBxCrm_tsjl.jsp","","/tsgl/bxdj/XgBxEditCrm_tsjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"tsjlh","clzt","slfsmc","hth","khxm","fwdz","sjs","sgd","tsnr","slsj","hfsj"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"tsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");

	pageObj.alignStr[5]="align='left'";
	pageObj.alignStr[8]="align='left'";


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
  <B><font size="3">特权维护－修改报修信息</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(160);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">报修记录号</td>
	<td  width="6%">处理状态</td>
	<td  width="6%">投诉来源</td>
	<td  width="6%">合同号</td>
	<td  width="4%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">施工队</td>
	<td  width="31%">投诉内容</td>
	<td  width="6%">客服受理时间</td>
	<td  width="6%">需回访时间</td>
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