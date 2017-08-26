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
	
	
	
	String hf_bxkhhfjl_hfjlh=null;
	String hf_bxkhhfjl_hfsfcg=null;
	String hf_bxkhhfjl_hfr=null;
	String hf_bxkhhfjl_hfsj=null;
	String hf_bxkhhfjl_lrr=null;
	String hf_bxkhhfjl_lrsj=null;
	String hf_bxkhhfjl_lrbm=null;
	hf_bxkhhfjl_hfjlh=request.getParameter("hf_bxkhhfjl_hfjlh");
	if (hf_bxkhhfjl_hfjlh!=null)
	{
		hf_bxkhhfjl_hfjlh=cf.GB2Uni(hf_bxkhhfjl_hfjlh);
		if (!(hf_bxkhhfjl_hfjlh.equals("")))	wheresql+=" and  (hf_bxkhhfjl.hfjlh='"+hf_bxkhhfjl_hfjlh+"')";
	}
	hf_bxkhhfjl_hfsfcg=request.getParameter("hf_bxkhhfjl_hfsfcg");
	if (hf_bxkhhfjl_hfsfcg!=null)
	{
		hf_bxkhhfjl_hfsfcg=cf.GB2Uni(hf_bxkhhfjl_hfsfcg);
		if (!(hf_bxkhhfjl_hfsfcg.equals("")))	wheresql+=" and  (hf_bxkhhfjl.hfsfcg='"+hf_bxkhhfjl_hfsfcg+"')";
	}
	hf_bxkhhfjl_hfr=request.getParameter("hf_bxkhhfjl_hfr");
	if (hf_bxkhhfjl_hfr!=null)
	{
		hf_bxkhhfjl_hfr=cf.GB2Uni(hf_bxkhhfjl_hfr);
		if (!(hf_bxkhhfjl_hfr.equals("")))	wheresql+=" and  (hf_bxkhhfjl.hfr='"+hf_bxkhhfjl_hfr+"')";
	}
	hf_bxkhhfjl_hfsj=request.getParameter("hf_bxkhhfjl_hfsj");
	if (hf_bxkhhfjl_hfsj!=null)
	{
		hf_bxkhhfjl_hfsj=hf_bxkhhfjl_hfsj.trim();
		if (!(hf_bxkhhfjl_hfsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.hfsj>=TO_DATE('"+hf_bxkhhfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_hfsj=request.getParameter("hf_bxkhhfjl_hfsj2");
	if (hf_bxkhhfjl_hfsj!=null)
	{
		hf_bxkhhfjl_hfsj=hf_bxkhhfjl_hfsj.trim();
		if (!(hf_bxkhhfjl_hfsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.hfsj<=TO_DATE('"+hf_bxkhhfjl_hfsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_lrr=request.getParameter("hf_bxkhhfjl_lrr");
	if (hf_bxkhhfjl_lrr!=null)
	{
		hf_bxkhhfjl_lrr=cf.GB2Uni(hf_bxkhhfjl_lrr);
		if (!(hf_bxkhhfjl_lrr.equals("")))	wheresql+=" and  (hf_bxkhhfjl.lrr='"+hf_bxkhhfjl_lrr+"')";
	}
	hf_bxkhhfjl_lrsj=request.getParameter("hf_bxkhhfjl_lrsj");
	if (hf_bxkhhfjl_lrsj!=null)
	{
		hf_bxkhhfjl_lrsj=hf_bxkhhfjl_lrsj.trim();
		if (!(hf_bxkhhfjl_lrsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.lrsj>=TO_DATE('"+hf_bxkhhfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_lrsj=request.getParameter("hf_bxkhhfjl_lrsj2");
	if (hf_bxkhhfjl_lrsj!=null)
	{
		hf_bxkhhfjl_lrsj=hf_bxkhhfjl_lrsj.trim();
		if (!(hf_bxkhhfjl_lrsj.equals("")))	wheresql+="  and (hf_bxkhhfjl.lrsj<=TO_DATE('"+hf_bxkhhfjl_lrsj+"','YYYY/MM/DD'))";
	}
	hf_bxkhhfjl_lrbm=request.getParameter("hf_bxkhhfjl_lrbm");
	if (hf_bxkhhfjl_lrbm!=null)
	{
		hf_bxkhhfjl_lrbm=cf.GB2Uni(hf_bxkhhfjl_lrbm);
		if (!(hf_bxkhhfjl_lrbm.equals("")))	wheresql+=" and  (hf_bxkhhfjl.lrbm='"+hf_bxkhhfjl_lrbm+"')";
	}
	ls_sql="SELECT hf_bxkhhfjl.hfjlh,hfjgmc,hfwtmc,DECODE(hf_bxkhhfjl.wtclzt,'1','未处理','2','在处理','3','已解决'),hf_bxkhhfjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,sgdmc,crm_khxx.gj,crm_khxx.dd,hf_bxkhhfjl.hfr,hf_bxkhhfjl.hfsj,hf_bxkhhfjl.hfsm, hf_bxkhhfjl.lrr,hf_bxkhhfjl.lrsj,dwmc ";
	ls_sql+=" FROM crm_khxx,hf_bxkhhfjl,dm_hfjgbm,dm_hfwtbm,sq_sgd,sq_dwxx  ";
    ls_sql+=" where hf_bxkhhfjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and hf_bxkhhfjl.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and hf_bxkhhfjl.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and hf_bxkhhfjl.hfwtbm=dm_hfwtbm.hfwtbm(+)";
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
	pageObj.initPage("Hf_bxkhhfjlList.jsp","","","EditHf_bxkhhfjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfjlh","hf_bxkhhfjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","hf_bxkhhfjl_hfr","hf_bxkhhfjl_hfsj","hf_bxkhhfjl_hfsm","hf_bxkhhfjl_hfsfcg","hf_bxkhhfjl_hfr","hf_bxkhhfjl_hfsj","hf_bxkhhfjl_hfsm","hf_bxkhhfjl_xmjfr","hf_bxkhhfjl_xmjfsj","hf_bxkhhfjl_xmjfsm","hf_bxkhhfjl_clzt","hf_bxkhhfjl_lrr","hf_bxkhhfjl_lrsj","hf_bxkhhfjl_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteHf_bxkhhfjl.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParm.link="ViewHf_bxkhhfjl.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">完工后关怀回访－维护</font></B>
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