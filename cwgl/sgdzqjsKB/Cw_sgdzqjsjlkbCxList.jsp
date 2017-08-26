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
	String cw_sgdzqjsjlkb_jsjlh=null;
	String cw_sgdzqjsjlkb_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String cw_sgdzqjsjlkb_sgd=null;
	String cw_sgdzqjsjlkb_sgbz=null;
	String cw_sgdzqjsjlkb_jsrq=null;
	String cw_sgdzqjsjlkb_jskjs=null;
	String cw_sgdzqjsjlkb_jsbl=null;
	String cw_sgdzqjsjlkb_jsje=null;
	String cw_sgdzqjsjlkb_lrr=null;
	String cw_sgdzqjsjlkb_lrsj=null;
	String cw_sgdzqjsjlkb_lrbm=null;
	cw_sgdzqjsjlkb_jsjlh=request.getParameter("cw_sgdzqjsjlkb_jsjlh");
	if (cw_sgdzqjsjlkb_jsjlh!=null)
	{
		cw_sgdzqjsjlkb_jsjlh=cf.GB2Uni(cw_sgdzqjsjlkb_jsjlh);
		if (!(cw_sgdzqjsjlkb_jsjlh.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsjlh='"+cw_sgdzqjsjlkb_jsjlh+"')";
	}
	cw_sgdzqjsjlkb_khbh=request.getParameter("cw_sgdzqjsjlkb_khbh");
	if (cw_sgdzqjsjlkb_khbh!=null)
	{
		cw_sgdzqjsjlkb_khbh=cf.GB2Uni(cw_sgdzqjsjlkb_khbh);
		if (!(cw_sgdzqjsjlkb_khbh.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.khbh='"+cw_sgdzqjsjlkb_khbh+"')";
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
	cw_sgdzqjsjlkb_sgd=request.getParameter("cw_sgdzqjsjlkb_sgd");
	if (cw_sgdzqjsjlkb_sgd!=null)
	{
		cw_sgdzqjsjlkb_sgd=cf.GB2Uni(cw_sgdzqjsjlkb_sgd);
		if (!(cw_sgdzqjsjlkb_sgd.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgd='"+cw_sgdzqjsjlkb_sgd+"')";
	}
	cw_sgdzqjsjlkb_sgbz=request.getParameter("cw_sgdzqjsjlkb_sgbz");
	if (cw_sgdzqjsjlkb_sgbz!=null)
	{
		cw_sgdzqjsjlkb_sgbz=cf.GB2Uni(cw_sgdzqjsjlkb_sgbz);
		if (!(cw_sgdzqjsjlkb_sgbz.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.sgbz='"+cw_sgdzqjsjlkb_sgbz+"')";
	}
	cw_sgdzqjsjlkb_jsrq=request.getParameter("cw_sgdzqjsjlkb_jsrq");
	if (cw_sgdzqjsjlkb_jsrq!=null)
	{
		cw_sgdzqjsjlkb_jsrq=cw_sgdzqjsjlkb_jsrq.trim();
		if (!(cw_sgdzqjsjlkb_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.jsrq=TO_DATE('"+cw_sgdzqjsjlkb_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_jskjs=request.getParameter("cw_sgdzqjsjlkb_jskjs");
	if (cw_sgdzqjsjlkb_jskjs!=null)
	{
		cw_sgdzqjsjlkb_jskjs=cw_sgdzqjsjlkb_jskjs.trim();
		if (!(cw_sgdzqjsjlkb_jskjs.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jskjs="+cw_sgdzqjsjlkb_jskjs+") ";
	}
	cw_sgdzqjsjlkb_jsbl=request.getParameter("cw_sgdzqjsjlkb_jsbl");
	if (cw_sgdzqjsjlkb_jsbl!=null)
	{
		cw_sgdzqjsjlkb_jsbl=cw_sgdzqjsjlkb_jsbl.trim();
		if (!(cw_sgdzqjsjlkb_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsbl="+cw_sgdzqjsjlkb_jsbl+") ";
	}
	cw_sgdzqjsjlkb_jsje=request.getParameter("cw_sgdzqjsjlkb_jsje");
	if (cw_sgdzqjsjlkb_jsje!=null)
	{
		cw_sgdzqjsjlkb_jsje=cw_sgdzqjsjlkb_jsje.trim();
		if (!(cw_sgdzqjsjlkb_jsje.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.jsje="+cw_sgdzqjsjlkb_jsje+") ";
	}
	cw_sgdzqjsjlkb_lrr=request.getParameter("cw_sgdzqjsjlkb_lrr");
	if (cw_sgdzqjsjlkb_lrr!=null)
	{
		cw_sgdzqjsjlkb_lrr=cf.GB2Uni(cw_sgdzqjsjlkb_lrr);
		if (!(cw_sgdzqjsjlkb_lrr.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.lrr='"+cw_sgdzqjsjlkb_lrr+"')";
	}
	cw_sgdzqjsjlkb_lrsj=request.getParameter("cw_sgdzqjsjlkb_lrsj");
	if (cw_sgdzqjsjlkb_lrsj!=null)
	{
		cw_sgdzqjsjlkb_lrsj=cw_sgdzqjsjlkb_lrsj.trim();
		if (!(cw_sgdzqjsjlkb_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjsjlkb.lrsj=TO_DATE('"+cw_sgdzqjsjlkb_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjsjlkb_lrbm=request.getParameter("cw_sgdzqjsjlkb_lrbm");
	if (cw_sgdzqjsjlkb_lrbm!=null)
	{
		cw_sgdzqjsjlkb_lrbm=cf.GB2Uni(cw_sgdzqjsjlkb_lrbm);
		if (!(cw_sgdzqjsjlkb_lrbm.equals("")))	wheresql+=" and  (cw_sgdzqjsjlkb.lrbm='"+cw_sgdzqjsjlkb_lrbm+"')";
	}

	ls_sql="SELECT cw_sgdzqjsjlkb.jsjlh,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,sgdmc,cw_sgdzqjsjlkb.jsrq,cw_sgdzqjsjlkb.jskjs,cw_sgdzqjsjlkb.jsbl||'%',cw_sgdzqjsjlkb.jsje,''";
	ls_sql+=" FROM crm_khxx,cw_sgdzqjsjlkb,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_sgdzqjsjlkb.khbh=crm_khxx.khbh(+) and cw_sgdzqjsjlkb.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdzqjsjlkb.lx='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdzqjsjlkb.jsrq desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdzqjsjlkbCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sgdzqjsjlkb_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","cw_sgdzqjsjlkb_sgd","cw_sgdzqjsjlkb_sgbz","cw_sgdzqjsjlkb_jsrq","cw_sgdzqjsjlkb_jskjs","cw_sgdzqjsjlkb_jsbl","cw_sgdzqjsjlkb_jsje","cw_sgdzqjsjlkb_lrr","cw_sgdzqjsjlkb_lrsj","cw_sgdzqjsjlkb_lrbm","cw_sgdzqjsjlkb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
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
  <B><font size="3">工程拨款汇总表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">结算记录号</td>
	<td  width="4%">合同号</td>
	<td  width="4%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="4%">施工队</td>
	<td  width="5%">结算日期</td>
	<td  width="6%">中期实收款</td>
	<td  width="4%">结算比例</td>
	<td  width="6%">结算金额</td>
	<td  width="3%">签字</td>
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