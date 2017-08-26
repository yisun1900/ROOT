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
	String yy_lr_zqs=null;
	String yy_lr_yy_lr_fgs=null;
	String yy_lr_yy_lrglf_ysbl=null;
	String yy_lr_yy_lrglf_sjsq=null;
	String yy_lr_yy_lrsj_ysbl=null;
	String yy_lr_yy_lrsj_sjsq=null;
	String yy_lr_yy_lrgc_qnpj=null;
	String yy_lr_yy_lrgc_bzzs=null;
	String yy_lr_yy_lrzc_qnpj=null;
	String yy_lr_yy_lrzc_bzzs=null;
	String yy_lr_yy_lr_lrsj=null;
	String yy_lr_lrr=null;
	yy_lr_zqs=request.getParameter("yy_lr_zqs");
	if (yy_lr_zqs!=null)
	{
		yy_lr_zqs=yy_lr_zqs.trim();
		if (!(yy_lr_zqs.equals("")))	wheresql+=" and (yy_lr.zqs="+yy_lr_zqs+") ";
	}
	yy_lr_yy_lr_fgs=request.getParameter("yy_lr_yy_lr_fgs");
	if (yy_lr_yy_lr_fgs!=null)
	{
		yy_lr_yy_lr_fgs=cf.GB2Uni(yy_lr_yy_lr_fgs);
		if (!(yy_lr_yy_lr_fgs.equals("")))	wheresql+=" and  (yy_lr.yy_lr_fgs='"+yy_lr_yy_lr_fgs+"')";
	}
	yy_lr_yy_lrglf_ysbl=request.getParameter("yy_lr_yy_lrglf_ysbl");
	if (yy_lr_yy_lrglf_ysbl!=null)
	{
		yy_lr_yy_lrglf_ysbl=yy_lr_yy_lrglf_ysbl.trim();
		if (!(yy_lr_yy_lrglf_ysbl.equals("")))	wheresql+=" and  (yy_lr.yy_lrglf_ysbl="+yy_lr_yy_lrglf_ysbl+") ";
	}
	yy_lr_yy_lrglf_sjsq=request.getParameter("yy_lr_yy_lrglf_sjsq");
	if (yy_lr_yy_lrglf_sjsq!=null)
	{
		yy_lr_yy_lrglf_sjsq=yy_lr_yy_lrglf_sjsq.trim();
		if (!(yy_lr_yy_lrglf_sjsq.equals("")))	wheresql+=" and  (yy_lr.yy_lrglf_sjsq="+yy_lr_yy_lrglf_sjsq+") ";
	}
	yy_lr_yy_lrsj_ysbl=request.getParameter("yy_lr_yy_lrsj_ysbl");
	if (yy_lr_yy_lrsj_ysbl!=null)
	{
		yy_lr_yy_lrsj_ysbl=yy_lr_yy_lrsj_ysbl.trim();
		if (!(yy_lr_yy_lrsj_ysbl.equals("")))	wheresql+=" and  (yy_lr.yy_lrsj_ysbl="+yy_lr_yy_lrsj_ysbl+") ";
	}
	yy_lr_yy_lrsj_sjsq=request.getParameter("yy_lr_yy_lrsj_sjsq");
	if (yy_lr_yy_lrsj_sjsq!=null)
	{
		yy_lr_yy_lrsj_sjsq=yy_lr_yy_lrsj_sjsq.trim();
		if (!(yy_lr_yy_lrsj_sjsq.equals("")))	wheresql+=" and  (yy_lr.yy_lrsj_sjsq="+yy_lr_yy_lrsj_sjsq+") ";
	}
	yy_lr_yy_lrgc_qnpj=request.getParameter("yy_lr_yy_lrgc_qnpj");
	if (yy_lr_yy_lrgc_qnpj!=null)
	{
		yy_lr_yy_lrgc_qnpj=yy_lr_yy_lrgc_qnpj.trim();
		if (!(yy_lr_yy_lrgc_qnpj.equals("")))	wheresql+=" and  (yy_lr.yy_lrgc_qnpj="+yy_lr_yy_lrgc_qnpj+") ";
	}
	yy_lr_yy_lrgc_bzzs=request.getParameter("yy_lr_yy_lrgc_bzzs");
	if (yy_lr_yy_lrgc_bzzs!=null)
	{
		yy_lr_yy_lrgc_bzzs=yy_lr_yy_lrgc_bzzs.trim();
		if (!(yy_lr_yy_lrgc_bzzs.equals("")))	wheresql+=" and  (yy_lr.yy_lrgc_bzzs="+yy_lr_yy_lrgc_bzzs+") ";
	}
	yy_lr_yy_lrzc_qnpj=request.getParameter("yy_lr_yy_lrzc_qnpj");
	if (yy_lr_yy_lrzc_qnpj!=null)
	{
		yy_lr_yy_lrzc_qnpj=yy_lr_yy_lrzc_qnpj.trim();
		if (!(yy_lr_yy_lrzc_qnpj.equals("")))	wheresql+=" and  (yy_lr.yy_lrzc_qnpj="+yy_lr_yy_lrzc_qnpj+") ";
	}
	yy_lr_yy_lrzc_bzzs=request.getParameter("yy_lr_yy_lrzc_bzzs");
	if (yy_lr_yy_lrzc_bzzs!=null)
	{
		yy_lr_yy_lrzc_bzzs=yy_lr_yy_lrzc_bzzs.trim();
		if (!(yy_lr_yy_lrzc_bzzs.equals("")))	wheresql+=" and  (yy_lr.yy_lrzc_bzzs="+yy_lr_yy_lrzc_bzzs+") ";
	}
	yy_lr_yy_lr_lrsj=request.getParameter("yy_lr_yy_lr_lrsj");
	if (yy_lr_yy_lr_lrsj!=null)
	{
		yy_lr_yy_lr_lrsj=yy_lr_yy_lr_lrsj.trim();
		if (!(yy_lr_yy_lr_lrsj.equals("")))	wheresql+="  and (yy_lr.yy_lr_lrsj>=TO_DATE('"+yy_lr_yy_lr_lrsj+"','YYYY/MM/DD'))";
	}
	yy_lr_yy_lr_lrsj=request.getParameter("yy_lr_yy_lr_lrsj2");
	if (yy_lr_yy_lr_lrsj!=null)
	{
		yy_lr_yy_lr_lrsj=yy_lr_yy_lr_lrsj.trim();
		if (!(yy_lr_yy_lr_lrsj.equals("")))	wheresql+="  and (yy_lr.yy_lr_lrsj<=TO_DATE('"+yy_lr_yy_lr_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	yy_lr_lrr=request.getParameter("yy_lr_lrr");
	if (yy_lr_lrr!=null)
	{
		yy_lr_lrr=cf.GB2Uni(yy_lr_lrr);
		if (!(yy_lr_lrr.equals("")))	wheresql+=" and  (yy_lr.lrr='"+yy_lr_lrr+"')";
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	ls_sql="SELECT yy_lr.zqs,sq_dwxx.dwmc,yy_lr.yy_lrglf_ysbl||'%',yy_lr.yy_lrglf_sjsq||'%',yy_lr.yy_lrsj_ysbl||'%',yy_lr.yy_lrsj_sjsq||'%',yy_lr.yy_lrgc_qnpj||'%',yy_lr.yy_lrgc_bzzs||'%',yy_lr.yy_lrzc_qnpj||'%',yy_lr.yy_lrzc_bzzs||'%',yy_lr.yy_lr_lrsj,yy_lr.lrr  ";
	ls_sql+=" FROM sq_dwxx,yy_lr  ";
    ls_sql+=" where yy_lr.yy_lr_fgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by yy_lr.zqs,yy_lr.yy_lr_fgs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_lrCxList.jsp","","","");
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
	pageObj.printPageLink(100);
%>

<tr bgcolor="#CCCCCC"  align="center">
  <td  width="6%" rowspan="2">周期数</td>
  <td  width="10%" rowspan="2">分公司</td>
  <td colspan="2">客户管理费比例</td>
  <td colspan="2">税金及其他比例</td>
  <td colspan="2">工程毛利率</td>
  <td colspan="2">主材毛利率</td>
  <td  width="8%" rowspan="2">录入时间</td>
  <td  width="6%" rowspan="2">录入人</td>
</tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">应收比例(%)</td>
	<td  width="7%">实际收取(%)</td>
	<td  width="7%">应收比例(%)</td>
	<td  width="7%">实际收取(%)</td>
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