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
	String xz_clwhfyb_djxh=null;
	String xz_clwhfyb_qcph=null;
	String xz_qcdm_qcxh=null;
	String xz_qcdm_sjxm=null;
	String xz_clwhfyb_xm=null;
	String xz_clwhfyb_fy=null;
	String xz_clwhfyb_djrq=null;
	String xz_clwhfyb_jsr=null;
	String xz_clwhfyb_pzr=null;
	String xz_clwhfyb_ssfgs=null;
	String xz_clwhfyb_lrr=null;
	String xz_clwhfyb_lrsj=null;

	String fyfsbm=null;
	fyfsbm=request.getParameter("fyfsbm");
	if (fyfsbm!=null)
	{
		if (!(fyfsbm.equals("")))	wheresql+=" and (xz_clwhfyb.fyfsbm='"+fyfsbm+"') ";
	}

	xz_clwhfyb_djxh=request.getParameter("xz_clwhfyb_djxh");
	if (xz_clwhfyb_djxh!=null)
	{
		xz_clwhfyb_djxh=xz_clwhfyb_djxh.trim();
		if (!(xz_clwhfyb_djxh.equals("")))	wheresql+=" and (xz_clwhfyb.djxh="+xz_clwhfyb_djxh+") ";
	}
	xz_clwhfyb_qcph=request.getParameter("xz_clwhfyb_qcph");
	if (xz_clwhfyb_qcph!=null)
	{
		xz_clwhfyb_qcph=cf.GB2Uni(xz_clwhfyb_qcph);
		if (!(xz_clwhfyb_qcph.equals("")))	wheresql+=" and  (xz_clwhfyb.qcph like '%"+xz_clwhfyb_qcph+"%')";
	}
	xz_qcdm_qcxh=request.getParameter("xz_qcdm_qcxh");
	if (xz_qcdm_qcxh!=null)
	{
		xz_qcdm_qcxh=cf.GB2Uni(xz_qcdm_qcxh);
		if (!(xz_qcdm_qcxh.equals("")))	wheresql+=" and  (xz_qcdm.qcxh like '%"+xz_qcdm_qcxh+"%')";
	}
	xz_qcdm_sjxm=request.getParameter("xz_qcdm_sjxm");
	if (xz_qcdm_sjxm!=null)
	{
		xz_qcdm_sjxm=cf.GB2Uni(xz_qcdm_sjxm);
		if (!(xz_qcdm_sjxm.equals("")))	wheresql+=" and  (xz_qcdm.sjxm like '%"+xz_qcdm_sjxm+"%')";
	}
	xz_clwhfyb_xm=request.getParameter("xz_clwhfyb_xm");
	if (xz_clwhfyb_xm!=null)
	{
		xz_clwhfyb_xm=cf.GB2Uni(xz_clwhfyb_xm);
		if (!(xz_clwhfyb_xm.equals("")))	wheresql+=" and  (xz_clwhfyb.xm='"+xz_clwhfyb_xm+"')";
	}
	xz_clwhfyb_fy=request.getParameter("xz_clwhfyb_fy");
	if (xz_clwhfyb_fy!=null)
	{
		xz_clwhfyb_fy=xz_clwhfyb_fy.trim();
		if (!(xz_clwhfyb_fy.equals("")))	wheresql+=" and  (xz_clwhfyb.fy="+xz_clwhfyb_fy+") ";
	}
	xz_clwhfyb_djrq=request.getParameter("xz_clwhfyb_djrq");
	if (xz_clwhfyb_djrq!=null)
	{
		xz_clwhfyb_djrq=xz_clwhfyb_djrq.trim();
		if (!(xz_clwhfyb_djrq.equals("")))	wheresql+="  and (xz_clwhfyb.djrq>=TO_DATE('"+xz_clwhfyb_djrq+"','YYYY/MM/DD'))";
	}
	xz_clwhfyb_djrq=request.getParameter("xz_clwhfyb_djrq2");
	if (xz_clwhfyb_djrq!=null)
	{
		xz_clwhfyb_djrq=xz_clwhfyb_djrq.trim();
		if (!(xz_clwhfyb_djrq.equals("")))	wheresql+="  and (xz_clwhfyb.djrq<=TO_DATE('"+xz_clwhfyb_djrq+"','YYYY/MM/DD'))";
	}
	xz_clwhfyb_jsr=request.getParameter("xz_clwhfyb_jsr");
	if (xz_clwhfyb_jsr!=null)
	{
		xz_clwhfyb_jsr=cf.GB2Uni(xz_clwhfyb_jsr);
		if (!(xz_clwhfyb_jsr.equals("")))	wheresql+=" and  (xz_clwhfyb.jsr like '%"+xz_clwhfyb_jsr+"%')";
	}
	xz_clwhfyb_pzr=request.getParameter("xz_clwhfyb_pzr");
	if (xz_clwhfyb_pzr!=null)
	{
		xz_clwhfyb_pzr=cf.GB2Uni(xz_clwhfyb_pzr);
		if (!(xz_clwhfyb_pzr.equals("")))	wheresql+=" and  (xz_clwhfyb.pzr like '%"+xz_clwhfyb_pzr+"%')";
	}
	xz_clwhfyb_ssfgs=request.getParameter("xz_clwhfyb_ssfgs");
	if (xz_clwhfyb_ssfgs!=null)
	{
		xz_clwhfyb_ssfgs=cf.GB2Uni(xz_clwhfyb_ssfgs);
		if (!(xz_clwhfyb_ssfgs.equals("")))	wheresql+=" and  (xz_clwhfyb.ssfgs='"+xz_clwhfyb_ssfgs+"')";
	}
	xz_clwhfyb_lrr=request.getParameter("xz_clwhfyb_lrr");
	if (xz_clwhfyb_lrr!=null)
	{
		xz_clwhfyb_lrr=cf.GB2Uni(xz_clwhfyb_lrr);
		if (!(xz_clwhfyb_lrr.equals("")))	wheresql+=" and  (xz_clwhfyb.lrr='"+xz_clwhfyb_lrr+"')";
	}
	xz_clwhfyb_lrsj=request.getParameter("xz_clwhfyb_lrsj");
	if (xz_clwhfyb_lrsj!=null)
	{
		xz_clwhfyb_lrsj=xz_clwhfyb_lrsj.trim();
		if (!(xz_clwhfyb_lrsj.equals("")))	wheresql+="  and (xz_clwhfyb.lrsj>=TO_DATE('"+xz_clwhfyb_lrsj+"','YYYY/MM/DD'))";
	}
	xz_clwhfyb_lrsj=request.getParameter("xz_clwhfyb_lrsj2");
	if (xz_clwhfyb_lrsj!=null)
	{
		xz_clwhfyb_lrsj=xz_clwhfyb_lrsj.trim();
		if (!(xz_clwhfyb_lrsj.equals("")))	wheresql+="  and (xz_clwhfyb.lrsj<=TO_DATE('"+xz_clwhfyb_lrsj+"','YYYY/MM/DD'))";
	}


	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT TO_CHAR(xz_clwhfyb.djxh) djxh,xz_clwhfyb.qcph,xz_qcdm.qcxh,xz_qcdm.sjxm,xz_clwhfyb.xm,xz_clwhfyb.fy,xz_clwhfyb.djrq,xz_clwhfyb.jsr,xz_clwhfyb.pzr,a.dwmc ssfgs,b.dwmc fyfsbm,xz_clwhfyb.lrr,xz_clwhfyb.lrsj,xz_clwhfyb.bz  ";
	ls_sql+=" FROM sq_dwxx a,sq_dwxx b,xz_clwhfyb,xz_qcdm  ";
    ls_sql+=" where xz_clwhfyb.qcph=xz_qcdm.qcph and xz_clwhfyb.ssfgs=a.dwbh and xz_clwhfyb.fyfsbm=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Xz_clwhfybCxList.jsp","SelectCxXz_clwhfyb.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//设置显示列
	String[] disColName={"djxh","xz_clwhfyb_qcph","xz_qcdm_qcxh","xz_qcdm_sjxm","xz_clwhfyb_xm","xz_clwhfyb_fy","xz_clwhfyb_djrq","xz_clwhfyb_jsr","xz_clwhfyb_pzr","sq_dwxx_dwmc","xz_clwhfyb_lrr","xz_clwhfyb_lrsj","xz_clwhfyb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"djxh"};
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
  <B><font size="3">车辆附加费查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">登记序号</td>
	<td  width="8%">汽车牌号</td>
	<td  width="10%">汽车型号</td>
	<td  width="4%">目前司机姓名</td>
	<td  width="6%">项目</td>
	<td  width="8%">费用</td>
	<td  width="6%">费用发生日期</td>
	<td  width="4%">经手人</td>
	<td  width="4%">批准人</td>
	<td  width="8%">所属分公司</td>
	<td  width="9%">费用发生部门</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="17%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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