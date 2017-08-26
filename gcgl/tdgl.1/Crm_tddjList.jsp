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
	String crm_tddj_tdxh=null;
	String crm_tddj_khbh=null;
	String crm_tddj_khxm=null;
	String crm_tddj_fwdz=null;
	String crm_tddj_dh=null;
	String crm_tddj_sjs=null;
	String crm_tddj_zjxm=null;
	String crm_tddj_sgd=null;
	String crm_tddj_sgbz=null;
	String crm_tddj_dwbh=null;
	String crm_tddj_tdyybm=null;
	String crm_tddj_tdyysm=null;
	String crm_tddj_sffj=null;
	String crm_tddj_sfyrz=null;
	String crm_tddj_ytje=null;
	String crm_tddj_stje=null;
	String crm_tddj_lrdw=null;
	String crm_tddj_lrr=null;
	String crm_tddj_lrsj=null;

	String sfthlp=null;
	sfthlp=request.getParameter("sfthlp");
	if (sfthlp!=null)
	{
		if (!(sfthlp.equals("")))	wheresql+=" and  (crm_tddj.sfthlp='"+sfthlp+"')";
	}
	
	crm_tddj_tdxh=request.getParameter("crm_tddj_tdxh");
	if (crm_tddj_tdxh!=null)
	{
		crm_tddj_tdxh=cf.GB2Uni(crm_tddj_tdxh);
		if (!(crm_tddj_tdxh.equals("")))	wheresql+=" and  (crm_tddj.tdxh='"+crm_tddj_tdxh+"')";
	}
	crm_tddj_khbh=request.getParameter("crm_tddj_khbh");
	if (crm_tddj_khbh!=null)
	{
		crm_tddj_khbh=cf.GB2Uni(crm_tddj_khbh);
		if (!(crm_tddj_khbh.equals("")))	wheresql+=" and  (crm_tddj.khbh='"+crm_tddj_khbh+"')";
	}
	crm_tddj_khxm=request.getParameter("crm_tddj_khxm");
	if (crm_tddj_khxm!=null)
	{
		crm_tddj_khxm=cf.GB2Uni(crm_tddj_khxm);
		if (!(crm_tddj_khxm.equals("")))	wheresql+=" and  (crm_tddj.khxm like '%"+crm_tddj_khxm+"%')";
	}
	crm_tddj_fwdz=request.getParameter("crm_tddj_fwdz");
	if (crm_tddj_fwdz!=null)
	{
		crm_tddj_fwdz=cf.GB2Uni(crm_tddj_fwdz);
		if (!(crm_tddj_fwdz.equals("")))	wheresql+=" and  (crm_tddj.fwdz like '%"+crm_tddj_fwdz+"%')";
	}
	crm_tddj_dh=request.getParameter("crm_tddj_dh");
	if (crm_tddj_dh!=null)
	{
		crm_tddj_dh=cf.GB2Uni(crm_tddj_dh);
		if (!(crm_tddj_dh.equals("")))	wheresql+=" and  (crm_tddj.dh='"+crm_tddj_dh+"')";
	}
	crm_tddj_sjs=request.getParameter("crm_tddj_sjs");
	if (crm_tddj_sjs!=null)
	{
		crm_tddj_sjs=cf.GB2Uni(crm_tddj_sjs);
		if (!(crm_tddj_sjs.equals("")))	wheresql+=" and  (crm_tddj.sjs='"+crm_tddj_sjs+"')";
	}
	crm_tddj_zjxm=request.getParameter("crm_tddj_zjxm");
	if (crm_tddj_zjxm!=null)
	{
		crm_tddj_zjxm=cf.GB2Uni(crm_tddj_zjxm);
		if (!(crm_tddj_zjxm.equals("")))	wheresql+=" and  (crm_tddj.zjxm='"+crm_tddj_zjxm+"')";
	}
	crm_tddj_sgd=request.getParameter("crm_tddj_sgd");
	if (crm_tddj_sgd!=null)
	{
		crm_tddj_sgd=cf.GB2Uni(crm_tddj_sgd);
		if (!(crm_tddj_sgd.equals("")))	wheresql+=" and  (crm_tddj.sgd='"+crm_tddj_sgd+"')";
	}
	crm_tddj_sgbz=request.getParameter("crm_tddj_sgbz");
	if (crm_tddj_sgbz!=null)
	{
		crm_tddj_sgbz=cf.GB2Uni(crm_tddj_sgbz);
		if (!(crm_tddj_sgbz.equals("")))	wheresql+=" and  (crm_tddj.sgbz='"+crm_tddj_sgbz+"')";
	}
	crm_tddj_dwbh=request.getParameter("crm_tddj_dwbh");
	if (crm_tddj_dwbh!=null)
	{
		crm_tddj_dwbh=cf.GB2Uni(crm_tddj_dwbh);
		if (!(crm_tddj_dwbh.equals("")))	wheresql+=" and  (crm_tddj.dwbh='"+crm_tddj_dwbh+"')";
	}
	crm_tddj_tdyybm=request.getParameter("crm_tddj_tdyybm");
	if (crm_tddj_tdyybm!=null)
	{
		crm_tddj_tdyybm=cf.GB2Uni(crm_tddj_tdyybm);
		if (!(crm_tddj_tdyybm.equals("")))	wheresql+=" and  (crm_tddj.tdyybm='"+crm_tddj_tdyybm+"')";
	}
	crm_tddj_tdyysm=request.getParameter("crm_tddj_tdyysm");
	if (crm_tddj_tdyysm!=null)
	{
		crm_tddj_tdyysm=cf.GB2Uni(crm_tddj_tdyysm);
		if (!(crm_tddj_tdyysm.equals("")))	wheresql+=" and  (crm_tddj.tdyysm='"+crm_tddj_tdyysm+"')";
	}
	crm_tddj_sffj=request.getParameter("crm_tddj_sffj");
	if (crm_tddj_sffj!=null)
	{
		crm_tddj_sffj=cf.GB2Uni(crm_tddj_sffj);
		if (!(crm_tddj_sffj.equals("")))	wheresql+=" and  (crm_tddj.sffj='"+crm_tddj_sffj+"')";
	}
	crm_tddj_sfyrz=request.getParameter("crm_tddj_sfyrz");
	if (crm_tddj_sfyrz!=null)
	{
		crm_tddj_sfyrz=cf.GB2Uni(crm_tddj_sfyrz);
		if (!(crm_tddj_sfyrz.equals("")))	wheresql+=" and  (crm_tddj.sfyrz='"+crm_tddj_sfyrz+"')";
	}
	crm_tddj_ytje=request.getParameter("crm_tddj_ytje");
	if (crm_tddj_ytje!=null)
	{
		crm_tddj_ytje=crm_tddj_ytje.trim();
		if (!(crm_tddj_ytje.equals("")))	wheresql+=" and  (crm_tddj.ytje="+crm_tddj_ytje+") ";
	}
	crm_tddj_stje=request.getParameter("crm_tddj_stje");
	if (crm_tddj_stje!=null)
	{
		crm_tddj_stje=crm_tddj_stje.trim();
		if (!(crm_tddj_stje.equals("")))	wheresql+=" and  (crm_tddj.stje="+crm_tddj_stje+") ";
	}
	crm_tddj_lrdw=request.getParameter("crm_tddj_lrdw");
	if (crm_tddj_lrdw!=null)
	{
		crm_tddj_lrdw=cf.GB2Uni(crm_tddj_lrdw);
		if (!(crm_tddj_lrdw.equals("")))	wheresql+=" and  (crm_tddj.lrdw='"+crm_tddj_lrdw+"')";
	}
	crm_tddj_lrr=request.getParameter("crm_tddj_lrr");
	if (crm_tddj_lrr!=null)
	{
		crm_tddj_lrr=cf.GB2Uni(crm_tddj_lrr);
		if (!(crm_tddj_lrr.equals("")))	wheresql+=" and  (crm_tddj.lrr='"+crm_tddj_lrr+"')";
	}
	crm_tddj_lrsj=request.getParameter("crm_tddj_lrsj");
	if (crm_tddj_lrsj!=null)
	{
		crm_tddj_lrsj=crm_tddj_lrsj.trim();
		if (!(crm_tddj_lrsj.equals("")))	wheresql+="  and (crm_tddj.lrsj>=TO_DATE('"+crm_tddj_lrsj+"','YYYY/MM/DD'))";
	}
	crm_tddj_lrsj=request.getParameter("crm_tddj_lrsj2");
	if (crm_tddj_lrsj!=null)
	{
		crm_tddj_lrsj=crm_tddj_lrsj.trim();
		if (!(crm_tddj_lrsj.equals("")))	wheresql+="  and (crm_tddj.lrsj<=TO_DATE('"+crm_tddj_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_tddj.tdxh as tdxh,DECODE(crm_tddj.sfthlp,'Y','退回','N','未退回','W','未领礼品') sfthlp,crm_tddj.tdsj,crm_tddj.lrr,crm_tddj.lrsj,crm_tddj.khbh as khbh,crm_tddj.khxm as crm_tddj_khxm,crm_tddj.fwdz as crm_tddj_fwdz,crm_tddj.sjs as crm_tddj_sjs,crm_tddj.zjxm as crm_tddj_zjxm,sgdmc as crm_tddj_sgd,qye,qyrq,a.dwmc as sq_dwxx_dwmc,dm_tdyybm.tdyymc as dm_tdyybm_tdyymc,crm_tddj.ytje as crm_tddj_ytje,crm_tddj.stje as crm_tddj_stje  ";
	ls_sql+=" FROM sq_dwxx a,sq_sgd,dm_tdyybm,crm_tddj,crm_khxx  ";
    ls_sql+=" where crm_tddj.dwbh=a.dwbh and crm_tddj.sgd=sq_sgd.sgd(+) and crm_tddj.tdyybm=dm_tdyybm.tdyybm";
    ls_sql+=" and crm_tddj.khbh=crm_khxx.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_tddj.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_tddjList.jsp","SelectCrm_tddj.jsp","","EditCrm_tddj.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"tdxh","sfthlp","crm_tddj_khxm","crm_tddj_fwdz","crm_tddj_sjs","crm_tddj_zjxm","crm_tddj_sgd","qye","qyrq","tdsj","lrr","lrsj","sq_dwxx_dwmc","dm_tdyybm_tdyymc","crm_tddj_ytje","crm_tddj_stje"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"tdxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCrm_tddj.jsp"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("crm_tddj_khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tdxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCrm_tddj.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tdxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">退单序号</td>
	<td  width="5%">是否退回全部礼品</td>
	<td  width="5%">客户姓名</td>
	<td  width="14%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">工程担当</td>
	<td  width="4%">施工队</td>
	<td  width="5%">签约额</td>
	<td  width="5%">签单时间</td>
	<td  width="5%">退单时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">签单店面</td>
	<td  width="11%">退单原因</td>
	<td  width="6%">应退金额</td>
	<td  width="6%">实退金额</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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