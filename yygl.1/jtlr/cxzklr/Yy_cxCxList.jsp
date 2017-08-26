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
	String yy_cx_zqs=null;
	String yy_cx_yy_cx_fgs=null;
	String yy_cx_yy_cxzjzk_qnpj=null;
	String yy_cx_yy_cxzjzk_bzzs=null;
	String yy_cx_yy_cxzpzq_qnpj=null;
	String yy_cx_yy_cxzpzq_bzzs=null;
	String yy_cx_yy_cxgcfx_qnpj=null;
	String yy_cx_yy_cxgcfx_bzzs=null;
	String yy_cx_yy_cxrlhj_qnpj=null;
	String yy_cx_yy_cxrlhj_bzzs=null;
	String yy_cx_yy_cx_lrsj=null;
	String yy_cx_lrr=null;
	yy_cx_zqs=request.getParameter("yy_cx_zqs");
	if (yy_cx_zqs!=null)
	{
		yy_cx_zqs=yy_cx_zqs.trim();
		if (!(yy_cx_zqs.equals("")))	wheresql+=" and (yy_cx.zqs="+yy_cx_zqs+") ";
	}
	yy_cx_yy_cx_fgs=request.getParameter("yy_cx_yy_cx_fgs");
	if (yy_cx_yy_cx_fgs!=null)
	{
		yy_cx_yy_cx_fgs=cf.GB2Uni(yy_cx_yy_cx_fgs);
		if (!(yy_cx_yy_cx_fgs.equals("")))	wheresql+=" and  (yy_cx.yy_cx_fgs='"+yy_cx_yy_cx_fgs+"')";
	}
	yy_cx_yy_cxzjzk_qnpj=request.getParameter("yy_cx_yy_cxzjzk_qnpj");
	if (yy_cx_yy_cxzjzk_qnpj!=null)
	{
		yy_cx_yy_cxzjzk_qnpj=yy_cx_yy_cxzjzk_qnpj.trim();
		if (!(yy_cx_yy_cxzjzk_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxzjzk_qnpj="+yy_cx_yy_cxzjzk_qnpj+") ";
	}
	yy_cx_yy_cxzjzk_bzzs=request.getParameter("yy_cx_yy_cxzjzk_bzzs");
	if (yy_cx_yy_cxzjzk_bzzs!=null)
	{
		yy_cx_yy_cxzjzk_bzzs=yy_cx_yy_cxzjzk_bzzs.trim();
		if (!(yy_cx_yy_cxzjzk_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxzjzk_bzzs="+yy_cx_yy_cxzjzk_bzzs+") ";
	}
	yy_cx_yy_cxzpzq_qnpj=request.getParameter("yy_cx_yy_cxzpzq_qnpj");
	if (yy_cx_yy_cxzpzq_qnpj!=null)
	{
		yy_cx_yy_cxzpzq_qnpj=yy_cx_yy_cxzpzq_qnpj.trim();
		if (!(yy_cx_yy_cxzpzq_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxzpzq_qnpj="+yy_cx_yy_cxzpzq_qnpj+") ";
	}
	yy_cx_yy_cxzpzq_bzzs=request.getParameter("yy_cx_yy_cxzpzq_bzzs");
	if (yy_cx_yy_cxzpzq_bzzs!=null)
	{
		yy_cx_yy_cxzpzq_bzzs=yy_cx_yy_cxzpzq_bzzs.trim();
		if (!(yy_cx_yy_cxzpzq_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxzpzq_bzzs="+yy_cx_yy_cxzpzq_bzzs+") ";
	}
	yy_cx_yy_cxgcfx_qnpj=request.getParameter("yy_cx_yy_cxgcfx_qnpj");
	if (yy_cx_yy_cxgcfx_qnpj!=null)
	{
		yy_cx_yy_cxgcfx_qnpj=yy_cx_yy_cxgcfx_qnpj.trim();
		if (!(yy_cx_yy_cxgcfx_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxgcfx_qnpj="+yy_cx_yy_cxgcfx_qnpj+") ";
	}
	yy_cx_yy_cxgcfx_bzzs=request.getParameter("yy_cx_yy_cxgcfx_bzzs");
	if (yy_cx_yy_cxgcfx_bzzs!=null)
	{
		yy_cx_yy_cxgcfx_bzzs=yy_cx_yy_cxgcfx_bzzs.trim();
		if (!(yy_cx_yy_cxgcfx_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxgcfx_bzzs="+yy_cx_yy_cxgcfx_bzzs+") ";
	}
	yy_cx_yy_cxrlhj_qnpj=request.getParameter("yy_cx_yy_cxrlhj_qnpj");
	if (yy_cx_yy_cxrlhj_qnpj!=null)
	{
		yy_cx_yy_cxrlhj_qnpj=yy_cx_yy_cxrlhj_qnpj.trim();
		if (!(yy_cx_yy_cxrlhj_qnpj.equals("")))	wheresql+=" and  (yy_cx.yy_cxrlhj_qnpj="+yy_cx_yy_cxrlhj_qnpj+") ";
	}
	yy_cx_yy_cxrlhj_bzzs=request.getParameter("yy_cx_yy_cxrlhj_bzzs");
	if (yy_cx_yy_cxrlhj_bzzs!=null)
	{
		yy_cx_yy_cxrlhj_bzzs=yy_cx_yy_cxrlhj_bzzs.trim();
		if (!(yy_cx_yy_cxrlhj_bzzs.equals("")))	wheresql+=" and  (yy_cx.yy_cxrlhj_bzzs="+yy_cx_yy_cxrlhj_bzzs+") ";
	}
	yy_cx_yy_cx_lrsj=request.getParameter("yy_cx_yy_cx_lrsj");
	if (yy_cx_yy_cx_lrsj!=null)
	{
		yy_cx_yy_cx_lrsj=yy_cx_yy_cx_lrsj.trim();
		if (!(yy_cx_yy_cx_lrsj.equals("")))	wheresql+="  and (yy_cx.yy_cx_lrsj>=TO_DATE('"+yy_cx_yy_cx_lrsj+"','YYYY/MM/DD'))";
	}
	yy_cx_yy_cx_lrsj=request.getParameter("yy_cx_yy_cx_lrsj2");
	if (yy_cx_yy_cx_lrsj!=null)
	{
		yy_cx_yy_cx_lrsj=yy_cx_yy_cx_lrsj.trim();
		if (!(yy_cx_yy_cx_lrsj.equals("")))	wheresql+="  and (yy_cx.yy_cx_lrsj<=TO_DATE('"+yy_cx_yy_cx_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_cx_lrr=request.getParameter("yy_cx_lrr");
	if (yy_cx_lrr!=null)
	{
		yy_cx_lrr=cf.GB2Uni(yy_cx_lrr);
		if (!(yy_cx_lrr.equals("")))	wheresql+=" and  (yy_cx.lrr='"+yy_cx_lrr+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT yy_cx.zqs,sq_dwxx.dwmc,yy_cx.yy_cxzjzk_qnpj||'%',yy_cx.yy_cxzjzk_bzzs||'%',yy_cx.yy_cxzpzq_qnpj||'%',yy_cx.yy_cxzpzq_bzzs||'%',yy_cx.yy_cxgcfx_qnpj||'%',yy_cx.yy_cxgcfx_bzzs||'%',yy_cx.yy_cxrlhj_qnpj||'%',yy_cx.yy_cxrlhj_bzzs||'%',yy_cx.yy_cx_lrsj,yy_cx.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_cx  ";
    ls_sql+=" where yy_cx.yy_cx_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_cx.zqs,yy_cx.yy_cx_fgs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_cxCxList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
  <td  width="6%" rowspan="2">周期数</td>
  <td  width="10%" rowspan="2">所属分公司</td>
  <td colspan="2">直接折扣</td>
  <td colspan="2">赠品赠券</td>
  <td colspan="2">工程返现</td>
  <td colspan="2">让利合计</td>
  <td  width="8%" rowspan="2">录入时间</td>
  <td  width="6%" rowspan="2">录入人</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
	<td  width="7%">去年平均(%)</td>
	<td  width="7%">本周指数(%)</td>
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