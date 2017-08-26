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

	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz+"%')";
	}
	
	
	
	String crm_fdkhhf_hfjlh=null;
	String crm_fdkhhf_hfr=null;
	String crm_fdkhhf_hfsj=null;
	String crm_fdkhhf_hfsbyybm=null;
	String crm_fdkhhf_hfsbkhlx=null;
	String crm_fdkhhf_hfsbsj=null;
	String crm_fdkhhf_lx=null;
	String crm_fdkhhf_lrr=null;
	String crm_fdkhhf_lrsj=null;
	String crm_fdkhhf_lrbm=null;
	crm_fdkhhf_hfjlh=request.getParameter("crm_fdkhhf_hfjlh");
	if (crm_fdkhhf_hfjlh!=null)
	{
		crm_fdkhhf_hfjlh=cf.GB2Uni(crm_fdkhhf_hfjlh);
		if (!(crm_fdkhhf_hfjlh.equals("")))	wheresql+=" and  (crm_fdkhhf.hfjlh='"+crm_fdkhhf_hfjlh+"')";
	}
	crm_fdkhhf_hfr=request.getParameter("crm_fdkhhf_hfr");
	if (crm_fdkhhf_hfr!=null)
	{
		crm_fdkhhf_hfr=cf.GB2Uni(crm_fdkhhf_hfr);
		if (!(crm_fdkhhf_hfr.equals("")))	wheresql+=" and  (crm_fdkhhf.hfr='"+crm_fdkhhf_hfr+"')";
	}
	crm_fdkhhf_hfsj=request.getParameter("crm_fdkhhf_hfsj");
	if (crm_fdkhhf_hfsj!=null)
	{
		crm_fdkhhf_hfsj=crm_fdkhhf_hfsj.trim();
		if (!(crm_fdkhhf_hfsj.equals("")))	wheresql+="  and (crm_fdkhhf.hfsj>=TO_DATE('"+crm_fdkhhf_hfsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_hfsj=request.getParameter("crm_fdkhhf_hfsj2");
	if (crm_fdkhhf_hfsj!=null)
	{
		crm_fdkhhf_hfsj=crm_fdkhhf_hfsj.trim();
		if (!(crm_fdkhhf_hfsj.equals("")))	wheresql+="  and (crm_fdkhhf.hfsj<=TO_DATE('"+crm_fdkhhf_hfsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_hfsbyybm=request.getParameter("crm_fdkhhf_hfsbyybm");
	if (crm_fdkhhf_hfsbyybm!=null)
	{
		crm_fdkhhf_hfsbyybm=cf.GB2Uni(crm_fdkhhf_hfsbyybm);
		if (!(crm_fdkhhf_hfsbyybm.equals("")))	wheresql+=" and  (crm_fdkhhf.hfsbyybm='"+crm_fdkhhf_hfsbyybm+"')";
	}
	crm_fdkhhf_hfsbkhlx=request.getParameter("crm_fdkhhf_hfsbkhlx");
	if (crm_fdkhhf_hfsbkhlx!=null)
	{
		crm_fdkhhf_hfsbkhlx=cf.GB2Uni(crm_fdkhhf_hfsbkhlx);
		if (!(crm_fdkhhf_hfsbkhlx.equals("")))	wheresql+=" and  (crm_fdkhhf.hfsbkhlx='"+crm_fdkhhf_hfsbkhlx+"')";
	}
	crm_fdkhhf_hfsbsj=request.getParameter("crm_fdkhhf_hfsbsj");
	if (crm_fdkhhf_hfsbsj!=null)
	{
		crm_fdkhhf_hfsbsj=crm_fdkhhf_hfsbsj.trim();
		if (!(crm_fdkhhf_hfsbsj.equals("")))	wheresql+="  and (crm_fdkhhf.hfsbsj=TO_DATE('"+crm_fdkhhf_hfsbsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_lx=request.getParameter("crm_fdkhhf_lx");
	if (crm_fdkhhf_lx!=null)
	{
		crm_fdkhhf_lx=cf.GB2Uni(crm_fdkhhf_lx);
		if (!(crm_fdkhhf_lx.equals("")))	wheresql+=" and  (crm_fdkhhf.lx='"+crm_fdkhhf_lx+"')";
	}
	crm_fdkhhf_lrr=request.getParameter("crm_fdkhhf_lrr");
	if (crm_fdkhhf_lrr!=null)
	{
		crm_fdkhhf_lrr=cf.GB2Uni(crm_fdkhhf_lrr);
		if (!(crm_fdkhhf_lrr.equals("")))	wheresql+=" and  (crm_fdkhhf.lrr='"+crm_fdkhhf_lrr+"')";
	}
	crm_fdkhhf_lrsj=request.getParameter("crm_fdkhhf_lrsj");
	if (crm_fdkhhf_lrsj!=null)
	{
		crm_fdkhhf_lrsj=crm_fdkhhf_lrsj.trim();
		if (!(crm_fdkhhf_lrsj.equals("")))	wheresql+="  and (crm_fdkhhf.lrsj>=TO_DATE('"+crm_fdkhhf_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_lrsj=request.getParameter("crm_fdkhhf_lrsj2");
	if (crm_fdkhhf_lrsj!=null)
	{
		crm_fdkhhf_lrsj=crm_fdkhhf_lrsj.trim();
		if (!(crm_fdkhhf_lrsj.equals("")))	wheresql+="  and (crm_fdkhhf.lrsj<=TO_DATE('"+crm_fdkhhf_lrsj+"','YYYY/MM/DD'))";
	}
	crm_fdkhhf_lrbm=request.getParameter("crm_fdkhhf_lrbm");
	if (crm_fdkhhf_lrbm!=null)
	{
		crm_fdkhhf_lrbm=cf.GB2Uni(crm_fdkhhf_lrbm);
		if (!(crm_fdkhhf_lrbm.equals("")))	wheresql+=" and  (crm_fdkhhf.lrbm='"+crm_fdkhhf_lrbm+"')";
	}
	ls_sql="SELECT crm_fdkhhf.hfjlh, DECODE(crm_fdkhhf.lx,'1','飞单回访','2','随机回访','3','信息人回访'),crm_fdkhhf.khbh,a.dwmc,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_fdkhhf.hfr,crm_fdkhhf.hfsj,sbyymc,crm_fdkhhf.hfsbkhlx,crm_fdkhhf.hfsbyyxs,crm_fdkhhf.hfsbsj,crm_fdkhhf.lrr,crm_fdkhhf.lrsj,b.dwmc lrbm  ";
	ls_sql+=" FROM crm_fdkhhf,crm_zxkhxx,sq_dwxx a,sq_dwxx b,dm_sbyybm  ";
    ls_sql+=" where crm_fdkhhf.khbh=crm_zxkhxx.khbh(+)";
    ls_sql+=" and crm_zxkhxx.zxdm=a.dwbh(+)";
    ls_sql+=" and crm_fdkhhf.lrbm=b.dwbh(+)";
    ls_sql+=" and crm_fdkhhf.hfsbyybm=dm_sbyybm.sbyybm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_fdkhhf.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_fdkhhfCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"hfjlh","crm_fdkhhf_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_fdkhhf_hfr","crm_fdkhhf_hfsj","crm_fdkhhf_hfsbyybm","crm_fdkhhf_hfsbkhlx","crm_fdkhhf_hfsbyyxs","crm_fdkhhf_hfsbsj","crm_fdkhhf_lx","crm_fdkhhf_lrr","crm_fdkhhf_lrsj","crm_fdkhhf_lrbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"hfjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">飞单回访查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">回访记录号</td>
	<td  width="5%">类型</td>
	<td  width="4%">客户编号</td>
	<td  width="8%">店面</td>
	<td  width="4%">客户姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">回访人</td>
	<td  width="5%">回访时间</td>
	<td  width="7%">回访飞单原因</td>
	<td  width="7%">回访飞单客户流向</td>
	<td  width="19%">回访飞单原因详述</td>
	<td  width="5%">回访飞单时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
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