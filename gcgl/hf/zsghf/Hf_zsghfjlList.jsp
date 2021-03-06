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
	
	
	String hflxbm=null;
	hflxbm=request.getParameter("hflxbm");
	if (hflxbm!=null)
	{
		hflxbm=cf.GB2Uni(hflxbm);
		if (!(hflxbm.equals("")))	wheresql+=" and  (hf_zsghfjl.hflxbm='"+hflxbm+"')";
	}
	String xchflxbm=null;
	xchflxbm=request.getParameter("xchflxbm");
	if (xchflxbm!=null)
	{
		xchflxbm=cf.GB2Uni(xchflxbm);
		if (!(xchflxbm.equals("")))	wheresql+=" and  (hf_zsghfjl.xchflxbm='"+xchflxbm+"')";
	}
	String hfjgbm=null;
	hfjgbm=request.getParameter("hfjgbm");
	if (hfjgbm!=null)
	{
		hfjgbm=cf.GB2Uni(hfjgbm);
		if (!(hfjgbm.equals("")))	wheresql+=" and  (hf_zsghfjl.hfjgbm='"+hfjgbm+"')";
	}
	String hfwtbm=null;
	hfwtbm=request.getParameter("hfwtbm");
	if (hfwtbm!=null)
	{
		hfwtbm=cf.GB2Uni(hfwtbm);
		if (!(hfwtbm.equals("")))	wheresql+=" and  (hf_zsghfjl.hfwtbm='"+hfwtbm+"')";
	}
	
	String hf_zsghfjl_hfjlh=null;
	String hf_zsghfjl_hfsfcg=null;
	String hf_zsghfjl_hfr=null;
	String hf_zsghfjl_hfsj=null;
	String hf_zsghfjl_lrr=null;
	String hf_zsghfjl_lrsj=null;
	String hf_zsghfjl_lrbm=null;
	hf_zsghfjl_hfjlh=request.getParameter("hf_zsghfjl_hfjlh");
	if (hf_zsghfjl_hfjlh!=null)
	{
		hf_zsghfjl_hfjlh=cf.GB2Uni(hf_zsghfjl_hfjlh);
		if (!(hf_zsghfjl_hfjlh.equals("")))	wheresql+=" and  (hf_zsghfjl.hfjlh='"+hf_zsghfjl_hfjlh+"')";
	}
	hf_zsghfjl_hfsfcg=request.getParameter("hf_zsghfjl_hfsfcg");
	if (hf_zsghfjl_hfsfcg!=null)
	{
		hf_zsghfjl_hfsfcg=cf.GB2Uni(hf_zsghfjl_hfsfcg);
		if (!(hf_zsghfjl_hfsfcg.equals("")))	wheresql+=" and  (hf_zsghfjl.hfsfcg='"+hf_zsghfjl_hfsfcg+"')";
	}
	hf_zsghfjl_hfr=request.getParameter("hf_zsghfjl_hfr");
	if (hf_zsghfjl_hfr!=null)
	{
		hf_zsghfjl_hfr=cf.GB2Uni(hf_zsghfjl_hfr);
		if (!(hf_zsghfjl_hfr.equals("")))	wheresql+=" and  (hf_zsghfjl.hfr='"+hf_zsghfjl_hfr+"')";
	}
	hf_zsghfjl_hfsj=request.getParameter("hf_zsghfjl_hfsj");
	if (hf_zsghfjl_hfsj!=null)
	{
		hf_zsghfjl_hfsj=hf_zsghfjl_hfsj.trim();
		if (!(hf_zsghfjl_hfsj.equals("")))	wheresql+="  and (hf_zsghfjl.hfsj>=TO_DATE('"+hf_zsghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_hfsj=request.getParameter("hf_zsghfjl_hfsj2");
	if (hf_zsghfjl_hfsj!=null)
	{
		hf_zsghfjl_hfsj=hf_zsghfjl_hfsj.trim();
		if (!(hf_zsghfjl_hfsj.equals("")))	wheresql+="  and (hf_zsghfjl.hfsj<=TO_DATE('"+hf_zsghfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_lrr=request.getParameter("hf_zsghfjl_lrr");
	if (hf_zsghfjl_lrr!=null)
	{
		hf_zsghfjl_lrr=cf.GB2Uni(hf_zsghfjl_lrr);
		if (!(hf_zsghfjl_lrr.equals("")))	wheresql+=" and  (hf_zsghfjl.lrr='"+hf_zsghfjl_lrr+"')";
	}
	hf_zsghfjl_lrsj=request.getParameter("hf_zsghfjl_lrsj");
	if (hf_zsghfjl_lrsj!=null)
	{
		hf_zsghfjl_lrsj=hf_zsghfjl_lrsj.trim();
		if (!(hf_zsghfjl_lrsj.equals("")))	wheresql+="  and (hf_zsghfjl.lrsj>=TO_DATE('"+hf_zsghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_lrsj=request.getParameter("hf_zsghfjl_lrsj2");
	if (hf_zsghfjl_lrsj!=null)
	{
		hf_zsghfjl_lrsj=hf_zsghfjl_lrsj.trim();
		if (!(hf_zsghfjl_lrsj.equals("")))	wheresql+="  and (hf_zsghfjl.lrsj<=TO_DATE('"+hf_zsghfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_zsghfjl_lrbm=request.getParameter("hf_zsghfjl_lrbm");
	if (hf_zsghfjl_lrbm!=null)
	{
		hf_zsghfjl_lrbm=cf.GB2Uni(hf_zsghfjl_lrbm);
		if (!(hf_zsghfjl_lrbm.equals("")))	wheresql+=" and  (hf_zsghfjl.lrbm='"+hf_zsghfjl_lrbm+"')";
	}
	ls_sql="SELECT hf_zsghfjl.hfjlh,hflxmc,hfjgmc,hfwtmc,DECODE(hf_zsghfjl.wtclzt,'1','未处理','2','在处理','3','已解决'),hf_zsghfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,hf_zsghfjl.hfr,hf_zsghfjl.hfsj,hf_zsghfjl.hfsm, hf_zsghfjl.lrr,hf_zsghfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,hf_zsghfjl,dm_hfjgbm,dm_hfwtbm,sq_sgd,sq_dwxx,dm_hflxbm  ";
    ls_sql+=" where hf_zsghfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and hf_zsghfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and hf_zsghfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and hf_zsghfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
    ls_sql+=" and hf_zsghfjl.hflxbm=dm_hflxbm.hflxbm(+)";
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
	pageObj.initPage("Hf_zsghfjlList.jsp","","","EditHf_zsghfjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfjlh","hf_zsghfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","hf_zsghfjl_hfr","hf_zsghfjl_hfsj","hf_zsghfjl_hfsm","hf_zsghfjl_hfsfcg","hf_zsghfjl_hfr","hf_zsghfjl_hfsj","hf_zsghfjl_hfsm","hf_zsghfjl_xmjfr","hf_zsghfjl_xmjfsj","hf_zsghfjl_xmjfsm","hf_zsghfjl_clzt","hf_zsghfjl_lrr","hf_zsghfjl_lrsj","hf_zsghfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteHf_zsghfjl.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParm.link="ViewHf_zsghfjl.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">回访记录－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">回访记录号</td>
	<td  width="5%">回访类型</td>
	<td  width="3%">回访结果</td>
	<td  width="6%">回访问题</td>
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
	<td  width="20%">回访说明</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
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