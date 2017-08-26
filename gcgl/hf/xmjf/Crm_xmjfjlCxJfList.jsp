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
	String gj=null;
	gj=request.getParameter("gj");
	if (gj!=null)
	{
		gj=cf.GB2Uni(gj);
		if (!(gj.equals("")))	wheresql+=" and  (crm_khxx.gj='"+gj+"')";
	}
	String dd=null;
	dd=request.getParameter("dd");
	if (dd!=null)
	{
		dd=cf.GB2Uni(dd);
		if (!(dd.equals("")))	wheresql+=" and  (crm_khxx.dd='"+dd+"')";
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
	
	
	
	String crm_xmjfjl_jfjlh=null;
	String crm_xmjfjl_yjfr=null;
	String crm_xmjfjl_yjfsj=null;
	String crm_xmjfjl_hfsfcg=null;
	String crm_xmjfjl_hfr=null;
	String crm_xmjfjl_hfsj=null;
	String crm_xmjfjl_xmjfr=null;
	String crm_xmjfjl_xmjfsj=null;
	String crm_xmjfjl_clzt=null;
	String crm_xmjfjl_lrr=null;
	String crm_xmjfjl_lrsj=null;
	String crm_xmjfjl_lrbm=null;
	crm_xmjfjl_jfjlh=request.getParameter("crm_xmjfjl_jfjlh");
	if (crm_xmjfjl_jfjlh!=null)
	{
		crm_xmjfjl_jfjlh=cf.GB2Uni(crm_xmjfjl_jfjlh);
		if (!(crm_xmjfjl_jfjlh.equals("")))	wheresql+=" and  (crm_xmjfjl.jfjlh='"+crm_xmjfjl_jfjlh+"')";
	}
	crm_xmjfjl_yjfr=request.getParameter("crm_xmjfjl_yjfr");
	if (crm_xmjfjl_yjfr!=null)
	{
		crm_xmjfjl_yjfr=cf.GB2Uni(crm_xmjfjl_yjfr);
		if (!(crm_xmjfjl_yjfr.equals("")))	wheresql+=" and  (crm_xmjfjl.yjfr='"+crm_xmjfjl_yjfr+"')";
	}
	crm_xmjfjl_yjfsj=request.getParameter("crm_xmjfjl_yjfsj");
	if (crm_xmjfjl_yjfsj!=null)
	{
		crm_xmjfjl_yjfsj=crm_xmjfjl_yjfsj.trim();
		if (!(crm_xmjfjl_yjfsj.equals("")))	wheresql+="  and (crm_xmjfjl.yjfsj>=TO_DATE('"+crm_xmjfjl_yjfsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_yjfsj=request.getParameter("crm_xmjfjl_yjfsj2");
	if (crm_xmjfjl_yjfsj!=null)
	{
		crm_xmjfjl_yjfsj=crm_xmjfjl_yjfsj.trim();
		if (!(crm_xmjfjl_yjfsj.equals("")))	wheresql+="  and (crm_xmjfjl.yjfsj<=TO_DATE('"+crm_xmjfjl_yjfsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_hfsfcg=request.getParameter("crm_xmjfjl_hfsfcg");
	if (crm_xmjfjl_hfsfcg!=null)
	{
		crm_xmjfjl_hfsfcg=cf.GB2Uni(crm_xmjfjl_hfsfcg);
		if (!(crm_xmjfjl_hfsfcg.equals("")))	wheresql+=" and  (crm_xmjfjl.hfsfcg='"+crm_xmjfjl_hfsfcg+"')";
	}
	crm_xmjfjl_hfr=request.getParameter("crm_xmjfjl_hfr");
	if (crm_xmjfjl_hfr!=null)
	{
		crm_xmjfjl_hfr=cf.GB2Uni(crm_xmjfjl_hfr);
		if (!(crm_xmjfjl_hfr.equals("")))	wheresql+=" and  (crm_xmjfjl.hfr='"+crm_xmjfjl_hfr+"')";
	}
	crm_xmjfjl_hfsj=request.getParameter("crm_xmjfjl_hfsj");
	if (crm_xmjfjl_hfsj!=null)
	{
		crm_xmjfjl_hfsj=crm_xmjfjl_hfsj.trim();
		if (!(crm_xmjfjl_hfsj.equals("")))	wheresql+="  and (crm_xmjfjl.hfsj>=TO_DATE('"+crm_xmjfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_hfsj=request.getParameter("crm_xmjfjl_hfsj2");
	if (crm_xmjfjl_hfsj!=null)
	{
		crm_xmjfjl_hfsj=crm_xmjfjl_hfsj.trim();
		if (!(crm_xmjfjl_hfsj.equals("")))	wheresql+="  and (crm_xmjfjl.hfsj<=TO_DATE('"+crm_xmjfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_xmjfr=request.getParameter("crm_xmjfjl_xmjfr");
	if (crm_xmjfjl_xmjfr!=null)
	{
		crm_xmjfjl_xmjfr=cf.GB2Uni(crm_xmjfjl_xmjfr);
		if (!(crm_xmjfjl_xmjfr.equals("")))	wheresql+=" and  (crm_xmjfjl.xmjfr='"+crm_xmjfjl_xmjfr+"')";
	}
	crm_xmjfjl_xmjfsj=request.getParameter("crm_xmjfjl_xmjfsj");
	if (crm_xmjfjl_xmjfsj!=null)
	{
		crm_xmjfjl_xmjfsj=crm_xmjfjl_xmjfsj.trim();
		if (!(crm_xmjfjl_xmjfsj.equals("")))	wheresql+="  and (crm_xmjfjl.xmjfsj>=TO_DATE('"+crm_xmjfjl_xmjfsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_xmjfsj=request.getParameter("crm_xmjfjl_xmjfsj2");
	if (crm_xmjfjl_xmjfsj!=null)
	{
		crm_xmjfjl_xmjfsj=crm_xmjfjl_xmjfsj.trim();
		if (!(crm_xmjfjl_xmjfsj.equals("")))	wheresql+="  and (crm_xmjfjl.xmjfsj<=TO_DATE('"+crm_xmjfjl_xmjfsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_clzt=request.getParameter("crm_xmjfjl_clzt");
	if (crm_xmjfjl_clzt!=null)
	{
		crm_xmjfjl_clzt=cf.GB2Uni(crm_xmjfjl_clzt);
		if (!(crm_xmjfjl_clzt.equals("")))	wheresql+=" and  (crm_xmjfjl.clzt='"+crm_xmjfjl_clzt+"')";
	}
	crm_xmjfjl_lrr=request.getParameter("crm_xmjfjl_lrr");
	if (crm_xmjfjl_lrr!=null)
	{
		crm_xmjfjl_lrr=cf.GB2Uni(crm_xmjfjl_lrr);
		if (!(crm_xmjfjl_lrr.equals("")))	wheresql+=" and  (crm_xmjfjl.lrr='"+crm_xmjfjl_lrr+"')";
	}
	crm_xmjfjl_lrsj=request.getParameter("crm_xmjfjl_lrsj");
	if (crm_xmjfjl_lrsj!=null)
	{
		crm_xmjfjl_lrsj=crm_xmjfjl_lrsj.trim();
		if (!(crm_xmjfjl_lrsj.equals("")))	wheresql+="  and (crm_xmjfjl.lrsj>=TO_DATE('"+crm_xmjfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_lrsj=request.getParameter("crm_xmjfjl_lrsj2");
	if (crm_xmjfjl_lrsj!=null)
	{
		crm_xmjfjl_lrsj=crm_xmjfjl_lrsj.trim();
		if (!(crm_xmjfjl_lrsj.equals("")))	wheresql+="  and (crm_xmjfjl.lrsj<=TO_DATE('"+crm_xmjfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_xmjfjl_lrbm=request.getParameter("crm_xmjfjl_lrbm");
	if (crm_xmjfjl_lrbm!=null)
	{
		crm_xmjfjl_lrbm=cf.GB2Uni(crm_xmjfjl_lrbm);
		if (!(crm_xmjfjl_lrbm.equals("")))	wheresql+=" and  (crm_xmjfjl.lrbm='"+crm_xmjfjl_lrbm+"')";
	}
	ls_sql="SELECT crm_xmjfjl.jfjlh,DECODE(crm_xmjfjl.clzt,'S','预交付','Y','回访成功','X','回访失败','W','项目交付'), DECODE(crm_xmjfjl.hfsfcg,'Y','成功','N','失败'),crm_xmjfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,crm_xmjfjl.yjfr,crm_xmjfjl.yjfsj,crm_xmjfjl.yjfsm,crm_xmjfjl.hfr,crm_xmjfjl.hfsj,crm_xmjfjl.hfsm,crm_xmjfjl.xmjfr,crm_xmjfjl.xmjfsj,crm_xmjfjl.xmjfsm, crm_xmjfjl.lrr,crm_xmjfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,crm_xmjfjl,sq_sgd,sq_dwxx  ";
    ls_sql+=" where crm_xmjfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_xmjfjl.lrbm=sq_dwxx.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_xmjfjlCxJfList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jfjlh","crm_xmjfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_xmjfjl_yjfr","crm_xmjfjl_yjfsj","crm_xmjfjl_yjfsm","crm_xmjfjl_hfsfcg","crm_xmjfjl_hfr","crm_xmjfjl_hfsj","crm_xmjfjl_hfsm","crm_xmjfjl_xmjfr","crm_xmjfjl_xmjfsj","crm_xmjfjl_xmjfsm","crm_xmjfjl_clzt","crm_xmjfjl_lrr","crm_xmjfjl_lrsj","crm_xmjfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jfjlh"};
	pageObj.setKey(keyName);

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
  <B><font size="3">项目交付－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">交付记录号</td>
	<td  width="3%">处理状态</td>
	<td  width="2%">回访是否成功</td>
	<td  width="3%">客户编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">合同号</td>
	<td  width="2%">设计师</td>
	<td  width="2%">施工队</td>
	<td  width="2%">管家</td>
	<td  width="2%">调度</td>
	<td  width="2%">预交付人</td>
	<td  width="3%">预交付时间</td>
	<td  width="14%">预交付说明</td>
	<td  width="2%">回访人</td>
	<td  width="3%">回访时间</td>
	<td  width="15%">回访说明</td>
	<td  width="2%">项目交付人</td>
	<td  width="3%">项目交付时间</td>
	<td  width="14%">项目交付说明</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
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