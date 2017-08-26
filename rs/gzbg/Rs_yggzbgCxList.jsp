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
	String rs_yggzbg_ygbh=null;
	String rs_yggzbg_sjqd=null;
	String rs_yggzbg_sjzd=null;
	String rs_yggzbg_xm=null;
	String rs_yggzbg_xzzwbm=null;
	String rs_yggzbg_ssfgs=null;
	String rs_yggzbg_dwbh=null;
	String rs_yggzbg_lrr=null;
	String rs_yggzbg_lrsj=null;
	rs_yggzbg_ygbh=request.getParameter("rs_yggzbg_ygbh");
	if (rs_yggzbg_ygbh!=null)
	{
		rs_yggzbg_ygbh=rs_yggzbg_ygbh.trim();
		if (!(rs_yggzbg_ygbh.equals("")))	wheresql+=" and (rs_yggzbg.ygbh="+rs_yggzbg_ygbh+") ";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd>=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjqd=request.getParameter("rs_yggzbg_sjqd2");
	if (rs_yggzbg_sjqd!=null)
	{
		rs_yggzbg_sjqd=rs_yggzbg_sjqd.trim();
		if (!(rs_yggzbg_sjqd.equals("")))	wheresql+="  and (rs_yggzbg.sjqd<=TO_DATE('"+rs_yggzbg_sjqd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd>=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_sjzd=request.getParameter("rs_yggzbg_sjzd2");
	if (rs_yggzbg_sjzd!=null)
	{
		rs_yggzbg_sjzd=rs_yggzbg_sjzd.trim();
		if (!(rs_yggzbg_sjzd.equals("")))	wheresql+="  and (rs_yggzbg.sjzd<=TO_DATE('"+rs_yggzbg_sjzd+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_xm=request.getParameter("rs_yggzbg_xm");
	if (rs_yggzbg_xm!=null)
	{
		rs_yggzbg_xm=cf.GB2Uni(rs_yggzbg_xm);
		if (!(rs_yggzbg_xm.equals("")))	wheresql+=" and  (rs_yggzbg.xm='"+rs_yggzbg_xm+"')";
	}
	rs_yggzbg_xzzwbm=request.getParameter("rs_yggzbg_xzzwbm");
	if (rs_yggzbg_xzzwbm!=null)
	{
		rs_yggzbg_xzzwbm=cf.GB2Uni(rs_yggzbg_xzzwbm);
		if (!(rs_yggzbg_xzzwbm.equals("")))	wheresql+=" and  (rs_yggzbg.xzzwbm='"+rs_yggzbg_xzzwbm+"')";
	}
	rs_yggzbg_ssfgs=request.getParameter("rs_yggzbg_ssfgs");
	if (rs_yggzbg_ssfgs!=null)
	{
		rs_yggzbg_ssfgs=cf.GB2Uni(rs_yggzbg_ssfgs);
		if (!(rs_yggzbg_ssfgs.equals("")))	wheresql+=" and  (rs_yggzbg.ssfgs='"+rs_yggzbg_ssfgs+"')";
	}
	rs_yggzbg_dwbh=request.getParameter("rs_yggzbg_dwbh");
	if (rs_yggzbg_dwbh!=null)
	{
		rs_yggzbg_dwbh=cf.GB2Uni(rs_yggzbg_dwbh);
		if (!(rs_yggzbg_dwbh.equals("")))	wheresql+=" and  (rs_yggzbg.dwbh='"+rs_yggzbg_dwbh+"')";
	}
	rs_yggzbg_lrr=request.getParameter("rs_yggzbg_lrr");
	if (rs_yggzbg_lrr!=null)
	{
		rs_yggzbg_lrr=cf.GB2Uni(rs_yggzbg_lrr);
		if (!(rs_yggzbg_lrr.equals("")))	wheresql+=" and  (rs_yggzbg.lrr='"+rs_yggzbg_lrr+"')";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj>=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}
	rs_yggzbg_lrsj=request.getParameter("rs_yggzbg_lrsj2");
	if (rs_yggzbg_lrsj!=null)
	{
		rs_yggzbg_lrsj=rs_yggzbg_lrsj.trim();
		if (!(rs_yggzbg_lrsj.equals("")))	wheresql+="  and (rs_yggzbg.lrsj<=TO_DATE('"+rs_yggzbg_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT rs_yggzbg.sjqd,rs_yggzbg.sjzd,a.dwmc ssbm,rs_yggzbg.xm,rs_yggzbg.xzzwbm,rs_yggzbg.gzsm,gzsj,rs_yggzbg.lrr,rs_yggzbg.lrsj,b.dwmc ssfgs,rs_yggzbg.ygbh  ";
	ls_sql+=" FROM rs_yggzbg,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where rs_yggzbg.dwbh=a.dwbh and rs_yggzbg.ssfgs=b.dwbh";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and rs_yggzbg.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and rs_yggzbg.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}

	ls_sql+=wheresql;
    ls_sql+=" order by rs_yggzbg.sjqd,rs_yggzbg.dwbh,rs_yggzbg.xm desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_yggzbgCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数


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
  <B><font size="3">员工工作报告-查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">报告时间起点</td>
	<td  width="5%">报告时间终点</td>
	<td  width="7%">所属部门</td>
	<td  width="5%">姓名</td>
	<td  width="5%">职务</td>
	<td  width="50%">工作说明</td>
	<td  width="4%">工作时间</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="6%">所属分公司</td>
	<td  width="4%">员工序号</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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