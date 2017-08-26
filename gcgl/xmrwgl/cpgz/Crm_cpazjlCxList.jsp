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
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY-MM-DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	
	
	String crm_cpazjl_azjlh=null;
	String crm_cpazjl_khbh=null;
	String crm_cpazjl_cpflbm=null;
	String crm_cpazjl_azjg=null;
	String crm_cpazjl_smsj=null;
	String crm_cpazjl_smr=null;
	String crm_cpazjl_lrr=null;
	String crm_cpazjl_lrsj=null;
	String crm_cpazjl_lrbm=null;
	crm_cpazjl_azjlh=request.getParameter("crm_cpazjl_azjlh");
	if (crm_cpazjl_azjlh!=null)
	{
		crm_cpazjl_azjlh=cf.GB2Uni(crm_cpazjl_azjlh);
		if (!(crm_cpazjl_azjlh.equals("")))	wheresql+=" and  (crm_cpazjl.azjlh='"+crm_cpazjl_azjlh+"')";
	}
	crm_cpazjl_khbh=request.getParameter("crm_cpazjl_khbh");
	if (crm_cpazjl_khbh!=null)
	{
		crm_cpazjl_khbh=cf.GB2Uni(crm_cpazjl_khbh);
		if (!(crm_cpazjl_khbh.equals("")))	wheresql+=" and  (crm_cpazjl.khbh='"+crm_cpazjl_khbh+"')";
	}
	crm_cpazjl_cpflbm=request.getParameter("crm_cpazjl_cpflbm");
	if (crm_cpazjl_cpflbm!=null)
	{
		crm_cpazjl_cpflbm=cf.GB2Uni(crm_cpazjl_cpflbm);
		if (!(crm_cpazjl_cpflbm.equals("")))	wheresql+=" and  (crm_cpazjl.cpflbm='"+crm_cpazjl_cpflbm+"')";
	}
	crm_cpazjl_azjg=request.getParameter("crm_cpazjl_azjg");
	if (crm_cpazjl_azjg!=null)
	{
		crm_cpazjl_azjg=cf.GB2Uni(crm_cpazjl_azjg);
		if (!(crm_cpazjl_azjg.equals("")))	wheresql+=" and  (crm_cpazjl.azjg='"+crm_cpazjl_azjg+"')";
	}
	crm_cpazjl_smsj=request.getParameter("crm_cpazjl_smsj");
	if (crm_cpazjl_smsj!=null)
	{
		crm_cpazjl_smsj=crm_cpazjl_smsj.trim();
		if (!(crm_cpazjl_smsj.equals("")))	wheresql+="  and (crm_cpazjl.smsj>=TO_DATE('"+crm_cpazjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_smsj=request.getParameter("crm_cpazjl_smsj2");
	if (crm_cpazjl_smsj!=null)
	{
		crm_cpazjl_smsj=crm_cpazjl_smsj.trim();
		if (!(crm_cpazjl_smsj.equals("")))	wheresql+="  and (crm_cpazjl.smsj<=TO_DATE('"+crm_cpazjl_smsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_smr=request.getParameter("crm_cpazjl_smr");
	if (crm_cpazjl_smr!=null)
	{
		crm_cpazjl_smr=cf.GB2Uni(crm_cpazjl_smr);
		if (!(crm_cpazjl_smr.equals("")))	wheresql+=" and  (crm_cpazjl.smr='"+crm_cpazjl_smr+"')";
	}
	crm_cpazjl_lrr=request.getParameter("crm_cpazjl_lrr");
	if (crm_cpazjl_lrr!=null)
	{
		crm_cpazjl_lrr=cf.GB2Uni(crm_cpazjl_lrr);
		if (!(crm_cpazjl_lrr.equals("")))	wheresql+=" and  (crm_cpazjl.lrr='"+crm_cpazjl_lrr+"')";
	}
	crm_cpazjl_lrsj=request.getParameter("crm_cpazjl_lrsj");
	if (crm_cpazjl_lrsj!=null)
	{
		crm_cpazjl_lrsj=crm_cpazjl_lrsj.trim();
		if (!(crm_cpazjl_lrsj.equals("")))	wheresql+="  and (crm_cpazjl.lrsj>=TO_DATE('"+crm_cpazjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_lrsj=request.getParameter("crm_cpazjl_lrsj2");
	if (crm_cpazjl_lrsj!=null)
	{
		crm_cpazjl_lrsj=crm_cpazjl_lrsj.trim();
		if (!(crm_cpazjl_lrsj.equals("")))	wheresql+="  and (crm_cpazjl.lrsj<=TO_DATE('"+crm_cpazjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_cpazjl_lrbm=request.getParameter("crm_cpazjl_lrbm");
	if (crm_cpazjl_lrbm!=null)
	{
		crm_cpazjl_lrbm=cf.GB2Uni(crm_cpazjl_lrbm);
		if (!(crm_cpazjl_lrbm.equals("")))	wheresql+=" and  (crm_cpazjl.lrbm='"+crm_cpazjl_lrbm+"')";
	}
	ls_sql="SELECT crm_cpazjl.azjlh,crm_cpazjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.hth,crm_zxkhxx.sjs,crm_cpazjl.cpflbm,dm_cpflbm.cpflmc, DECODE(crm_cpazjl.azjg,'1','未完成','2','成功','3','失败') azjg,crm_cpazjl.smsj,crm_cpazjl.smr,crm_cpazjl.azsm,crm_cpazjl.lrr,crm_cpazjl.lrsj,dwmc ";
	ls_sql+=" FROM dm_cpflbm,crm_cpazjl,crm_zxkhxx,sq_dwxx  ";
    ls_sql+=" where crm_cpazjl.cpflbm=dm_cpflbm.cpflbm";
    ls_sql+=" and crm_cpazjl.khbh=crm_zxkhxx.khbh";
    ls_sql+=" and crm_cpazjl.lrbm=sq_dwxx.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_cpazjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_cpazjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数



//设置主键
	String[] keyName={"azjlh"};
	pageObj.setKey(keyName);

//设置显示列  
	String[] disColName={"azjlh","cpflmc","azjg","smsj","khbh","khxm","fwdz","hth","sjs","smr","azsm","lrr","lrsj","dwmc"};
	pageObj.setDisColName(disColName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh","cpflbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_cpgzjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cpflmc",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询安装记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">安装记录号</td>
	<td  width="7%">产品分类</td>
	<td  width="4%">安装结果</td>
	<td  width="5%">上门时间</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="14%">房屋地址</td>
	<td  width="5%">合同号</td>
	<td  width="3%">设计师</td>
	<td  width="3%">上门人</td>
	<td  width="31%">安装说明</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
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