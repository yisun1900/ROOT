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
	String crm_gqtzjl_djjlh=null;
	String crm_gqtzjl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_gqtzjl_tzlx=null;
	String crm_gqtzjl_tzsjd=null;
	String crm_gqtzjl_tzts=null;
	String crm_gqtzjl_gqtzyybm=null;
	String crm_gqtzjl_lrr=null;
	String crm_gqtzjl_lrsj=null;
	String crm_gqtzjl_lrdw=null;
	crm_gqtzjl_djjlh=request.getParameter("crm_gqtzjl_djjlh");
	if (crm_gqtzjl_djjlh!=null)
	{
		crm_gqtzjl_djjlh=cf.GB2Uni(crm_gqtzjl_djjlh);
		if (!(crm_gqtzjl_djjlh.equals("")))	wheresql+=" and  (crm_gqtzjl.djjlh='"+crm_gqtzjl_djjlh+"')";
	}
	crm_gqtzjl_khbh=request.getParameter("crm_gqtzjl_khbh");
	if (crm_gqtzjl_khbh!=null)
	{
		crm_gqtzjl_khbh=cf.GB2Uni(crm_gqtzjl_khbh);
		if (!(crm_gqtzjl_khbh.equals("")))	wheresql+=" and  (crm_gqtzjl.khbh='"+crm_gqtzjl_khbh+"')";
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
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_gqtzjl_tzlx=request.getParameter("crm_gqtzjl_tzlx");
	if (crm_gqtzjl_tzlx!=null)
	{
		crm_gqtzjl_tzlx=cf.GB2Uni(crm_gqtzjl_tzlx);
		if (!(crm_gqtzjl_tzlx.equals("")))	wheresql+=" and  (crm_gqtzjl.tzlx='"+crm_gqtzjl_tzlx+"')";
	}
	crm_gqtzjl_tzsjd=request.getParameter("crm_gqtzjl_tzsjd");
	if (crm_gqtzjl_tzsjd!=null)
	{
		crm_gqtzjl_tzsjd=crm_gqtzjl_tzsjd.trim();
		if (!(crm_gqtzjl_tzsjd.equals("")))	wheresql+="  and (crm_gqtzjl.tzsjd>=TO_DATE('"+crm_gqtzjl_tzsjd+"','YYYY/MM/DD'))";
	}
	crm_gqtzjl_tzsjd=request.getParameter("crm_gqtzjl_tzsjd2");
	if (crm_gqtzjl_tzsjd!=null)
	{
		crm_gqtzjl_tzsjd=crm_gqtzjl_tzsjd.trim();
		if (!(crm_gqtzjl_tzsjd.equals("")))	wheresql+="  and (crm_gqtzjl.tzsjd<=TO_DATE('"+crm_gqtzjl_tzsjd+"','YYYY/MM/DD'))";
	}
	crm_gqtzjl_tzts=request.getParameter("crm_gqtzjl_tzts");
	if (crm_gqtzjl_tzts!=null)
	{
		crm_gqtzjl_tzts=crm_gqtzjl_tzts.trim();
		if (!(crm_gqtzjl_tzts.equals("")))	wheresql+=" and (crm_gqtzjl.tzts="+crm_gqtzjl_tzts+") ";
	}
	crm_gqtzjl_gqtzyybm=request.getParameter("crm_gqtzjl_gqtzyybm");
	if (crm_gqtzjl_gqtzyybm!=null)
	{
		crm_gqtzjl_gqtzyybm=cf.GB2Uni(crm_gqtzjl_gqtzyybm);
		if (!(crm_gqtzjl_gqtzyybm.equals("")))	wheresql+=" and  (crm_gqtzjl.gqtzyybm='"+crm_gqtzjl_gqtzyybm+"')";
	}
	crm_gqtzjl_lrr=request.getParameter("crm_gqtzjl_lrr");
	if (crm_gqtzjl_lrr!=null)
	{
		crm_gqtzjl_lrr=cf.GB2Uni(crm_gqtzjl_lrr);
		if (!(crm_gqtzjl_lrr.equals("")))	wheresql+=" and  (crm_gqtzjl.lrr='"+crm_gqtzjl_lrr+"')";
	}
	crm_gqtzjl_lrsj=request.getParameter("crm_gqtzjl_lrsj");
	if (crm_gqtzjl_lrsj!=null)
	{
		crm_gqtzjl_lrsj=crm_gqtzjl_lrsj.trim();
		if (!(crm_gqtzjl_lrsj.equals("")))	wheresql+="  and (crm_gqtzjl.lrsj>=TO_DATE('"+crm_gqtzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gqtzjl_lrsj=request.getParameter("crm_gqtzjl_lrsj2");
	if (crm_gqtzjl_lrsj!=null)
	{
		crm_gqtzjl_lrsj=crm_gqtzjl_lrsj.trim();
		if (!(crm_gqtzjl_lrsj.equals("")))	wheresql+="  and (crm_gqtzjl.lrsj<=TO_DATE('"+crm_gqtzjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_gqtzjl_lrdw=request.getParameter("crm_gqtzjl_lrdw");
	if (crm_gqtzjl_lrdw!=null)
	{
		crm_gqtzjl_lrdw=cf.GB2Uni(crm_gqtzjl_lrdw);
		if (!(crm_gqtzjl_lrdw.equals("")))	wheresql+=" and  (crm_gqtzjl.lrdw='"+crm_gqtzjl_lrdw+"')";
	}
	ls_sql="SELECT crm_gqtzjl.djjlh,crm_gqtzjl.khbh,crm_khxx.khxm,crm_khxx.fwdz, DECODE(crm_gqtzjl.tzlx,'1','延期','2','工期缩减','3','工期合理增加'),crm_gqtzjl.tzsjd,crm_gqtzjl.tzts,gqtzyymc,crm_gqtzjl.tzyysm,crm_gqtzjl.lrr,crm_gqtzjl.lrsj,a.dwmc lrdw,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,sgdmc,crm_khxx.zjxm  ";
	ls_sql+=" FROM crm_gqtzjl,crm_khxx,sq_dwxx a,dm_gqtzyybm,sq_sgd  ";
    ls_sql+=" where crm_gqtzjl.khbh=crm_khxx.khbh(+) and crm_gqtzjl.lrdw=a.dwbh(+) and crm_gqtzjl.gqtzyybm=dm_gqtzyybm.gqtzyybm(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_gqtzjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_gqtzjlCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"djjlh","crm_gqtzjl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_sgd","crm_khxx_zjxm","crm_gqtzjl_tzlx","crm_gqtzjl_tzsjd","crm_gqtzjl_tzts","crm_gqtzjl_gqtzyybm","crm_gqtzjl_tzyysm","crm_gqtzjl_lrr","crm_gqtzjl_lrsj","crm_gqtzjl_lrdw"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djjlh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">查询－工期调整记录</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">登记记录号</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="10%">房屋地址</td>
	<td  width="5%">调整类型</td>
	<td  width="4%">调整时间点</td>
	<td  width="4%">调整天数</td>
	<td  width="6%">工期调整原因</td>
	<td  width="25%">调整原因说明</td>
	<td  width="4%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入单位</td>
	<td  width="4%">合同号</td>
	<td  width="4%">设计师</td>
	<td  width="4%">签约日期</td>
	<td  width="4%">施工队</td>
	<td  width="4%">工程担当</td>
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