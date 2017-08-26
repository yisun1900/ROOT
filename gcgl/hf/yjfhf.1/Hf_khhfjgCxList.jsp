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
	String hf_khhfjg_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String hf_khhfjg_hflxbm=null;
	String hf_khhfjg_hfdxbm=null;
	String hf_khhfjg_dxpjzbbm=null;
	String hf_khhfjg_pfbm=null;
	String hf_khhfjg_pfmc=null;
	String hf_khhfjg_df=null;
	String hf_khhfjg_lrr=null;
	String hf_khhfjg_lrsj=null;
	String hf_khhfjg_xh=null;
	hf_khhfjg_khbh=request.getParameter("hf_khhfjg_khbh");
	if (hf_khhfjg_khbh!=null)
	{
		hf_khhfjg_khbh=cf.GB2Uni(hf_khhfjg_khbh);
		if (!(hf_khhfjg_khbh.equals("")))	wheresql+=" and  (hf_khhfjg.khbh='"+hf_khhfjg_khbh+"')";
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
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	hf_khhfjg_hflxbm=request.getParameter("hf_khhfjg_hflxbm");
	if (hf_khhfjg_hflxbm!=null)
	{
		hf_khhfjg_hflxbm=cf.GB2Uni(hf_khhfjg_hflxbm);
		if (!(hf_khhfjg_hflxbm.equals("")))	wheresql+=" and  (hf_khhfjg.hflxbm='"+hf_khhfjg_hflxbm+"')";
	}
	hf_khhfjg_hfdxbm=request.getParameter("hf_khhfjg_hfdxbm");
	if (hf_khhfjg_hfdxbm!=null)
	{
		hf_khhfjg_hfdxbm=cf.GB2Uni(hf_khhfjg_hfdxbm);
		if (!(hf_khhfjg_hfdxbm.equals("")))	wheresql+=" and  (hf_khhfjg.hfdxbm='"+hf_khhfjg_hfdxbm+"')";
	}
	hf_khhfjg_dxpjzbbm=request.getParameter("hf_khhfjg_dxpjzbbm");
	if (hf_khhfjg_dxpjzbbm!=null)
	{
		hf_khhfjg_dxpjzbbm=cf.GB2Uni(hf_khhfjg_dxpjzbbm);
		if (!(hf_khhfjg_dxpjzbbm.equals("")))	wheresql+=" and  (hf_khhfjg.dxpjzbbm='"+hf_khhfjg_dxpjzbbm+"')";
	}
	hf_khhfjg_pfbm=request.getParameter("hf_khhfjg_pfbm");
	if (hf_khhfjg_pfbm!=null)
	{
		hf_khhfjg_pfbm=cf.GB2Uni(hf_khhfjg_pfbm);
		if (!(hf_khhfjg_pfbm.equals("")))	wheresql+=" and  (hf_khhfjg.pfbm='"+hf_khhfjg_pfbm+"')";
	}
	hf_khhfjg_pfmc=request.getParameter("hf_khhfjg_pfmc");
	if (hf_khhfjg_pfmc!=null)
	{
		hf_khhfjg_pfmc=cf.GB2Uni(hf_khhfjg_pfmc);
		if (!(hf_khhfjg_pfmc.equals("")))	wheresql+=" and  (hf_khhfjg.pfmc='"+hf_khhfjg_pfmc+"')";
	}
	hf_khhfjg_df=request.getParameter("hf_khhfjg_df");
	if (hf_khhfjg_df!=null)
	{
		hf_khhfjg_df=hf_khhfjg_df.trim();
		if (!(hf_khhfjg_df.equals("")))	wheresql+=" and  (hf_khhfjg.df="+hf_khhfjg_df+") ";
	}
	hf_khhfjg_lrr=request.getParameter("hf_khhfjg_lrr");
	if (hf_khhfjg_lrr!=null)
	{
		hf_khhfjg_lrr=cf.GB2Uni(hf_khhfjg_lrr);
		if (!(hf_khhfjg_lrr.equals("")))	wheresql+=" and  (hf_khhfjg.lrr='"+hf_khhfjg_lrr+"')";
	}
	hf_khhfjg_lrsj=request.getParameter("hf_khhfjg_lrsj");
	if (hf_khhfjg_lrsj!=null)
	{
		hf_khhfjg_lrsj=hf_khhfjg_lrsj.trim();
		if (!(hf_khhfjg_lrsj.equals("")))	wheresql+="  and (hf_khhfjg.lrsj>=TO_DATE('"+hf_khhfjg_lrsj+"','YYYY/MM/DD'))";
	}
	hf_khhfjg_lrsj=request.getParameter("hf_khhfjg_lrsj2");
	if (hf_khhfjg_lrsj!=null)
	{
		hf_khhfjg_lrsj=hf_khhfjg_lrsj.trim();
		if (!(hf_khhfjg_lrsj.equals("")))	wheresql+="  and (hf_khhfjg.lrsj<=TO_DATE('"+hf_khhfjg_lrsj+"','YYYY/MM/DD'))";
	}
	hf_khhfjg_xh=request.getParameter("hf_khhfjg_xh");
	if (hf_khhfjg_xh!=null)
	{
		hf_khhfjg_xh=hf_khhfjg_xh.trim();
		if (!(hf_khhfjg_xh.equals("")))	wheresql+=" and (hf_khhfjg.xh="+hf_khhfjg_xh+") ";
	}
	ls_sql="SELECT hf_khhfjg.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,hf_khhfjg.hfdxmc,hf_khhfjg.dxpjzb,hf_khhfjg.pfmc,hf_khhfjg.df,hf_khhfjg.lrr,hf_khhfjg.lrsj,hf_khhfjg.xh  ";
	ls_sql+=" FROM crm_khxx,hf_khhfjg  ";
    ls_sql+=" where hf_khhfjg.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by hf_khhfjg.khbh,hf_khhfjg.hflxbm,hf_khhfjg.hfdxbm,hf_khhfjg.dxpjzbbm,hf_khhfjg.pfbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hf_khhfjgCxList.jsp","","","");
	pageObj.setPageRow(60);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","hf_khhfjg_hfdxmc","hf_khhfjg_dxpjzb","hf_khhfjg_pfbm","hf_khhfjg_pfmc","hf_khhfjg_df","hf_khhfjg_lrr","hf_khhfjg_lrsj","hf_khhfjg_xh"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("hfdxmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="7%">合同号</td>
	<td  width="5%">设计师</td>
	<td  width="18%">回访对象</td>
	<td  width="18%">回访对象评价指标</td>
	<td  width="5%">答案</td>
	<td  width="4%">得分</td>
	<td  width="4%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="5%">序号</td>
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