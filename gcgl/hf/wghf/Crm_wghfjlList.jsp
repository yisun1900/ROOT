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
	
	
	
	String crm_wghfjl_hfjlh=null;
	String crm_wghfjl_hfsfcg=null;
	String crm_wghfjl_hfr=null;
	String crm_wghfjl_hfsj=null;
	String crm_wghfjl_lrr=null;
	String crm_wghfjl_lrsj=null;
	String crm_wghfjl_lrbm=null;
	crm_wghfjl_hfjlh=request.getParameter("crm_wghfjl_hfjlh");
	if (crm_wghfjl_hfjlh!=null)
	{
		crm_wghfjl_hfjlh=cf.GB2Uni(crm_wghfjl_hfjlh);
		if (!(crm_wghfjl_hfjlh.equals("")))	wheresql+=" and  (crm_wghfjl.hfjlh='"+crm_wghfjl_hfjlh+"')";
	}
	crm_wghfjl_hfsfcg=request.getParameter("crm_wghfjl_hfsfcg");
	if (crm_wghfjl_hfsfcg!=null)
	{
		crm_wghfjl_hfsfcg=cf.GB2Uni(crm_wghfjl_hfsfcg);
		if (!(crm_wghfjl_hfsfcg.equals("")))	wheresql+=" and  (crm_wghfjl.hfsfcg='"+crm_wghfjl_hfsfcg+"')";
	}
	crm_wghfjl_hfr=request.getParameter("crm_wghfjl_hfr");
	if (crm_wghfjl_hfr!=null)
	{
		crm_wghfjl_hfr=cf.GB2Uni(crm_wghfjl_hfr);
		if (!(crm_wghfjl_hfr.equals("")))	wheresql+=" and  (crm_wghfjl.hfr='"+crm_wghfjl_hfr+"')";
	}
	crm_wghfjl_hfsj=request.getParameter("crm_wghfjl_hfsj");
	if (crm_wghfjl_hfsj!=null)
	{
		crm_wghfjl_hfsj=crm_wghfjl_hfsj.trim();
		if (!(crm_wghfjl_hfsj.equals("")))	wheresql+="  and (crm_wghfjl.hfsj>=TO_DATE('"+crm_wghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_hfsj=request.getParameter("crm_wghfjl_hfsj2");
	if (crm_wghfjl_hfsj!=null)
	{
		crm_wghfjl_hfsj=crm_wghfjl_hfsj.trim();
		if (!(crm_wghfjl_hfsj.equals("")))	wheresql+="  and (crm_wghfjl.hfsj<=TO_DATE('"+crm_wghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_lrr=request.getParameter("crm_wghfjl_lrr");
	if (crm_wghfjl_lrr!=null)
	{
		crm_wghfjl_lrr=cf.GB2Uni(crm_wghfjl_lrr);
		if (!(crm_wghfjl_lrr.equals("")))	wheresql+=" and  (crm_wghfjl.lrr='"+crm_wghfjl_lrr+"')";
	}
	crm_wghfjl_lrsj=request.getParameter("crm_wghfjl_lrsj");
	if (crm_wghfjl_lrsj!=null)
	{
		crm_wghfjl_lrsj=crm_wghfjl_lrsj.trim();
		if (!(crm_wghfjl_lrsj.equals("")))	wheresql+="  and (crm_wghfjl.lrsj>=TO_DATE('"+crm_wghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_lrsj=request.getParameter("crm_wghfjl_lrsj2");
	if (crm_wghfjl_lrsj!=null)
	{
		crm_wghfjl_lrsj=crm_wghfjl_lrsj.trim();
		if (!(crm_wghfjl_lrsj.equals("")))	wheresql+="  and (crm_wghfjl.lrsj<=TO_DATE('"+crm_wghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_wghfjl_lrbm=request.getParameter("crm_wghfjl_lrbm");
	if (crm_wghfjl_lrbm!=null)
	{
		crm_wghfjl_lrbm=cf.GB2Uni(crm_wghfjl_lrbm);
		if (!(crm_wghfjl_lrbm.equals("")))	wheresql+=" and  (crm_wghfjl.lrbm='"+crm_wghfjl_lrbm+"')";
	}
	ls_sql="SELECT crm_wghfjl.hfjlh,hfjgmc,hfwtmc,DECODE(crm_wghfjl.wtclzt,'1','未处理','2','在处理','3','已解决'),crm_wghfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,crm_wghfjl.hfr,crm_wghfjl.hfsj,crm_wghfjl.hfsm, crm_wghfjl.lrr,crm_wghfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,crm_wghfjl,dm_hfjgbm,dm_hfwtbm,sq_sgd,sq_dwxx  ";
    ls_sql+=" where crm_wghfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_wghfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_wghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_wghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
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
	pageObj.initPage("Crm_wghfjlList.jsp","","","EditCrm_wghfjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfjlh","crm_wghfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_wghfjl_hfr","crm_wghfjl_hfsj","crm_wghfjl_hfsm","crm_wghfjl_hfsfcg","crm_wghfjl_hfr","crm_wghfjl_hfsj","crm_wghfjl_hfsm","crm_wghfjl_xmjfr","crm_wghfjl_xmjfsj","crm_wghfjl_xmjfsm","crm_wghfjl_clzt","crm_wghfjl_lrr","crm_wghfjl_lrsj","crm_wghfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_wghfjl.jsp"};//按钮单击调用的网页，可以增加参数
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

	String[] coluKey1={"hfjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_wghfjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hfjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">完工回访－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">回访记录号</td>
	<td  width="3%">回访结果</td>
	<td  width="7%">回访问题</td>
	<td  width="3%">问题处理状态</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="12%">房屋地址</td>
	<td  width="4%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="3%">管家</td>
	<td  width="3%">调度</td>
	<td  width="3%">回访人</td>
	<td  width="4%">回访时间</td>
	<td  width="23%">回访说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="7%">录入部门</td>
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